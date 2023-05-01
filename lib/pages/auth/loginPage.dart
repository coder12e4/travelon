import 'package:flutter/material.dart';
import 'package:travlon/utils/constants/constantsOfTravlne.dart';
import 'package:travlon/utils/widgets/btnTravelon.dart';
import 'package:travlon/utils/widgets/edttravelon.dart';
import 'package:travlon/utils/widgets/txtOftravalon.dart';

import '../homoeScreen.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                txtOftravalon(
                    data: "travelOn",
                    textStyle: Constants().boldstyleblack(30)),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                txtOftravalon(
                    data: "Login to your account",
                    textStyle: Constants().mediumstyleblack(24)),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            edttravlon(
                textEditingController: username, hinttext: "Username or email",),
            SizedBox(
              height: 10,
            ),
            edttravlon(textEditingController: password, hinttext: "Password", ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                txtOftravalon(
                    data: "Forgot Password?",
                    textStyle: Constants().mediumstyleblack(14)),
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
                      Constants().loadPages(homeScreen(), context);
                },
                height: 50,
                width: double.infinity,
                childWid: txtOftravalon(
                    data: "Log In", textStyle: Constants().boldstylewhite(16)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                txtOftravalon(
                    data: "Not a member?",
                    textStyle: Constants().mediumstyleblack(14)),
                txtOftravalon(
                    data: "Register now",
                    textStyle: Constants().mediumstyleblack(14)),
              ],
            ),
          

          ],
        ),
      ),
    );
  }
}
