import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:wow_codes/Helper/Helper.dart';
import 'package:wow_codes/Home/profile_menu.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map userData = {};
  @override
  void initState()
  {
    super.initState();
    getData();
  }
  void getData() async
  {
    userData = await Helper().getUserData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(49, 39, 79, 1),
        title : Text('Profile',style: GoogleFonts.openSans(
          textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600) ,)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
              children: [

                Row(
                    children: [
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(30), child:  Image.network("${userData['user_image']}")),
                      ),

                      Column(
                          crossAxisAlignment :  CrossAxisAlignment.start,
                          children: [

                            const SizedBox(height: 10),
                            Text("${userData['user_name']}", style: GoogleFonts.openSans(
                                textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600))),
                            Text("Member Since ${userData['']}", style: GoogleFonts.openSans(
                                textStyle: const TextStyle(
                                    color: Color.fromARGB(94, 0, 0, 0),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600))),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: 200,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black, ),
                                child: const Text("Edit Profile", style: TextStyle(color: Colors.white)),
                              ),
                            )])]),
                const SizedBox(height: 30),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      TextButton.icon(

                        onPressed: () {},
                        icon: const Icon(LineAwesomeIcons.box_open_solid),
                        label: const Text('Orders',style: TextStyle(color: Colors.black),),
                        style: ButtonStyle(iconColor: WidgetStateProperty.all(Colors.black,
                        )),
                      ),
                      const VerticalDivider(
                          color: Colors.black),
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.location_on_outlined),
                        label: const Text('My Address',style: TextStyle(color: Colors.black)),
                        style: ButtonStyle(iconColor: WidgetStateProperty.all(Colors.black)),
                      ),
                      const VerticalDivider(),
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.settings_outlined),
                        label: const Text('Settings',style: TextStyle(color: Colors.black)),
                        style: ButtonStyle(iconColor: WidgetStateProperty.all(Colors.black)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(),
                ProfileMenuWidget(title: "Settings", onPress: () {}),
                const Divider(),
                ProfileMenuWidget(title: "Billing Details",  onPress: () {}),
                const Divider(),
                ProfileMenuWidget(title: "User Management", onPress: () {}),
                const Divider(),
                const SizedBox(height: 10,),
                ProfileMenuWidget(title: "Information",  onPress: () {}),
                const Divider(),
                ProfileMenuWidget(
                  title: "Logout",
                  onPress: (){

                  },
                  endIcon: false,
                ) ]),
        ),
      )
      ,);
  }
}
