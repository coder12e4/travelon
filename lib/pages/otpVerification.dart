import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';


import 'package:hexcolor/hexcolor.dart';
import 'package:travlon/cubit/verify/verify_otp_cubit.dart';
import 'package:travlon/pages/auth/loginPage.dart';
import 'package:travlon/repository/otpVerifyRepo.dart';
import 'package:travlon/utils/widgets/btnTravelon.dart';
import 'package:travlon/utils/widgets/edttravelon.dart';

import 'package:travlon/utils/widgets/txtOftravalon.dart';
import 'package:otp_text_field/otp_text_field.dart';
import '../utils/constants/constantsOfTravlne.dart';



class otpVerification extends StatefulWidget {
  const otpVerification({Key? key}) : super(key: key);

  @override
  State<otpVerification> createState() => _otpVerificationState();
}

class _otpVerificationState extends State<otpVerification> {
  OtpFieldController otpController = OtpFieldController();
  late VerifyOtpCubit objcerifycubit;
  @override
  void initState() {
    objcerifycubit =VerifyOtpCubit(VerifyOtpInitial(), getOTP());
    // TODO: implement initState
    super.initState();
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
          OTPTextField(
            controller: otpController,
            width: MediaQuery.of(context).size.width,
            length: 4,
            fieldWidth: 48,
            textFieldAlignment: MainAxisAlignment.spaceEvenly,

            outlineBorderRadius: 15,
            style: TextStyle(fontSize: 17),



          ),
            SizedBox(
              height: 20,
            ),
           Row(
             mainAxisAlignment:MainAxisAlignment.center ,
             children: [
               txtOftravalon(data: "Didn't received OTP ?  ", textStyle: Constants().Regularstylegrey(14)),
               txtOftravalon(data: "OTP", textStyle: Constants().RegularstylegreenMon(14)),

             ],
           ),
            SizedBox(
              height: 60,
            ),
            btnthreeTravelon(
                function: () {
                    objcerifycubit.verifyOTP(otpController.toString());
                },
                height: 50,
                childWid:BlocProvider<VerifyOtpCubit>(
                  create: (context)=>objcerifycubit,
                  child: BlocListener<VerifyOtpCubit,VerifyOtpState>(
                      listener:(context,state){
                        if (state is VerifyOtpInitial){
                        }else if(state is VerifyOtpLoading){
                        }else if(state is VerifyOtpSuccess){
                          Fluttertoast.showToast(
                              msg:"Verified",
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

