import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:travlon/pages/homeTabs/travaleogView.dart';
import 'package:travlon/utils/constants/constantsOfTravlne.dart';
import 'package:travlon/utils/widgets/btnTravelon.dart';
import 'package:travlon/utils/widgets/txtOftravalon.dart';

import '../../models/nearbyModel.dart';
import '../../repository/loginrepository.dart';

class travelogList extends StatefulWidget {
  final  List<TravelLogs>? travelLogs;

  const travelogList({Key? key, this.travelLogs, }) : super(key: key);

  @override
  State<travelogList> createState() => _travelogListState();
}

class _travelogListState extends State<travelogList> {
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


  List<TravelLogs>? travelLogs=[];
  @override
  void initState() {

    travelLogs = widget.travelLogs;

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: travelLogs!.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: Constants().radiusreturning(),
                ),
                margin: EdgeInsets.all(10),
                child: btntwoTravelon(
                  function: () {},
                  height: 400,
                  width: 400,
                  childWid: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.width * .5,
                            width: MediaQuery.of(context).size.width * .9,
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
                        height: 8,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 16,
                          ),
                          txtOftravalon(
                              data: travelLogs![index].heading!,
                              textStyle: Constants().boldstyleblack(24)),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: txtOftravalon(
                              data: travelLogs![index].content!,
                              textStyle: Constants().Regularstyleblack(14),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                      height: 16,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 16,
                          ),
                          GestureDetector(
                              child: txtOftravalon(
                                data: location,
                                textStyle:
                                Constants().Regularstyleblack(16),
                              ),
                              onTap: () async {
                                Position position =
                                await _getGeoLocationPosition();
                                location = 'Lat: ${position.latitude} , Long: ${position.longitude}';
                                setState(() {

                                });
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                Constants().loadPages(travelogView(), context);
              },
            );
          }),
    );
  }
}
