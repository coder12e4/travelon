import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../utils/constants/constantsOfTravlne.dart';
import '../../utils/widgets/appbar.dart';
import '../../utils/widgets/btnTravelon.dart';
import '../../utils/widgets/edttravelon.dart';
import '../../utils/widgets/txtOftravalon.dart';

class addTravelog extends StatefulWidget {
  const addTravelog({Key? key}) : super(key: key);

  @override
  State<addTravelog> createState() => _addTravelogState();
}

class _addTravelogState extends State<addTravelog> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  TextEditingController remark = TextEditingController();
  TextEditingController location = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     resizeToAvoidBottomInset: false,

     /* appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child:travelogappBar()
      ),*/
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
              textEditingController: title,
              hinttext: "Place's Name",
            ),

            SizedBox(
              height: 10,
            ),
            edttravlon(
              textEditingController: remark,
              hinttext: "Remark",
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
            SizedBox(
              height: 100,
              child: edtCaptiontravlon(
                textEditingController: content,
                hinttext: "Write a caption about this place",
              ),
            ),
            btnthreeTravelon(
              width: 200,
              height: 50,
              function: () {},
              childWid: txtOftravalon(
                data: "Submit",
                textStyle: Constants().boldstylewhite(14),
              ),
            )
          ],
        ),
      ),
    );
  }
}
