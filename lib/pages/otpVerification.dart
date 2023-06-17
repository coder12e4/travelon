import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:travlon/cubit/verify/verify_otp_cubit.dart';
import 'package:travlon/models/fpswdOTP.dart';
import 'package:travlon/pages/auth/loginPage.dart';
import 'package:travlon/repository/otpVerifyRepo.dart';
import 'package:travlon/utils/widgets/btnTravelon.dart';
import 'package:travlon/utils/widgets/edttravelon.dart';

import 'package:travlon/utils/widgets/txtOftravalon.dart';

import '../utils/constants/constantsOfTravlne.dart';



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


                          Constants().loadPages(changepswd(), context);


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

class changepswd extends StatefulWidget {
  const changepswd({Key? key}) : super(key: key);

  @override
  State<changepswd> createState() => _changepswdState();
}

class _changepswdState extends State<changepswd> {
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  bool passwordVisible = false;




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
                txtOftravalon(data: "Enter New Password", textStyle: Constants().mediumstyleblackmon(20)),
                SizedBox(
                  height: 10,
                ),
                edttravlon(textEditingController: password, hinttext: "At least 8 digits"),
                SizedBox(
                  height: 20,
                ),
                 txtOftravalon(data: "Confirm Password", textStyle: Constants().mediumstyleblackmon(20)),
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
                      icon: Icon(passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,color: HexColor(Constants().pastelgreen300),),
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
                btnthreeTravelon(function: (){
                  Constants().loadPages(login(), context);
                },
                    height: 50,
                    childWid:txtOftravalon(data: 'Submit', textStyle: Constants(). mediumstylewhitemon(16))),

                Spacer()



              ],
            ),
          ),

    );
  }
}

