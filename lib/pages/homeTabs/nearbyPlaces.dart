import 'package:flutter/material.dart';
import 'package:travlon/pages/homeTabs/placeView.dart';
import 'package:travlon/utils/widgets/appbar.dart';
import 'package:travlon/utils/widgets/txtOftravalon.dart';

import '../../Utils/widgets/bottombar.dart';
import '../../utils/constants/constantsOfTravlne.dart';
import '../homeTabs/nearestplaceList.dart';

class nearbyPlaces extends StatefulWidget {
  const nearbyPlaces({Key? key}) : super(key: key);

  @override
  State<nearbyPlaces> createState() => _nearbyPlacesState();
}

class _nearbyPlacesState extends State<nearbyPlaces> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60), child: nearbyappBar()),
      bottomNavigationBar: bottombarnotch(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, int index) {
              return GestureDetector(

                child: SizedBox(
                  height: 100,
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: Constants().radiusreturningthree()),
                    child: Container(
                      height: MediaQuery.of(context).size.height * .15,
                      width: 300,
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: Constants().radiusreturningthree(),
                            child: Image.asset(
                              "assets/images/park.jpg",
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              txtOftravalon(
                                  data: " Public Park",
                                  textStyle: Constants().boldstylegreenmon(12)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 12,
                                    color: Colors.grey,
                                  ),
                                  txtOftravalon(
                                      data: " Mananchira,Kozhikode",
                                      textStyle:
                                          Constants().Regularstylegrey(12)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 14,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 14,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 14,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 14,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.grey,
                                    size: 14,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  txtOftravalon(
                                      data: "425 Reviews",
                                      textStyle:
                                          Constants().Stylemediuemgreen(12)),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
