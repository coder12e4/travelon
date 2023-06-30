
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:travlon/utils/constants/constantsOfTravlne.dart';


class drawer extends StatefulWidget {
  const drawer({Key? key}) : super(key: key);

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
           DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ), //BoxDecoration
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: HexColor(Constants().pastelgreen300),
                borderRadius: Constants().radiusreturningthree()


              
              ),
              accountName: Text(
                "Amal Sekhar",
                style: TextStyle(fontSize: 18),
              ),
              accountEmail: Text("amalsekhar1@gmail.com"),
              currentAccountPictureSize: Size.square(50),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 30.0, color: HexColor(Constants().pastelgreen300)),
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
          ),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.black),
            title: Text(
              "Log Out",
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
