import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:travlon/cubit/home/home_cubit.dart';
import 'package:travlon/models/nearbyModel.dart';
import 'package:travlon/pages/auth/registration.dart';
import 'package:travlon/repository/loginrepository.dart';
import 'package:travlon/repository/nearbyrepo.dart';
import 'package:travlon/utils/constants/constantsOfTravlne.dart';
import 'package:travlon/utils/widgets/btnTravelon.dart';
import 'package:travlon/utils/widgets/edttravelon.dart';
import 'package:travlon/utils/widgets/txtOftravalon.dart';

import '../../cubit/authcubit/logincubit_cubit.dart';
import '../homeScreen.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  late HomeCubit objhomecubit;
  @override
  void initState() {
   objhomecubit =HomeCubit(HomeInitial(),homeView() );
    // TODO: implement initState
    super.initState();
  }

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                txtOftravalon(
                    data: "travelOn",
                    textStyle: Constants().boldstyleblack(30)),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                txtOftravalon(
                    data: "Login to your account",
                    textStyle: Constants().mediumstyleblack(24)),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            edttravlon(
              textEditingController: username,
              hinttext: "Username or email",
            ),
            SizedBox(
              height: 10,
            ),
            edttravlon(
              textEditingController: password,
              hinttext: "Password",
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                txtOftravalon(
                    data: "Forgot Password?",
                    textStyle: Constants().mediumstyleblack(14)),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: btnthreeTravelon(
                  function: () {
                        objhomecubit.nearby();
                  },
                  height: 50,
                  width: double.infinity,
                  childWid: BlocProvider<HomeCubit>(
                    create: (context) => objhomecubit,
                    child: BlocListener<HomeCubit, HomeState>(
                      listener: (context, state) {
                        if (state is HomeSuccess) {
                          nearbyModel objhome = state.objnearby;
                          Constants().loadPages(homeScreen(objnearby:objhome), context);
                        }
                        // TODO: implement listener
                      },
                      child: BlocBuilder<HomeCubit, HomeState>(
                        builder: (context, state) {
                          if (state is HomeLoading) {
                            return Center(
                              child: SpinKitCubeGrid(
                                duration: Duration(seconds: 2),
                                color: Colors.white,
                                size: 20,
                              ),
                            );
                          } else {
                            return txtOftravalon(
                                data: "Login",
                                textStyle: Constants().boldstylewhite(14));
                          }
                        },
                      ),
                    ),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                txtOftravalon(
                    data: "Not a member?",
                    textStyle: Constants().mediumstyleblack(14)),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>registerone()));
                  },
                  child: txtOftravalon(
                      data: "Register now",
                      textStyle: Constants().Stylemediuemgreen(14)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

bool validationChecker(String k) {
  if (k.length == 0) {
    return true;
  } else {
    return false;
  }
}

void validation(String username, String password) {
  if (validationChecker(username)) {
    print("Enter valid username");
  } else if (validationChecker(password)) {
    print("enter valid password");
  } else {
    login();
  }
}

void Login() {
  print("login success");
}
