import 'package:flutter/material.dart';
import 'package:travlon/utils/widgets/btnTravelon.dart';

import '../../utils/constants/constantsOfTravlne.dart';
import '../../utils/widgets/appbar.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../utils/widgets/edttravelon.dart';
import '../../utils/widgets/txtOftravalon.dart';
import 'package:hexcolor/hexcolor.dart';

class addplaces extends StatefulWidget {
  const addplaces({Key? key}) : super(key: key);

  @override
  State<addplaces> createState() => _addplacesState();
}

class _addplacesState extends State<addplaces> {
  TextEditingController name = TextEditingController();
  TextEditingController place = TextEditingController();
  TextEditingController details = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController location = TextEditingController();
  String dropdownvalue = "Districts";
  String dropdownvalue1 = "Kerala";
  List<String> items = [
    "Districts",
    "Kasargode",
    "Kannur",
    "Kozhikode",
    "Wayanad",
    "Malappuram",
    "Palakkad",
    "Thrissur",
    "Ernakulam",
    "Idukki",
    "Alappuzha",
    "Kottayam",
    "Pathanamthitta",
    "Kollam",
    "Trivandrum",
  ];
  List<String> states = ["Kerala"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     /* appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60), child: addplaceappBar()),*/
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(20),
              dashPattern: [10, 10],
              color: HexColor(Constants().pastelgreen200),
              strokeWidth: 2,
              child: Container(
                height: 200,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: Constants().radiusreturning(),
                ),
                child: txtOftravalon(
                  data: "Add Image",
                  textStyle: Constants().RegularstylegreenMon(20),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            edttravlon(
              textEditingController: name,
              hinttext: "Place's Name...",
            ),
            SizedBox(
              height: 10,
            ),
            edttravlon(
              textEditingController: place,
              hinttext: "Street Name...",
            ),

            SizedBox(
              height: 10,
            ),
            edttravlon(
              textEditingController: address,
              hinttext: "Address...",
            ),
            SizedBox(
              height: 10,
            ),
            edttravlon(
              textEditingController: location,
              hinttext: "Add Location",
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 150,
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
                      menuMaxHeight: 100,
                      value: dropdownvalue,
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
                          dropdownvalue = newValue!;
                        });
                      }),
                ),

                Container(
                  height: 50,
                  width: 120,
                  alignment: Alignment.center,
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
                      menuMaxHeight: 100,
                      icon: SizedBox.shrink(),
                      value: dropdownvalue1,
                      items:
                          states.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem(
                            value: value,
                            child: txtOftravalon(
                                data: value,
                                textStyle:
                                    Constants().RegularstyleblackMon(14)));
                      }).toList(),
                      onChanged: (String? newValue1) {
                        setState(() {
                          dropdownvalue1 = newValue1!;
                        });
                      }),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 100,
              child: edtCaptiontravlon(
                textEditingController: details,
                hinttext: "Write a caption about this place...",
              ),
            ),
            btnthreeTravelon(
              width: 200,
              height: 50,
              function: (){},
              childWid: txtOftravalon(
                data:"Submit",
                textStyle:Constants().boldstylewhite(14),
              ),
            )
          ],
        ),
      ),
    );
  }
}
