import 'package:flutter/material.dart';
import 'package:travlon/utils/constants/constantsOfTravlne.dart';
import 'package:travlon/utils/widgets/btnTravelon.dart';
import 'package:travlon/utils/widgets/txtOftravalon.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            "Welcome",
            style: Constants().mediumstyle1(24),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notification_add_outlined,
                  color: Colors.grey.shade500,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.account_tree_outlined,
                  color: Colors.grey.shade500,
                ))
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            Constants().btmbar(Icons.home_filled, "Home"),
            Constants().btmbar(Icons.my_location, "Location"),
            Constants().btmbar(Icons.reviews_outlined, "Review"),
            Constants().btmbar(Icons.person_2_outlined, "Profile")
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 70,
                width: 500,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: Constants().btnlist.length,
                    itemBuilder: (context, index) {
                      return btnoneTravelon(
                        function: () {},
                        height: 30,
                        width: 130,
                        childWid: Text(
                          Constants().btnlist[index].toString(),
                          style: Constants().Regularstyle1(16),
                        ),
                      );
                    }),
              ),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Card(
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
                                    height:
                                        MediaQuery.of(context).size.width * .5,
                                    width:
                                        MediaQuery.of(context).size.width * .9,
                                    child: ClipRRect(
                                      borderRadius:
                                          Constants().radiusreturning(),
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
                                      data: "headingOne",
                                      textStyle:
                                          Constants().boldstyleblack(24)),
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
                                        data: "Discover nature's playground at our public park - where fun, relaxation, and adventure meet. Breathe in fresh air, soak up the sun, and explore our lush green spaces. From picnicking to sports and everything in between, there's something for everyone here.",
                                        textStyle:
                                        Constants(). Regularstyleblack(14),),
                                  ),

                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ));
  }
}
