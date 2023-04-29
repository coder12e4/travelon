import 'package:flutter/material.dart';
class travelogList extends StatefulWidget {
  const travelogList({Key? key}) : super(key: key);

  @override
  State<travelogList> createState() => _travelogListState();
}

class _travelogListState extends State<travelogList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Expanded(

          child: ListView.builder(itemBuilder: (context,index){
            return Container(
              child: Column(
                children: [


                ],

              ),
            );

          }
          ),
        ),
      ),
    );
  }
}
