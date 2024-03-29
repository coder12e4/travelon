import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';
import 'package:travlon/cubit/home/home_cubit.dart';
import 'package:travlon/models/nearbyModel.dart';
import 'package:travlon/pages/homeTabs/nearestplaceList.dart';
import 'package:travlon/pages/homeTabs/travloglList.dart';
import 'package:travlon/repository/loginrepository.dart';
import 'package:travlon/repository/nearbyrepo.dart';
import 'package:travlon/utils/constants/constantsOfTravlne.dart';
import 'package:travlon/utils/widgets/txtOftravalon.dart';

import '../../utils/widgets/btnTravelon.dart';
import '../homeScreen.dart';
import 'loginPage.dart';

class location extends StatefulWidget {
  const location({Key? key}) : super(key: key);

  @override
  State<location> createState() => _locationState();
}

class _locationState extends State<location> {
  String dropdownValue = "10";
  String? lat;
  String? long;
  List<String> items = ["10", "25", "50", "100", "500", "2000"];
  bool newValue = false;
  var text = "Get Location";

  double _width = 300;
  double _height = 50;
  Color _color = HexColor(
      Constants().pastelgreen300);
  BorderRadiusGeometry _borderRadiusGeometry = BorderRadius.circular(20);
  bool _isShow = false;
  List<NearPlaces>? nearPlaces = [];

  late HomeCubit objhomecubit;
  @override
  void initState() {
    objhomecubit = HomeCubit(buttonClicckOneInitial(), homeView());
    // TODO: implement initState
    super.initState();
  }

  String? guestBtnName = "";

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
            Expanded(child: SizedBox()),

            Image.asset("assets/images/logohd.png"),


            RichText(
              // Controls visual overflow
              overflow: TextOverflow.clip,

              // Controls how the text should be aligned horizontally
              textAlign: TextAlign.end,

              // Control the text direction
              textDirection: TextDirection.rtl,

              // Whether the text should break at soft line breaks
              softWrap: true,

              // Maximum number of lines for the text to span
              maxLines: 1,

              // The number of font pixels for each logical pixel
              textScaleFactor: 1,
              text: const TextSpan(
                text: 'Hello ',

                children: [
                  TextSpan(
                      text: 'Geeks', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green)),
                ],
              ),
            ),



            txtOftravalon(
                data: "Access Your", textStyle: Constants().boldstyleblack(14)),
            txtOftravalon(
                data: "Location", textStyle: Constants().boldstyleblack(20)),
            Expanded(
              child: SizedBox(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BlocProvider<HomeCubit>(
                  create: (context) => objhomecubit,
                  child: BlocListener<HomeCubit, HomeState>(
                    listener: (context, state) {
                      if (state is buttonClicckOneInitial) {
                        // guestBtnName=state.buttonName;
                      } else if (state is buttonClicckOneLoading) {
                        //no value
                      } else if (state is buttonClicckOneSuccess) {
                        _isShow = state.k;
                        lat = state.latitude.toString();
                        long = state.longitude.toString();
                      } else if (state is buttonClicckOneError) {
                        //initiatial state calling
                      } else if (state is buttonClickHomeApiLoading) {
                      } else if (state is buttonClickHomeApiSuccess) {
                        nearbyModel obbj = state.obj;
                        Constants().loadPages(
                            homeScreen(
                              nearPlaces: obbj.data!.nearPlaces!,
                              travelLogs: obbj.data!.travelLogs!,
                            ),
                            context);
                      }
                    },
                    child: BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        if (state is buttonClicckOneInitial) {
                          return GestureDetector(
                            onTap: () {
                              objhomecubit.getLocation();
                              setState(() {
                                if (_isShow = !_isShow) {
                                  _width = 180;
                                  _height = 50;
                                } else {
                                  _width = 280;
                                  _height = 50;
                                }
                              });
                            },
                            child: AnimatedContainer(
                                height: _height,
                                width: _width,
                                padding: EdgeInsets.all(10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: _color,
                                  borderRadius: _borderRadiusGeometry,
                                ),
                                duration: Duration(seconds: 1),
                                curve: Curves.fastOutSlowIn,
                                child: txtOftravalon(
                                  data: "Get Location",
                                  textStyle: TextStyle(color: Colors.white),
                                )),
                          );
                        }

                        if (state is buttonClicckOneLoading) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              AnimatedContainer(
                                  height: _height,
                                  width: _width,
                                  padding: EdgeInsets.all(10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: _color,
                                    borderRadius: _borderRadiusGeometry,
                                  ),
                                  duration: Duration(seconds: 1),
                                  curve: Curves.fastOutSlowIn,
                                  child: Center(
                                    child: Constants().spinkit()
                                  )),
                              SizedBox(
                                  width: 20
                              ),

                              Visibility(
                                visible: _isShow,
                                child: btnthreeTravelon(
                                    function: () {},
                                    height: 50,
                                    width: 150,
                                    childWid: DropdownButton(
                                        underline: SizedBox(),
                                        dropdownColor: HexColor(
                        Constants().pastelgreen300),
                                        menuMaxHeight: 100,
                                        iconEnabledColor: Colors.white,
                                        style: TextStyle(
                                            color: HexColor(
                                          Constants().pastelgreen400,
                                        )),
                                        value: dropdownValue,
                                        items: items
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem(
                                              value: value,
                                              child: txtOftravalon(
                                                  data: value,
                                                  textStyle: Constants()
                                                      .boldstylewhite(16)));
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownValue = newValue!;
                                          });
                                        })),
                              ),
                            ],
                          );
                        }
                        else if (state is buttonClicckOneSuccess) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              GestureDetector(
                                onTap: () {
                                  objhomecubit.getGuestHome(
                                      lat!, long!, dropdownValue);
                                },
                                child: AnimatedContainer(
                                    height: _height,
                                    width: _width,
                                    padding: EdgeInsets.all(10),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: _color,
                                      borderRadius: _borderRadiusGeometry,
                                    ),
                                    duration: Duration(seconds: 1),
                                    curve: Curves.fastOutSlowIn,
                                    child: txtOftravalon(
                                      data: "Go to Home",
                                      textStyle: TextStyle(color: Colors.white),
                                    )),
                              ),
                              SizedBox(
                                width: 20
                              ),
                              Visibility(
                                visible: _isShow,
                                child: btnthreeTravelon(
                                    function: () {},
                                    height: 50,
                                    width: 150,
                                    childWid: DropdownButton(
                                        underline: SizedBox(),
                                        dropdownColor:HexColor(
                                            Constants().pastelgreen300),
                                        menuMaxHeight: 100,
                                        iconEnabledColor: HexColor(
                                          Constants().pastelgreen400,
                                        ),
                                        style: TextStyle(
                                            color: HexColor(
                                          Constants().pastelgreen400,
                                        )),
                                        value: dropdownValue,
                                        items: items
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem(
                                              value: value,
                                              child: txtOftravalon(
                                                  data: value,
                                                  textStyle: Constants()
                                                      .boldstylewhite(16)));
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownValue = newValue!;
                                          });
                                        })),
                              ),
                            ],
                          );
                        }
                        else if (state is buttonClicckOneError) {
                          return  GestureDetector(
                            onTap: () {
                              objhomecubit.getLocation();
                              setState(() {
                                if (_isShow = !_isShow) {
                                  _width = 180;
                                  _height = 50;
                                } else {
                                  _width = 340;
                                  _height = 50;
                                }
                              });
                            },
                            child: AnimatedContainer(
                                height: _height,
                                width: _width,
                                padding: EdgeInsets.all(10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: _color,
                                  borderRadius: _borderRadiusGeometry,
                                ),
                                duration: Duration(seconds: 1),
                                curve: Curves.fastOutSlowIn,
                                child: txtOftravalon(
                                  data: "Get Location",
                                  textStyle: TextStyle(color: Colors.white),
                                )),
                          );
                        }
                        else if (state is buttonClickHomeApiLoading) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              AnimatedContainer(
                                  height: _height,
                                  width: _width,
                                  padding: EdgeInsets.all(10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: _color,
                                    borderRadius: _borderRadiusGeometry,
                                  ),
                                  duration: Duration(seconds: 1),
                                  curve: Curves.fastOutSlowIn,
                                  child: Center(
                                    child: Center(child: Constants().spinkit()),
                                  )),
                              SizedBox(
                                  width: 20
                              ),
                              Visibility(
                                visible: _isShow,
                                child: btnthreeTravelon(
                                    function: () {},
                                    height: 50,
                                    width: 150,
                                    childWid: DropdownButton(
                                        underline: SizedBox(),
                                        dropdownColor: HexColor(
                                            Constants().pastelgreen300),
                                        menuMaxHeight: 100,
                                        iconEnabledColor: HexColor(
                                          Constants().pastelgreen400,
                                        ),
                                        style: TextStyle(
                                            color: HexColor(
                                          Constants().pastelgreen400,
                                        )),
                                        value: dropdownValue,
                                        items: items
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem(
                                              value: value,
                                              child: txtOftravalon(
                                                  data: value,
                                                  textStyle: Constants()
                                                      .boldstylewhite(16)));
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownValue = newValue!;
                                          });
                                        })),
                              ),
                            ],
                          );
                        } else if (state is buttonClickHomeApiFailed) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AnimatedContainer(
                                  height: _height,
                                  width: _width,
                                  padding: EdgeInsets.all(10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: _color,
                                    borderRadius: _borderRadiusGeometry,
                                  ),
                                  duration: Duration(seconds: 1),
                                  curve: Curves.fastOutSlowIn,
                                  child: Center(
                                    child: Text("try again"),
                                  )),
                              SizedBox(
                                  width: 20
                              ),
                              Visibility(
                                visible: _isShow,
                                child: btnthreeTravelon(
                                    function: () {},
                                    height: 50,
                                    width: 150,
                                    childWid: DropdownButton(
                                        underline: SizedBox(),
                                        dropdownColor: HexColor(
                                            Constants().pastelgreen300),
                                        menuMaxHeight: 100,
                                        iconEnabledColor: HexColor(
                                          Constants().pastelgreen400,
                                        ),
                                        style: TextStyle(
                                            color: HexColor(
                                          Constants().pastelgreen400,
                                        )),
                                        value: dropdownValue,
                                        items: items
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem(
                                              value: value,
                                              child: txtOftravalon(
                                                  data: value,
                                                  textStyle: Constants()
                                                      .boldstylewhite(16)));
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownValue = newValue!;
                                          });
                                        })),
                              ),
                            ],
                          );
                        } else {
                          return GestureDetector(
                            onTap: () {
                              objhomecubit.getLocation();
                              setState(() {
                                if (_isShow = !_isShow) {
                                  _width = 180;
                                  _height = 50;
                                } else {
                                  _width = 280;
                                  _height = 50;
                                }
                              });
                            },
                            child: AnimatedContainer(
                                height: _height,
                                width: _width,
                                padding: EdgeInsets.all(10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: _color,
                                  borderRadius: _borderRadiusGeometry,
                                ),
                                duration: Duration(seconds: 1),
                                curve: Curves.fastOutSlowIn,
                                child: txtOftravalon(
                                  data: "Get Location",
                                  textStyle: TextStyle(color: Colors.white),
                                )),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            btnthreeTravelon(
              function: () {
                Constants().loadPages(login(), context);
              },
              height: 50,
              width: 400,
              childWid: txtOftravalon(
                  data: "Log In", textStyle: Constants().boldstylewhite(16)),
            ),
          ],
        ),
      ),
    );
  }
}
