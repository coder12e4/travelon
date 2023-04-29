import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:travlon/pages/addOns.dart';
import 'package:travlon/utils/widgets/txtOftravalon.dart';

import '../cubit/loactionButtons/getcurrent_location_cubit.dart';
import '../utils/constants/constantsOfTravlne.dart';
import '../utils/widgets/btnTravelon.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {

 late GetcurrentLocationCubit getcurrentLocationCubit;
 @override
  void initState() {
   getcurrentLocationCubit=GetcurrentLocationCubit();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/home.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocProvider<GetcurrentLocationCubit>(
              create: (context) => getcurrentLocationCubit,
              child: BlocListener<GetcurrentLocationCubit,GetcurrentLocationState>(
                listener: (context, state) {
                if(state is GetcurrentLocationSuccess){
                        print("logimed");
                }

                },
                child: BlocBuilder<GetcurrentLocationCubit,GetcurrentLocationState>(
                  builder: (context, state) {

                    if(state is GetcurrentLocationLoading){
                      return  btnTravelon(function: ()=>getcurrentLocationCubit.loadlocationsNear(),
                        boxDecoration: BoxDecoration(color: Colors.green),
                        height: 60,
                        width: 100,
                        childWid: CircularProgressIndicator(color: Colors.white,),
                      );
                    }else{
                       return  btnTravelon(function: ()=>getcurrentLocationCubit.loadlocationsNear(),
                        boxDecoration: BoxDecoration(color: Colors.green),
                        height: 60,
                        width: 100,
                         childWid: txtOftravalon(
                             data: Constants().txtAppname,
                             textStyle: Constants().boldstyleblack(14)),
                      );
                    }
                    },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

textting() {
  print("clicked");
}
