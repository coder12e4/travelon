import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:travlon/cubit/newPswd/new_pswd_cubit.dart';
import 'package:travlon/cubit/verify/verify_otp_cubit.dart';
import 'package:travlon/models/fpswdOTP.dart';
import 'package:travlon/models/newPswd.dart';
import 'package:travlon/pages/auth/loginPage.dart';
import 'package:travlon/repository/fpswdRepo.dart';
import 'package:travlon/repository/newpswdRepo.dart';
import 'package:travlon/repository/otpVerifyRepo.dart';
import 'package:travlon/utils/widgets/btnTravelon.dart';
import 'package:travlon/utils/widgets/edttravelon.dart';

import 'package:travlon/utils/widgets/txtOftravalon.dart';

import '../../utils/constants/constantsOfTravlne.dart';

class changepswd extends StatefulWidget {
  final String email;
  const changepswd({Key? key, required this.email}) : super(key: key);

  @override
  State<changepswd> createState() => _changepswdState();
}

class _changepswdState extends State<changepswd> {
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  TextEditingController username = TextEditingController();
  bool passwordVisible = false;
  late NewPswdCubit objnewpswdcubit;
  @override
  void initState() {
    objnewpswdcubit = NewPswdCubit(NewPswdInitial(), changePswd());
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            txtOftravalon(
                data: "Username",
                textStyle: Constants().mediumstyleblackmon(20)),
            SizedBox(
              height: 10,
            ),
            edttravlon(
                textEditingController: username, hinttext: "username"),
            SizedBox(
              height: 10,
            ),
            txtOftravalon(
                data: "Enter New Password",
                textStyle: Constants().mediumstyleblackmon(20)),
            SizedBox(
              height: 10,
            ),
            edttravlon(
                textEditingController: password, hinttext: "At least 8 digits"),
            SizedBox(
              height: 20,
            ),
            txtOftravalon(
                data: "Confirm Password",
                textStyle: Constants().mediumstyleblackmon(20)),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: confirmpassword,
              obscureText: passwordVisible,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                    borderRadius: Constants().radiusreturningthree(),
                    borderSide: BorderSide(
                      width: .5,
                      color: HexColor(Constants().pastelgreen400),
                    )),
                focusedBorder: OutlineInputBorder(
                  borderRadius: Constants().radiusreturningthree(),
                  borderSide: BorderSide(
                    color: HexColor(Constants().pastelgreen600),
                  ),
                ),
                hintText: "confirm Password",
                hintStyle: Constants().RegularstyleblackMon(14),
                helperStyle: TextStyle(color: Colors.green),
                suffixIcon: IconButton(
                  icon: Icon(
                    passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: HexColor(Constants().pastelgreen300),
                  ),
                  onPressed: () {
                    setState(
                      () {
                        passwordVisible = !passwordVisible;
                      },
                    );
                  },
                ),
                alignLabelWithHint: false,
              ),
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
            ),
            SizedBox(
              height: 20,
            ),
            btnthreeTravelon(
                function: () {
                  objnewpswdcubit.getNewPswd(
                      username.text.toString(),
                      password.text.toString(),
                      confirmpassword.text.toString());

                },
                height: 50,
                childWid: BlocProvider<NewPswdCubit>(
                  create: (context) => objnewpswdcubit,
                  child: BlocListener<NewPswdCubit, NewPswdState>(
                    listener: (context, state) {
                      if (state is NewPswdInitial) {
                      } else if (state is NewPswdLoading) {
                      } else if (state is NewPswdSuccess) {
                        newPswdModel j = state.obj;
                        String msg = j.msg.toString();
                        Fluttertoast.showToast(
                            msg: msg,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Colors.grey,
                            fontSize: 16);

                        Constants().loadPages(login(), context);
                      } else if (state is NewPswdError) {
                        Fluttertoast.showToast(
                            msg: "Password not changed.Try again",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    },
                    child: BlocBuilder<NewPswdCubit, NewPswdState>(
                      builder: (context, state) {
                        if (state is NewPswdInitial) {
                          return txtOftravalon(
                              data: 'Submit',
                              textStyle: Constants().mediumstylewhitemon(16));
                        } else if (state is NewPswdLoading) {
                          return Center(
                            child: Constants().spinkit(),
                          );
                        } else {
                          return txtOftravalon(
                              data: 'Submit',
                              textStyle: Constants().mediumstylewhitemon(16));
                        }
                      },
                    ),
                  ),
                )),
            Spacer()
          ],
        ),
      ),
    );
  }
}
