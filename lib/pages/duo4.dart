
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travlon/pages/addOns.dart';

class duoFour extends StatefulWidget {
  const duoFour({Key? key}) : super(key: key);

  @override
  State<duoFour> createState() => _duoFourState();
}

class _duoFourState extends State<duoFour> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20),
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Text(
              "Login to your account",
              textAlign: TextAlign.center,
              softWrap: false,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'duob',
                  fontWeight: FontWeight.w800,
                  color: Colors.white),
            ),
            TextField(
              textAlign: TextAlign.start,
              controller: username,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  hintText: "Username or email",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  errorBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.red.shade800),
                      borderRadius: BorderRadius.circular(20))),
            ),
            TextField(
              textAlign: TextAlign.start,
              controller: password,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  hintText: "Password",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(20)),
                  errorBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.red.shade800),
                      borderRadius: BorderRadius.circular(20))),
            )
          ],
        ),
      ),
    );
  }
}
