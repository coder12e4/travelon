import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:travlon/cubit/home/home_cubit.dart';
import 'package:travlon/models/loginmodel.dart';
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
bool passwordVisible = false;
  late LogincubitCubit objlogincubit;
  @override
  void initState() {
    objlogincubit = LogincubitCubit(LogincubitInitial(), LoginNew());
passwordVisible =true;
  /* objhomecubit =HomeCubit(HomeInitial(),homeView() );
  */  // TODO: implement initState
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
                    data: "Travel",
                    textStyle: Constants().boldstylegreenmon(30)),
                txtOftravalon(
                    data: "On",
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
                    textStyle: Constants(). mediumstyleblackmon(24)),
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
            TextField(

              controller: password,
              obscureText: passwordVisible,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                    borderRadius: Constants().radiusreturningthree(),
                    borderSide: BorderSide(
                      width: .5,
                      color: HexColor(Constants().pastelgreen400),
                    )),
                focusedBorder: OutlineInputBorder(
                  borderRadius: Constants().radiusreturningthree(),
                  borderSide: BorderSide(

                    color: HexColor(Constants().pastelgreen600),
                  ),
                ),
                hintText: "Password",
                hintStyle: Constants().RegularstyleblackMon(14),
                helperStyle: TextStyle(color: Colors.green),
                suffixIcon: IconButton(
                  icon: Icon(passwordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,color: HexColor(Constants().pastelgreen300),),
                  onPressed: () {
                    setState(
                          () {
                        passwordVisible = !passwordVisible;
                      },
                    );
                  },
                ),
                alignLabelWithHint: false,
              ),
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                txtOftravalon(
                    data: "Forgot Password?",
                    textStyle: Constants(). mediumstyleblackmon(14)),
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
                       // objhomecubit.nearby();
                  },
                  height: 50,
                  width: double.infinity,
                  childWid: BlocProvider<LogincubitCubit>(
                    create: (context) => objlogincubit,
                    child: BlocListener<LogincubitCubit, LogincubitState>(
                      listener: (context, state) {
                        if (state is LogincubitSuccess) {
                          loginModel objlatest = state.loginobj;
                        objlogincubit.login("amalsekhar1@gmail.com","amal@123", 10,10, 25);
                        Constants().loadPages(homeScreen(objnearby: ,), context);
                        }
                        // TODO: implement listener
                      },
                      child: BlocBuilder<LogincubitCubit,LogincubitState>(
                        builder: (context, state) {
                          if (state is LogincubitLoading) {
                            return Constants().spinkit();
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
                    textStyle: Constants(). mediumstyleblackmon(14)),
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
