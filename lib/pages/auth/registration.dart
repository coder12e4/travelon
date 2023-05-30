import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:travlon/utils/constants/constantsOfTravlne.dart';
import 'package:travlon/utils/widgets/edttravelon.dart';
import 'package:travlon/utils/widgets/txtOftravalon.dart';

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
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  bool checkvalue = false;
  bool passwordVisible = false;
  bool confirmpasswordVisible = false;

  String dropdownValue = "BloodGroup";
  List<String> items =["BloodGroup","A+","b+","AB+","O+","A-","B-","AB-","o+"];

  @override
  void initState() {
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
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.green.shade700,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      txtOftravalon(
                          data: "Travel",
                          textStyle: Constants().boldstylewhite(30)),
                      txtOftravalon(
                          data: "On",
                          textStyle: Constants().boldstyleblack(30)),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * .87,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                  gradient: LinearGradient(colors: [Colors.grey,Colors.white],
                  begin: Alignment.bottomCenter,
                    end: Alignment.topCenter
                  )
                ),


                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(
                      flex: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        txtOftravalon(
                            data: "Create an account.",
                            textStyle: Constants().mediumstyleblack(26))
                      ],
                    ),
                    SizedBox(
                      height: 10,
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
                        txtOftravalon(
                            data: "Sign In",
                            textStyle: Constants().Stylemediuemgreen(14))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 40,
                      child: edttravlon(
                        textEditingController: firstname,
                        hinttext: "Firstname",
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      height: 40,
                      child: edttravlon(
                        textEditingController: lastname,
                        hinttext: "Lastname",
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      height: 40,
                      child: edttravlon(
                        textEditingController: address,
                        hinttext: "Address",
                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 170,
                          height: 40,
                          child: edttravlon(
                            textEditingController: pinNumber,
                            hinttext: "Enter your PIN",
                          ),
                        ),
                        SizedBox(
                          width: 170,
                          height: 40,
                          child: edttravlon(
                            textEditingController: phonenumber,
                            hinttext: "Phonenumber",
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 170,
                          height: 40,
                          child: datetxt(
                            function: () {
                              _selectDate(context);
                            },
                            textEditingController: DoB,
                            hinttext:
                                ("${selectedDate.toLocal()}".split(' ')[0]),
                          ),
                        ),
                       Container(
                              padding: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color:Colors.green.shade200,
                            borderRadius: Constants().radiusreturningthree(),
                          border: Border.all(color: HexColor(Constants().pastelgreen700),)
                          ),
                          width: 170,
                          height: 40,
                          child:DropdownButton(
                            iconSize: 20,
                            iconEnabledColor:  HexColor(Constants().pastelgreen700),


                            menuMaxHeight: 100,
                            value: dropdownValue,
                            items: items.map<DropdownMenuItem<String>>((String value){
                              return DropdownMenuItem(
                                  value:  value,
                                  child: txtOftravalon(data: value, textStyle: Constants().Regularstyleblack(14))
                                  );
                            }).toList(),
                            onChanged: (String? newValue){
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    SizedBox(
                      height: 40,
                      child: edttravlon(
                        textEditingController: email,
                        hinttext: "Email",
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      height: 40,
                      child: TextField(
                        controller: password,
                        obscureText: passwordVisible,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.green.shade200,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: Constants().radiusreturningthree(),
                              borderSide: BorderSide(
                                color: HexColor(Constants().pastelgreen700),
                              )),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: Constants().radiusreturningthree(),
                            borderSide: BorderSide(
                              color: HexColor(Constants().pastelgreen700),
                            ),
                          ),
                          hintText: "Password",
                          hintStyle: Constants().RegularstyleblackMon(14),
                          helperStyle: TextStyle(color: Colors.green),
                          suffixIcon: IconButton(
                            icon: Icon(passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
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
                    Spacer(),
                    SizedBox(
                      height: 64,
                      child: TextField(
                        controller: confirmpassword,
                        obscureText: confirmpasswordVisible,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.green.shade200,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: Constants().radiusreturningthree(),
                              borderSide: BorderSide(
                                color: HexColor(Constants().pastelgreen700),
                              )),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: Constants().radiusreturningthree(),
                            borderSide: BorderSide(
                              color: HexColor(Constants().pastelgreen700),
                            ),
                          ),
                          hintText: "Confirm Password",
                          hintStyle: Constants().RegularstyleblackMon(14),
                          helperText: "Password must contain special character",
                          helperStyle: TextStyle(color: Colors.green),
                          suffixIcon: IconButton(
                            icon: Icon(confirmpasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(
                                () {
                                  confirmpasswordVisible =
                                      !confirmpasswordVisible;
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
                    Spacer(),
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
                            data:
                                "Agree with User Agreement and Privacy Policy",
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
                          /*   Constants().loadPages(homeScreen(), context);
                       */
                        },
                        height: 50,
                        width: double.infinity,
                        childWid: txtOftravalon(
                            data: "Sign In",
                            textStyle: Constants().boldstylewhite(16)),
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
