import 'package:flutter/material.dart';
import 'package:medhealth/models/profile.dart';
import 'package:medhealth/pages/login/login_screen.dart';
import 'package:medhealth/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({ Key? key }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
   String? fullName, createdDate, phone, email, address;
  getPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      fullName = sharedPreferences.getString(PrefProfile.name);
      createdDate = sharedPreferences.getString(PrefProfile.cretedAt);
      phone = sharedPreferences.getString(PrefProfile.phone);
      email = sharedPreferences.getString(PrefProfile.email);
      address = sharedPreferences.getString(PrefProfile.address);
    });
  }

   signOut() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(PrefProfile.idUSer);
    sharedPreferences.remove(PrefProfile.name);
    sharedPreferences.remove(PrefProfile.email);
    sharedPreferences.remove(PrefProfile.phone);
    sharedPreferences.remove(PrefProfile.address);
    sharedPreferences.remove(PrefProfile.cretedAt);

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) =>const LoginScreen()),
        (route) => false);
  }
  
  @override
  void initState() {
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding:const EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "My Profile",
                  style: regulerTextStyle.copyWith(fontSize: 25),
                ),
                InkWell(
                  onTap: () {
                    signOut();
                  },
                  child:const Icon(
                    Icons.exit_to_app,
                    color: greenColor,
                  ),
                )
              ],
            ),
          ),
          Container(
            padding:const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fullName!,
                  style: boldTextStyle.copyWith(fontSize: 18),
                ),
               const SizedBox(
                  height: 8,
                ),
                Text(
                  "Join at " + createdDate!.toString(),
                  style: lightTextStyle,
                )
              ],
            ),
          ),
         const SizedBox(
            height: 20,
          ),
          Container(
            color: whiteColor,
            padding:const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Phone",
                  style: lightTextStyle,
                ),
               const  SizedBox(
                  height: 8,
                ),
                Text(
                  phone!,
                  style: boldTextStyle.copyWith(fontSize: 18),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding:const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Email",
                  style: lightTextStyle,
                ),
               const SizedBox(
                  height: 8,
                ),
                Text(
                  email!,
                  style: boldTextStyle.copyWith(fontSize: 18),
                ),
              ],
            ),
          ),
         const SizedBox(
            height: 20,
          ),
          Container(
            color: whiteColor,
            padding:const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Address",
                  style: lightTextStyle,
                ),
               const  SizedBox(
                  height: 8,
                ),
                Text(
                  address!,
                  style: boldTextStyle.copyWith(fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}