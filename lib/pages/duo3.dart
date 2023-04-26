
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travlon/pages/addOns.dart';

class duoThree extends StatefulWidget {
  const duoThree({Key? key}) : super(key: key);

  @override
  State<duoThree> createState() => _duoThreeState();
}

class _duoThreeState extends State<duoThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,

        child: Stack(
          children: [
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                top: 0,
                child: Image.asset("assets/images/istock (1).jpg",
                fit: BoxFit.cover,
                ),

            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.indigo.shade900.withOpacity(.8),
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Provider.of<Helper>(context).text1('duolingo', 60, FontWeight.bold, Colors.white, 'duob')

                    ],
                  ),
                  Text(
                    "Learn Lanuages from Content You love",
                    textAlign: TextAlign.center,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'duob',fontWeight: FontWeight.w800,
                        color: Colors.white
                    ),
                  ),
                  Text(
                    "The Fast,Fun and effective way to Learn",
                    textAlign: TextAlign.center,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'duob',fontWeight: FontWeight.w800,
                        color: Colors.white
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                              child: Provider.of<Helper>(context).cont2(color: Colors.orange, label: "Get started for free!", width: 350, height: 70,sty: TextStyle(fontSize: 20,color: Colors.white)),


                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Provider.of<Helper>(context).cont2(color: Colors.white, label: "I already have an account", width: 350, height: 70,sty: TextStyle(fontSize: 20,color: Colors.black))

                        ],
                      )
                    ],
                  )
                ],
              ) ,

            ),



          ],
        ),
      ),
    );
  }
}
