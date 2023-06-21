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

import '../utils/constants/constantsOfTravlne.dart';
import 'homeTabs/changepswd.dart';



class otpVerification extends StatefulWidget {
  final String email;
  const otpVerification({Key? key, required this.email}) : super(key: key);

  @override
  State<otpVerification> createState() => _otpVerificationState();
}

class _otpVerificationState extends State<otpVerification> {

  late VerifyOtpCubit objcerifycubit;

  TextEditingController v1=TextEditingController();
  TextEditingController v2=TextEditingController();
  TextEditingController v3=TextEditingController();
  TextEditingController v4=TextEditingController();

  TextEditingController username = TextEditingController();


  @override
  void initState() {
    objcerifycubit =VerifyOtpCubit(VerifyOtpInitial(), getOTP());
    // TODO: implement initState
    super.initState();
  }
  Widget _textFieldOTP(BuildContext context, {required bool first, last,required TextEditingController textEditingController}) {
    return Container(
      height: 60,
      width: 52,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          controller: textEditingController,
          autofocus: true,
          onChanged: (value) {
            if(value.length == 1 && last == false){
              FocusScope.of(context).nextFocus();
            }
            if(value.length == 0 && first == false){
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: HexColor(Constants().pastelgreen300)),
              borderRadius: BorderRadius.circular(6),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color:HexColor(Constants().pastelgreen400)),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            txtOftravalon(
                data: "OTP Verification",
                textStyle: Constants().boldstyleblackmon(22)),
            SizedBox(
              height: 20,
            ),
            txtOftravalon(
                data: " Enter code received on Your email",
                textStyle: Constants().RegularstyleblackMon(14)),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _textFieldOTP(context, first: true, last: false,textEditingController: v1),
                _textFieldOTP(context, first: false, last: false,textEditingController: v2),
                _textFieldOTP(context, first: false, last: false,textEditingController: v3),
                _textFieldOTP(context, first: false, last: false,textEditingController: v4),

              ],
            ),

            SizedBox(
              height: 20,
            ),
           Row(
             mainAxisAlignment:MainAxisAlignment.center ,
             children: [
               txtOftravalon(data: "Didn't received OTP ?  ", textStyle: Constants().Regularstylegrey(14)),
               txtOftravalon(data: "Resend", textStyle: Constants().RegularstylegreenMon(14)),
             ],
           ),
            SizedBox(
              height: 60,
            ),
            btnthreeTravelon(
                function: () {
                    objcerifycubit.verifyOTP(v1.text.toString()+v2.text.toString()+v3.text.toString()+v4.text.toString(),widget.email);
                print(v1.text.toString()+v2.text.toString()+v3.text.toString()+v4.text.toString());
                    },
                height: 50,
                childWid:BlocProvider<VerifyOtpCubit>(
                  create: (context)=>objcerifycubit,
                  child: BlocListener<VerifyOtpCubit,VerifyOtpState>(
                      listener:(context,state){
                        if (state is VerifyOtpInitial){
                        }else if(state is VerifyOtpLoading){
                        }else if(state is VerifyOtpSuccess){

                          verifyModel k=state.obj;
                          String? msg=k.msg.toString();




                          Fluttertoast.showToast(
                              msg:msg,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Colors.grey,
                            fontSize: 16
                          );


                          Constants().loadPages(changepswd(email:username.text ,), context);


                        }else if(state is VerifyOtpError){
                          Fluttertoast.showToast(
                              msg: "Invalid OTP. Try again",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }else{}
                      },
                    child: BlocBuilder<VerifyOtpCubit,VerifyOtpState>(
                      builder: (context,state){
                        if(state is VerifyOtpInitial){
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Spacer(),
                              txtOftravalon(
                                  data: "Verify",
                                  textStyle: Constants().Regularstylewhite(20)),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width:8 ,
                              ),

                            ],
                          );
                        }else if(state is VerifyOtpLoading){
                          return Center(
                            child: Constants().spinkit(),
                          );
                        }else{
                          return  Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Spacer(),
                              txtOftravalon(
                                  data: "Verify",
                                  textStyle: Constants().Regularstylewhite(20)),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width:8 ,
                              ),

                            ],
                          );
                        }
                      },
                    ),
                  ),
                )


            ),

          ],
        ),
      ),
    );
  }
}


