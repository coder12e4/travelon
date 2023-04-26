
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travlon/pages/addOns.dart';

class duoTwo extends StatefulWidget {
  const duoTwo({Key? key}) : super(key: key);

  @override
  State<duoTwo> createState() => _duoTwoState();
}

class _duoTwoState extends State<duoTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange,
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.black),
                accountName: Text(
                  "Amal Sekhar",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("amalsekhar1@gmail.com"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 165, 255, 137),
                  child: Text(
                    "A",
                    style: TextStyle(fontSize: 30.0, color: Colors.blue),
                  ), //Text
                ), //circleAvatar
              ), //UserAccountDrawerHeader
            ),
            SizedBox(
              height: 50,
            ),
            ListTile(
              leading: Icon(
                Icons.table_rows_outlined,
                color: Colors.black,
              ),
              title: Text(
                "Sign in/Sign Up",
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
                leading: Icon(Icons.person_2_outlined, color: Colors.black),
                title: Text(
                  "Profile",
                  style: TextStyle(color: Colors.black),
                )),
            ListTile(
                leading:
                Icon(Icons.change_circle_outlined, color: Colors.black),
                title: Text(
                  "Change Password",
                  style: TextStyle(color: Colors.black),
                )),

            ListTile(
              leading: Icon(Icons.contact_page_outlined, color: Colors.black),
              title: Text(
                "Contact Us",
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              leading: Icon(Icons.flag_outlined, color: Colors.black),
              title: Text(
                "Frequently Asked Questions",
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              leading: Icon(Icons.help_outline, color: Colors.black),
              title: Text(
                "Help",
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              leading: Icon(Icons.safety_check_outlined, color: Colors.black),
              title: Text(
                "Privacy Policy ",
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              leading: Icon(Icons.privacy_tip_outlined, color: Colors.black),
              title: Text(
                "Terms&Conditions",
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              leading: Icon(Icons.help_center_outlined, color: Colors.black),
              title: Text(
                "About",
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * .7,
                padding: EdgeInsets.only(left: 20,right: 20,top: 50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Colors.white,
                ),
                child: ListView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                elevation: 8,
                                child: Provider.of<Helper>(context)
                                    .cont3(color: Colors.white, label: 'ok')),
                            Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                elevation: 8,
                                child: Provider.of<Helper>(context)
                                    .cont3(color: Colors.white, label: 'ok')),
                            Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                elevation: 8,
                                child: Provider.of<Helper>(context)
                                    .cont3(color: Colors.white, label: 'ok'))
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Provider.of<Helper>(context).text1("Explore statewise ", 20, FontWeight.w400, Colors.teal, 'regular'),
                            Provider.of<Helper>(context).text1("View All", 20, FontWeight.w400, Colors.teal, 'regular')
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 8,
                          child: Provider.of<Helper>(context).cont4(color: Colors.white, label: "ok",),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 8,
                          child: Provider.of<Helper>(context).cont4(color: Colors.white, label: "ok",),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Provider.of<Helper>(context).text1("Explore Nearby", 20, FontWeight.w400, Colors.teal, 'regular'),
                            Provider.of<Helper>(context).text1("View All", 20, FontWeight.w400, Colors.teal, 'regular')
                          ],
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 8,
                          child: Provider.of<Helper>(context).cont4(color: Colors.white, label: "ok",),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 8,
                          child: Provider.of<Helper>(context).cont4(color: Colors.white, label: "ok",),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 8,
                          child: Provider.of<Helper>(context).cont4(color: Colors.white, label: "ok",),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                      ],
                    ),
                  ],


                ),
              ),
            ),
            Positioned(
                top: 220,
                left: 20,
                right: 20,
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 10,
                    child: Provider.of<Helper>(context).cont2(height: 100,width: 200,
                      color: Colors.white,
                      label: "available",sty: TextStyle(fontSize: 20,color: Colors.white)
                    )))
          ],
        ),
      ),
    );
  }
}
