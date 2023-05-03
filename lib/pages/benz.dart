import 'package:flutter/material.dart';
import 'package:travlon/utils/constants/constantsOfTravlne.dart';
import 'package:travlon/utils/widgets/txtOftravalon.dart';

class benz extends StatefulWidget {
  const benz({Key? key}) : super(key: key);

  @override
  State<benz> createState() => _benzState();
}

class _benzState extends State<benz> {
  String dropdownValue = 'A-Class';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .4,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              child: Image.asset(
                "assets/images/log.jpg",
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                  height: MediaQuery.of(context).size.height * .6,
                  decoration: Constants().decor1(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      txtOftravalon(data: "Select Your Dream Car Here ", textStyle: Constants().mediumstyleblack(24)),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DropdownButton(
                            value: dropdownValue,
                            items: [
                              'A-Class',
                              'E-Class',
                              'C-Class',
                              'S-Class',
                              'GLA',
                              'GLB',
                              'GLE',
                              'GLC',
                              'GLS'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem(
                                  value: value,
                                  child: txtOftravalon(
                                    data: value,
                                    textStyle: Constants().boldstyleblack(20),
                                  ));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
            Positioned(
                top: 40,
                left: 16,

                child: txtOftravalon(data: "BRING THE", textStyle:Constants().boldstyleblack(50))),
            Positioned
              (
              top: 80,
                left: 16,
                child: txtOftravalon(data: "BEAST INSIDE.", textStyle:Constants().boldstyleblack(50)))
          ],
        ),
      ),
    );
  }
}
