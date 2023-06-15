import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travlon/utils/widgets/btnTravelon.dart';
import 'package:travlon/utils/widgets/txtOftravalon.dart';

import '../../utils/constants/constantsOfTravlne.dart';

class placeView extends StatefulWidget {
  const placeView({Key? key}) : super(key: key);

  @override
  State<placeView> createState() => _placeViewState();
}

class _placeViewState extends State<placeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading:IconButton(onPressed: (){}, icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ) ,),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(
            Icons.favorite,
            color: Colors.red,
          ),),
          SizedBox(
          width: 20
          ,
          )
        ],
      ),
      body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child:Column(
      mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/park.jpg",
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 10,
          ),

          txtOftravalon(
              data: "Public Park",
              textStyle: Constants().StyleMediumBlack(20)),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on_outlined,
                color: Colors.green,
              ),
              txtOftravalon(
                  data: "Street No.2",
                  textStyle: Constants().RegularstyleblackMon(14)),
              Spacer(flex: 1,),

             Container(
                height: 30,
                width: 60,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.green,
              ),
              padding: EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    txtOftravalon(
                        data: "4.5",
                        textStyle: Constants(). Regularstylewhite(14)),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 14,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          txtOftravalon(
              data:
              "Discover nature's playground at our public park - where fun, relaxation, and adventure meet. Breathe in fresh air, soak up the sun, and explore our lush green spaces. From picnicking to sports and everything in between, there's something for everyone here.",
              textStyle: Constants().Regularstyleblack(14)),
          SizedBox(
            height: 20,
          ),
          txtOftravalon(
              data: "Gallery",
              textStyle: Constants().StyleMediumBlack(16)),
          SizedBox(
            height: 4,
          ),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: Constants().radiusreturningone()),
            child: Container(
              height: 150,
              width: 400,
              decoration: Constants().decorations(
                  Constants().radiusreturningone(),
                  Colors.green.shade100,
                  Border(top: BorderSide.none)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              txtOftravalon(
                  data: "Nearby",
                  textStyle: Constants().StyleMediumBlack(16)),
              txtOftravalon(
                  data: "See all",
                  textStyle: Constants().Stylemediuemgreen(14))
            ],
          ),
          Container(
            color: Colors.transparent,
            height: 70,
            width: 500,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Constants().faciList.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      btnplaceview(
                          function: () {},
                          height: 50,
                          width: 150,
                          childWid: txtOftravalon(
                            data: Constants().faciList[index],
                            textStyle:
                            Constants().Stylemediuemgreen(14),
                          ))
                    ],
                  );
                }),
          ),
          Spacer(),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: btnthreeTravelon(
              function: () {},
              height: 50,
              width: double.infinity,
              childWid: txtOftravalon(
                  data: "Get Direction",
                  textStyle: Constants().boldstylewhite(16)),
            ),
          ),

          Spacer()


        ],
      ),
        ),
    );
  }
}
