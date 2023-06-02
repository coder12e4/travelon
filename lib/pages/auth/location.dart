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
  String dropdownValue = "10m";
  List<String> items = ["10m", "25m", "50m", "100m", "500m", "1KM"];
  bool newValue = false;
  var text = "Get Location";

  double _width = 340;
  double _height = 50;
  Color _color = Colors.green.shade700;
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
            Icon(
              Icons.location_on_outlined,
              size: 80,
              color: Colors.green.shade700,
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
                GestureDetector(

                  onTap: (){
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
                        child: BlocProvider<HomeCubit>(
                          create: (context) => objhomecubit,
                          child: BlocListener<HomeCubit, HomeState>(
                            listener: (context, state) {
                              if (state is buttonClicckOneInitial) {
                                // guestBtnName=state.buttonName;
                              } else if (state is buttonClicckOneLoading) {
                                //no value
                              }
                              else if(state is buttonClicckOneSuccess){




                              }



                            },
                            child: BlocBuilder<HomeCubit, HomeState>(
                              builder: (context, state) {
                                if (state is buttonClicckOneLoading) {
                                  return Center(
                                    child: SpinKitCubeGrid(
                                      duration: Duration(seconds: 2),
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  );
                                } else if(state is buttonClicckOneSuccess) {
                                  return Visibility(
                                    visible: _isShow,
                                    child: btnthreeTravelon(
                                        function: () {
                                          objhomecubit.getLocation();
                                        },
                                        height: 50,
                                        width: 150,
                                        childWid: BlocProvider<HomeCubit>(
                                          create: (context) => objhomecubit,
                                          child: BlocListener<HomeCubit, HomeState>(
                                            listener: (context, state) {

                                              if(state is buttonClicckOneLoading){
                                                //
                                              }


                                              else if (state is buttonClicckOneSuccess) {
                                                dropdownValue == newValue;
                                                text = "Go to Home";
                                                if (dropdownValue == newValue) {
                                                  _width = 340;
                                                  _height = 50;
                                                  _isShow = false;
                                                } else {
                                                  _width = 180;
                                                  _height = 50;
                                                }
                                              }

                                            },
                                            child: BlocBuilder<HomeCubit, HomeState>(
                                              builder: (context, state) {
                                                if (state is buttonClicckOneLoading) {
                                                  return CircularProgressIndicator();
                                                } else {
                                                  return DropdownButton(
                                                      underline: SizedBox(),
                                                      dropdownColor: Colors.green.shade700,
                                                      menuMaxHeight: 100,
                                                      iconEnabledColor: HexColor(
                                                        Constants().pastelgreen400,
                                                      ),
                                                      style: TextStyle(
                                                          color: HexColor(
                                                            Constants().pastelgreen400,
                                                          )),
                                                      value: dropdownValue,
                                                      items: items.map<DropdownMenuItem<String>>(
                                                              (String value) {
                                                            return DropdownMenuItem(
                                                                value: value,
                                                                child: txtOftravalon(
                                                                    data: value,
                                                                    textStyle: Constants()
                                                                        .boldstylewhite(16)));
                                                          }).toList(),
                                                      onChanged: (String? newValue) {
                                                        setState(() {});
                                                      });
                                                }
                                              },
                                            ),
                                          ),
                                        )),
                                  );
                                }else if(state is buttonClicckOneError){
                                  return Text("try again");
                                }else{
                                  return Container();
                                }
                              },
                            ),
                          ),
                        ))),
                Spacer(),

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
