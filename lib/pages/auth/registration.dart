

import 'package:flutter/material.dart';
import 'package:travlon/utils/constants/constantsOfTravlne.dart';
import 'package:travlon/utils/widgets/edttravelon.dart';
import 'package:travlon/utils/widgets/txtOftravalon.dart';

import '../../utils/widgets/btnTravelon.dart';
import '../homoeScreen.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  TextEditingController name=TextEditingController();
  TextEditingController place=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController confirmpassword=TextEditingController();

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
                      txtOftravalon(data: "Travel", textStyle: Constants().boldstylewhite(30)),
                      txtOftravalon(data: "On", textStyle: Constants().boldstyleblack(30)),

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

                  decoration:BoxDecoration(
                    borderRadius:  Constants().radiusreturningone(),
                    color: Colors.white,
                  ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        txtOftravalon(data: "Create an account.", textStyle: Constants().mediumstyleblack(26))
                      ],
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        txtOftravalon(data: "Already a member?", textStyle: Constants().lightstyle1(14)),
                        SizedBox(
                         width: 8,
                        ),
                        txtOftravalon(data: "Sign In", textStyle: Constants().Stylemediuemgreen(14))

                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    edttravlon(textEditingController: name, hinttext:"Enter your name",),
                    SizedBox(
                      height: 20,
                    ),
                    edttravlon(textEditingController: place, hinttext:"Enter your place",),
                    SizedBox(
                      height: 20,
                    ),
                    edttravlon(textEditingController: email, hinttext:"Enter your email",  ),
                    SizedBox(
                      height: 20,
                    ),
                    edttravlon(textEditingController: password, hinttext:"Enter your password",),
                    SizedBox(
                      height: 20,
                    ),
                    edttravlon(textEditingController: confirmpassword, hinttext:"Confirm password",),
                    SizedBox(
                      height: 60,
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
                            data: "Sign In", textStyle: Constants().boldstylewhite(16)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
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
