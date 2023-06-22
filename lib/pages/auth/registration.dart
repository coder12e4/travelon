import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:travlon/cubit/register/register_cubit.dart';
import 'package:travlon/models/registermodel.dart';
import 'package:travlon/pages/auth/loginPage.dart';
import 'package:travlon/utils/constants/constantsOfTravlne.dart';
import 'package:travlon/utils/widgets/edttravelon.dart';
import 'package:travlon/utils/widgets/txtOftravalon.dart';

import '../../repository/registerRepo.dart';
import '../../utils/widgets/btnTravelon.dart';
import '../homeScreen.dart';

class registerone extends StatefulWidget {
  const registerone({Key? key}) : super(key: key);

  @override
  State<registerone> createState() => _registeroneState();
}

class _registeroneState extends State<registerone> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController DoB = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController bloodGroup = TextEditingController();
  TextEditingController pinNumber = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  bool checkvalue = false;
  bool passwordVisible = false;
  bool confirmpasswordVisible = false;
  String dropdownValue = "BloodGroup";
  List<String> items = [
    "BloodGroup",
    "A+",
    "b+",
    "AB+",
    "O+",
    "A-",
    "B-",
    "AB-",
    "o+"
  ];

  late RegisterCubit objregistercubit;

  @override
  void initState() {
    objregistercubit = RegisterCubit(RegisterInitial(), registration());
    passwordVisible = true;
    confirmpasswordVisible = true;
    // TODO: implement initState
    super.initState();
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1947, 8),
        lastDate: DateTime(2030));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                /* borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30), topLeft: Radius.circular(30)),
                gradient: LinearGradient(
                    colors: [Colors.lightGreenAccent, Colors.white],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter)*/
                ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    txtOftravalon(
                        data: "Create an account.",
                        textStyle: Constants().boldstyleblackmon(26))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                edttravlon(
                  textEditingController: firstname,
                  hinttext: "Firstname",
                ),
                edttravlon(
                  textEditingController: lastname,
                  hinttext: "Lastname",
                ),
                edttravlon(
                  textEditingController: address,
                  hinttext: "Address",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 170,
                      height: 50,
                      child: edttravlonNumber(
                        textEditingController: phonenumber,
                        hinttext: "Phonenumber",
                      ),
                    ),
                    SizedBox(
                      width: 170,
                      height: 50,
                      child: edttravlon(
                        textEditingController: pinNumber,
                        hinttext: "Enter your Postcode",
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 170,
                      height: 50,
                      child: datetxt(
                        function: () {
                          _selectDate(context);
                        },
                        textEditingController: DoB,
                        hinttext: ("${selectedDate.toLocal()}".split(' ')[0]),
                      ),
                    ),
                    Container(
                      width: 170,
                      height: 50,
                      padding: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: Constants().radiusreturningthree(),
                        border: Border.all(
                          width: .5,
                          color: HexColor(Constants().pastelgreen400),
                        ),
                      ),
                      child: DropdownButton(
                        underline: SizedBox(),
                        iconSize: 20,
                        iconEnabledColor: HexColor(Constants().pastelgreen700),
                        menuMaxHeight: 100,
                        value: dropdownValue,
                        items:
                            items.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem(
                              value: value,
                              child: txtOftravalon(
                                  data: value,
                                  textStyle:
                                      Constants().RegularstyleblackMon(14)));
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 250,
                      child: edttravlon(
                        textEditingController: emailController,
                        hinttext: "Email",
                      ),
                    ),
                    Spacer(),
                    btnforOTP(
                        function: () {
                          objregistercubit
                              .sentOtp(emailController.text.toString());
                        },
                        height: 50,
                        width: 100,
                        childWid: BlocProvider<RegisterCubit>(
                          create: (context) => objregistercubit,
                          child: BlocListener<RegisterCubit, RegisterState>(
                            listener: (context, state) {
                              if (state is otpRegInitial) {
                              } else if (state is otpRegLoading) {
                              } else if (state is otpRegSuccess) {
                                Fluttertoast.showToast(
                                    msg: "otp sent to $emailController ",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              } else if (state is otpRegError) {
                                Fluttertoast.showToast(
                                    msg:
                                        "otp not sent to $emailController try again",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              } else {}
                            },
                            child: BlocBuilder<RegisterCubit, RegisterState>(
                              builder: (context, state) {
                                if (state is otpRegInitial) {
                                  return txtOftravalon(
                                      data: "Send OTP",
                                      textStyle:
                                          Constants().RegularstyleblackMon(14));
                                  ;
                                } else if (state is otpRegLoading) {
                                  return Center(child: Constants().spinkit());
                                } else if (state is otpRegSuccess) {
                                  return txtOftravalon(
                                      data: "success",
                                      textStyle:
                                          Constants().RegularstyleblackMon(14));
                                } else if (state is otpRegError) {
                                  return txtOftravalon(
                                      data: "resend",
                                      textStyle:
                                          Constants().RegularstyleblackMon(14));
                                } else {
                                  return txtOftravalon(
                                      data: "OTP",
                                      textStyle:
                                          Constants().RegularstyleblackMon(14));
                                }
                              },
                            ),
                          ),
                        )),
                    Spacer(),
                  ],
                ),
                Container(
                  height: 50,
                  child: TextField(
                    controller: password,
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
                      hintText: "Password",
                      hintStyle: Constants().RegularstyleblackMon(14),
                      helperStyle: TextStyle(color: Colors.green),
                      suffixIcon: IconButton(
                        icon: Icon(
                          passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
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
                ),
                Container(
                  height: 50,
                  child: TextField(
                    controller: confirmpassword,
                    obscureText: confirmpasswordVisible,
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
                      hintText: "Confirm Password",
                      hintStyle: Constants().RegularstyleblackMon(14),
                      /* helperText: "Password must contain special character",*/
                      helperStyle: TextStyle(color: Colors.green),
                      suffixIcon: IconButton(
                        icon: Icon(
                            confirmpasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: HexColor(Constants().pastelgreen300)),
                        onPressed: () {
                          setState(
                            () {
                              confirmpasswordVisible = !confirmpasswordVisible;
                            },
                          );
                        },
                      ),
                      alignLabelWithHint: false,
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: this.checkvalue,
                      onChanged: (bool? checkvalue) {
                        setState(() {
                          this.checkvalue = checkvalue!;
                        });
                      },
                    ),
                    txtOftravalontwo(
                        data: "Agree with User Agreement and Privacy Policy",
                        textStyle: Constants().Regularstyleblack(14))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: btnthreeTravelon(
                    function: () {
                      objregistercubit.regFinal(
                          "amal",
                          "amalsekhar1@gmail.com",
                          "khfdsdhfkdkfd",
                          673517,
                          05051997,
                          8075756471,
                          "O",
                          "amal@123",
                          "amal@123",
                          1234);
                      Constants().loadPages(login(), context);
                    },
                    height: 50,
                    width: double.infinity,
                    childWid: BlocProvider<RegisterCubit>(
                      create: (context) => objregistercubit,
                      child: BlocListener<RegisterCubit, RegisterState>(
                        listener: (context, state) {
                          if (state is RegisterInitial) {
                          } else if (state is RegisterLoading) {
                          } else if (state is RegisterSuccess) {
                            registerModel objNew = state.obj;
                            objregistercubit.regFinal(
                                "amal",
                                "amalsekhar1@gmail.com",
                                "khfdsdhfkdkfd",
                                673517,
                                05051997,
                                8075756471,
                                "O",
                                "amal@123",
                                "amal@123",
                                1234);
                            Constants().loadPages(login(), context);
                          }
                        },
                        child: BlocBuilder<RegisterCubit, RegisterState>(
                          builder: (context, state) {
                            if (state is RegisterLoading) {
                              return Center(child: Constants().spinkit());
                            } else {
                              return txtOftravalon(
                                  data: "Sign Up",
                                  textStyle: Constants().boldstylewhite(16));
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    txtOftravalon(
                        data: "Already a member?",
                        textStyle: Constants().lightstyle1(14)),
                    SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
                      },
                      child: txtOftravalon(
                          data: "LogIn",
                          textStyle: Constants().Stylemediuemgreen(14)),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
