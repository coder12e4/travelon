

import 'package:flutter/material.dart';
import 'package:travlon/pages/duo2.dart';



class Introductionpage extends StatefulWidget {
  const Introductionpage({Key? key}) : super(key: key);

  @override
  State<Introductionpage> createState() => _IntroductionpageState();
}

class _IntroductionpageState extends State<Introductionpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,

          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                top: 0,
                right: 0,
                left: 0,
                child: Image.asset(
                  "assets/images/shutt (1).jpg",
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.black,Colors.transparent]),

                ),
              ),
              Positioned(
                  bottom: 250,
                  left: 20,
                  child: Text(
                    "Where to Next? ",
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontFamily: 'regular'),
                  )),
              Positioned(
                  bottom: 180,
                  left: 20,

                  child: Text(
                    "Explore With Us!",
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontFamily: 'regular'),
                  )),
              Positioned(
                bottom: 80,
                  left: 20,
                  right: 150,
                  child: GestureDetector(
                    child: Container(
                      height: 70,
                      width: 200,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.yellow,
                      ),
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          fontFamily: 'bold',
                          fontSize: 20,
                        ),
                      ),
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>duoTwo()));
                  }
                  ),
              )

            ],
          )),
    );
  }
}
