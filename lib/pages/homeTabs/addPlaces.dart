import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:travlon/cubit/addplaces/addplaces_cubit.dart';
import 'package:travlon/models/addpalceModel.dart';
import 'package:travlon/utils/widgets/btnTravelon.dart';

import '../../repository/addplacesRepo.dart';
import '../../utils/constants/constantsOfTravlne.dart';
import '../../utils/widgets/appbar.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../utils/widgets/edttravelon.dart';
import '../../utils/widgets/txtOftravalon.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

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

  File? pickedImage;
  bool isPicked = false;

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
  late AddplacesCubit objaddplacecubit;
  @override
  void initState() {
    objaddplacecubit = AddplacesCubit(AddplacesInitial(), getAddPlaces());
    // TODO: implement initState
    super.initState();
  }

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
                  onTap: () async {
                    ImagePicker picker = ImagePicker();
                    XFile? image =
                        await picker.pickImage(source: ImageSource.gallery);
                    if (image != null) {
                      pickedImage = File(image.path);
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
                      child: isPicked
                          ? ClipRRect(
                        borderRadius: Constants().radiusreturning(),
                            child: Image.file(
                                pickedImage!,
                                height: 200,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                          )
                          : Container(
                              color: Colors.grey.shade200,
                              height: 200,
                              width: 300,
                        child:  Column(
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
                            )),
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
                        items: items
                            .map<DropdownMenuItem<String>>((String value) {
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
                        items: states
                            .map<DropdownMenuItem<String>>((String value) {
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
                  function: () {
                    objaddplacecubit.addPlacesNew(
                        name.text.toString(),
                        place.text.toString(),
                        details.text.toString(),
                        address.text.toString(),
                        location.text.toString(),
                        "India",
                        "kerala",
                        "10",
                        "20");
                  },
                  childWid: BlocProvider<AddplacesCubit>(
                    create: (context) => objaddplacecubit,
                    child: BlocListener<AddplacesCubit, AddplacesState>(
                      listener: (context, state) {
                        if (state is AddplacesInitial) {
                        } else if (state is AddplacesLoading) {
                        } else if (state is AddplacesSuccess) {
                          objaddplacecubit.addPlacesNew(
                              "forest",
                              "nilambur",
                              "bigforest",
                              "street",
                              "india",
                              "malapuram",
                              "kerala",
                              "3242",
                              "342");

                          addplaceModel s = state.obj;
                          String? msg = s.msg.toString();
                          Fluttertoast.showToast(
                            msg: msg,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Colors.greenAccent,
                            fontSize: 16,
                          );
                        } else if (state is AddplacesError) {
                          Fluttertoast.showToast(
                            msg: "Fialed to Submit.Try again",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Colors.greenAccent,
                            fontSize: 16,
                          );
                        } else {}
                      },
                      child: BlocBuilder<AddplacesCubit, AddplacesState>(
                        builder: (context, state) {
                          if (state is AddplacesLoading) {
                            return Center(
                              child: Constants().spinkit(),
                            );
                          } else {
                            return txtOftravalon(
                              data: "Submit",
                              textStyle: Constants().boldstylewhite(14),
                            );
                          }
                        },
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
