import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travlon/pages/auth/registration.dart';
import 'package:travlon/repository/loginrepository.dart';
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
  late LogincubitCubit objlogincubit;
  @override
  void initState() {
    objlogincubit = LogincubitCubit(LogincubitInitial(), loginInt());
    // TODO: implement initState
    super.initState();
  }

  String? username_ = "";
  String password_ = "";

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
                    objlogincubit.login("amal", "amal123");
                  },
                  height: 50,
                  width: double.infinity,
                  childWid: BlocProvider<LogincubitCubit>(
                    create: (context) => objlogincubit,
                    child: BlocListener<LogincubitCubit, LogincubitState>(
                      listener: (context, state) {
                        if (state is LogincubitSuccess) {
                          loginModel obj = state.loginobj;
                          Constants().loadPages(homeScreen(objlogin: obj), context);
                        }
                        // TODO: implement listener
                      },
                      child: BlocBuilder<LogincubitCubit, LogincubitState>(
                        builder: (context, state) {
                          if (state is LogincubitLoading) {
                            return CircularProgressIndicator();
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
