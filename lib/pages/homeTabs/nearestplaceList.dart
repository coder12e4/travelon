import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travlon/pages/homeTabs/placeView.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/nearbyModel.dart';
import '../../repository/loginrepository.dart';
import '../../utils/constants/constantsOfTravlne.dart';
import '../../utils/widgets/btnTravelon.dart';
import '../../utils/widgets/txtOftravalon.dart';

class nearBy extends StatefulWidget {
  final List<NearPlaces>? nearPlaces;
  const nearBy({
    Key? key,
    this.nearPlaces,
  }) : super(key: key);

  @override
  State<nearBy> createState() => _nearByState();
}

class _nearByState extends State<nearBy> {
  bool _enabled = true;

  void _launchMapsUrl(double lat, double lon) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lon';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  List<NearPlaces>? nearPlaces = [];
  @override
  void initState() {
    nearPlaces = widget.nearPlaces;
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
            itemCount: nearPlaces!.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: Constants().radiusreturning(),
                    ),
                    margin: EdgeInsets.all(10),
                    child: Container(
                      height: MediaQuery.of(context).size.height * .2,
                      width: MediaQuery.of(context).size.width * .4,
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.width * .4,
                                width: MediaQuery.of(context).size.width * .4,
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                txtOftravalon(
                                    data: nearPlaces![index].name!,
                                    textStyle: Constants().boldstyleblack(14)),
                                txtOftravalon(
                                    data: nearPlaces![index].detail!,
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
                                      /*           GestureDetector(
                                            child: txtOftravalon(
                                              data: location,
                                              textStyle:
                                              Constants().lightstyle1(14),
                                            ),
                                            */ /*onTap: () async {
                                              Position position =
                                              await _getGeoLocationPosition();
                                              location =
                                              'Lat: ${position
                                                  .latitude} , Long: ${position
                                                  .longitude}';
                                              setState(() {});
                                            }
                                            */ /*

                                            ),
                             */
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
                    _launchMapsUrl(nearPlaces![index].location!.coordinates![1],
                        nearPlaces![index].location!.coordinates![0]);

                    /*    Constants().loadPages(placeView(), context);
                  */
                  });
            }),
      ),
    );
  }
}
