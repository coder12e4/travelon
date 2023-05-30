import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travlon/pages/homeTabs/placeView.dart';

import '../../repository/loginrepository.dart';
import '../../utils/constants/constantsOfTravlne.dart';
import '../../utils/widgets/btnTravelon.dart';
import '../../utils/widgets/txtOftravalon.dart';

class nearBy extends StatefulWidget {
  final List<Nearplaces>? nearplaces;
  const nearBy({Key? key, this.nearplaces}) : super(key: key);

  @override
  State<nearBy> createState() => _nearByState();
}

class _nearByState extends State<nearBy> {
  bool _enabled = true;
  String location = 'Location';
  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  List<Nearplaces>? nearplaces = [];
  @override
  void initState() {
    nearplaces = widget.nearplaces;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            itemCount: nearplaces!.length,
            itemBuilder: (context, index) {
              if (nearplaces!.length == 0) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  period: Duration(milliseconds: 1500),
                  enabled: _enabled,
                  child: GestureDetector(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: Constants().radiusreturning(),
                        ),
                        margin: EdgeInsets.all(10),
                        child: Container(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * .2,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * .4,
                          padding: EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: MediaQuery
                                        .of(context)
                                        .size
                                        .width * .4,
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * .4,
                                    margin: EdgeInsets.only(right: 12),
                                    child: Shimmer.fromColors(
                                      baseColor: Colors.grey.shade300,
                                      highlightColor: Colors.grey.shade100,
                                      period: Duration(milliseconds: 1500),
                                      enabled: _enabled,
                                      child: ClipRRect(
                                        borderRadius: Constants()
                                            .radiusreturning(),
                                        child: Image.asset(
                                          "assets/images/park.jpg",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      right: 18,
                                      top: 18,
                                      child: Icon(
                                        Icons.favorite_border,
                                        color: Colors.white,
                                        size: 24,
                                      ))
                                ],
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    txtOftravalon(
                                        data: nearplaces![index].placeName!,
                                        textStyle: Constants().boldstyleblack(
                                            14)),
                                    txtOftravalon(
                                        data: nearplaces![index].review!,
                                        textStyle:
                                        Constants().Regularstyleblack(12)),
                                    Container(
                                      height: 30,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                              child: txtOftravalon(
                                                data: location,
                                                textStyle:
                                                Constants().lightstyle1(14),
                                              ),
                                              onTap: () async {
                                                Position position =
                                                await _getGeoLocationPosition();
                                                location =
                                                'Lat: ${position
                                                    .latitude} , Long: ${position
                                                    .longitude}';
                                                setState(() {});
                                              }),
                                          Container(
                                            height: 20,
                                            width: 60,
                                            decoration: BoxDecoration(
                                                color: HexColor(
                                                    Constants().pastelgreen400),
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(
                                                        30),
                                                    bottomRight:
                                                    Radius.circular(20))),
                                            alignment: Alignment.center,
                                            child: txtOftravalon(
                                              data: "Open",
                                              textStyle:
                                              Constants().Regularstyleblack(14),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        Constants().loadPages(placeView(), context);
                      }),
                );
              } else {
                return GestureDetector(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: Constants().radiusreturning(),
                      ),
                      margin: EdgeInsets.all(10),
                      child: Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * .2,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * .4,
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .width * .4,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width * .4,
                                  margin: EdgeInsets.only(right: 12),
                                  child: ClipRRect(
                                    borderRadius: Constants().radiusreturning(),
                                    child: Image.asset(
                                      "assets/images/park.jpg",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Positioned(
                                    right: 18,
                                    top: 18,
                                    child: Icon(
                                      Icons.favorite_border,
                                      color: Colors.white,
                                      size: 24,
                                    ))
                              ],
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  txtOftravalon(
                                      data: nearplaces![index].placeName!,
                                      textStyle: Constants().boldstyleblack(
                                          14)),
                                  txtOftravalon(
                                      data: nearplaces![index].review!,
                                      textStyle:
                                      Constants().Regularstyleblack(12)),
                                  Container(
                                    height: 30,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                            child: txtOftravalon(
                                              data: location,
                                              textStyle:
                                              Constants().lightstyle1(14),
                                            ),
                                            onTap: () async {
                                              Position position =
                                              await _getGeoLocationPosition();
                                              location =
                                              'Lat: ${position
                                                  .latitude} , Long: ${position
                                                  .longitude}';
                                              setState(() {});
                                            }),
                                        Container(
                                          height: 20,
                                          width: 60,
                                          decoration: BoxDecoration(
                                              color: HexColor(
                                                  Constants().pastelgreen400),
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(30),
                                                  bottomRight:
                                                  Radius.circular(20))),
                                          alignment: Alignment.center,
                                          child: txtOftravalon(
                                            data: "Open",
                                            textStyle:
                                            Constants().Regularstyleblack(14),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Constants().loadPages(placeView(), context);
                    });
              }
            }
            ),
      ),
    );
  }
}
