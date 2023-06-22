import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travlon/cubit/travelog/travelog_cubit.dart';
import 'package:travlon/models/travelogModel.dart';
import 'package:travlon/repository/travelogRepo.dart';

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
late TravelogCubit objtravelcubit;
  File? imagePicked;
  bool isPicked =false;

@override
  void initState() {
  objtravelcubit = TravelogCubit(TravelogInitial(), addNewTravelog());

  // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(



      /* appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child:travelogappBar()
      ),*/
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(20),
                dashPattern: [10, 10],
                color: HexColor(Constants().pastelgreen200),
                strokeWidth: 2,
                child: GestureDetector(
                  onTap: ()async{
                    ImagePicker picker =ImagePicker();
                    XFile? image =
                        await picker.pickImage(source: ImageSource.gallery);
                    if(image!=null){
                      imagePicked = File(image.path);
                      setState(() {
                        isPicked = true;
                      });
                    }
                  },
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: Constants().radiusreturning(),
                    ),
                    child: isPicked? ClipRRect(
                      borderRadius: Constants().radiusreturning(),
                      child: Image.file(imagePicked!,
                      height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    )
                        :Container(
                      color: Colors.grey.shade200,
                      height: 200,
                      width: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_photo_alternate_outlined,
                            color: Colors.grey,
                            size: 50,
                          ),
                          txtOftravalon(
                            data: "Add Image",
                            textStyle: Constants().RegularstylegreenMon(20),
                          ),
                        ],
                      ),
                    )
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
                function: () {
                  objtravelcubit.newTravelog(title.text, location.text, location.text, content.text, remark.text);
                },
                childWid: BlocProvider<TravelogCubit>(
                  create: (context)=>objtravelcubit,
                  child: BlocListener<TravelogCubit,TravelogState>(
                    listener: (context,state){
    if(state is TravelogInitial){
    }else if (state is TravelogLoading){
    }else if (state is TravelogSuccess){
    travelogModel objlatest =state.objNext;
    String messege = objlatest.msg.toString();
    Fluttertoast.showToast(
    msg:messege,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    backgroundColor: Colors.greenAccent,
    fontSize: 16,
    );
    }else if (state is TravelogError){
    Fluttertoast.showToast(
    msg:"Failed to submit.Try again",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    backgroundColor: Colors.greenAccent,
    fontSize: 16,
    );
    }else{}
    },
                    child: BlocBuilder<TravelogCubit,TravelogState>(
                      builder: (context,state){
                        if (state is TravelogInitial){
                          return txtOftravalon(
                            data: "Submit",
                            textStyle: Constants().boldstylewhite(14),
                          );
                        }else if (state is TravelogLoading){
                          return Center(
                            child:  Constants().spinkit()
                          );
                        }else if (state is TravelogSuccess){
                          return txtOftravalon(
                            data: "Submit",
                            textStyle: Constants().boldstylewhite(14),
                          );
                        }else {
                          return txtOftravalon(
                            data: "Submit",
                            textStyle: Constants().boldstylewhite(14),
                          );
                        }
                      },
                    ),
                )
              )
              )
            ],
          ),
        ),
      ),
    );
  }
}
