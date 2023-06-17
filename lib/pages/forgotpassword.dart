import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:travlon/cubit/fpaswd/fpaswd_cubit.dart';
import 'package:travlon/models/fpswdModel.dart';
import 'package:travlon/pages/addOns.dart';
import 'package:travlon/pages/otpVerification.dart';
import 'package:travlon/repository/fpswdRepo.dart';
import 'package:travlon/utils/widgets/btnTravelon.dart';

import 'package:travlon/utils/widgets/txtOftravalon.dart';
import 'package:travlon/utils/constants/constantsOfTravlne.dart';

import '../utils/widgets/edttravelon.dart';

class fpasswd extends StatefulWidget {
  const fpasswd({Key? key}) : super(key: key);

  @override
  State<fpasswd> createState() => _fpasswdState();
}

class _fpasswdState extends State<fpasswd> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  late FpaswdCubit objfpswdcubit;
  @override
  void initState() {
    objfpswdcubit = FpaswdCubit(FpaswdInitial(), getPswd());

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            txtOftravalon(
                data: "Enter Email Address",
                textStyle: Constants().mediumstyleblackmon(24)),
            SizedBox(
              height: 20,
            ),
            edttravlon(
              textEditingController: username,
              hinttext: "Enter your email",
            ),
            SizedBox(
              height: 20,
            ),
            btnthreeTravelon(
                function: () {
                  objfpswdcubit.otpSend(username.text);
                },
                height: 50,
                childWid: BlocProvider<FpaswdCubit>(
                    create: (context) => objfpswdcubit,
                    child: BlocListener<FpaswdCubit, FpaswdState>(
                      listener: (context, state) {
                        if (state is FpaswdInitial) {
                        } else if (state is FpaswdLoading) {
                        } else if (state is FpaswdSuccess) {

                          fpswdModel obj=state.obj;
                          String message=obj.data!.expiresAt.toString();
                          Fluttertoast.showToast(
                              msg: "OTP sent to $username +Expires at $message",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.grey,
                              textColor: Colors.green,
                              fontSize: 16.0);
                          Constants().loadPages(otpVerification(email: username.text,), context);
                        } else if (state is FpaswdError) {
                          Fluttertoast.showToast(
                              msg: "otp not sent to $username try again",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else {}
                      },
                      child: BlocBuilder<FpaswdCubit, FpaswdState>(
                        builder: (context, state) {
                          if (state is FpaswdInitial) {
                            return txtOftravalon(
                                data: 'Send',
                                textStyle: Constants().mediumstylewhitemon(16));
                          } else if (state is FpaswdLoading) {
                            return Center(
                              child: Constants().spinkit(),
                            );
                          }
                          else if (state is FpaswdSuccess) {
                            return txtOftravalon(
                                data: 'Send',
                                textStyle: Constants().mediumstylewhitemon(16));
                          }


                          else {
                            return txtOftravalon(
                                data: 'Send',
                                textStyle: Constants().mediumstylewhitemon(16));
                          }
                        },
                      ),
                    )
                )
            ),
            SizedBox(
              height: 20,
            ),
            txtOftravalon(
                data: "or", textStyle: Constants().RegularstylegreenMon(14)),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.facebook_outlined)),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.mail_outline_rounded)),
                IconButton(onPressed: () {}, icon: Icon(Icons.apple)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
