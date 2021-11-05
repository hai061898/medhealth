import 'package:flutter/material.dart';
import 'package:medhealth/pages/login/login_screen.dart';
import 'package:medhealth/widgets/button_primary.dart';
import 'package:medhealth/widgets/ilustration.dart';
import 'package:medhealth/widgets/logo_space.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LogoSpace(
        child: Column(  
          children: [
             const SizedBox(
              height: 45,
            ),
            Ilustration(
              image: "assets/splash_ilustration.png",
              title: "Find your medical\nsolution",
              subtitle1: "Consult with a doctor",
              subtitle2: "whereever and whenever you want",
              child: ButtonPrimary(
                text: "GET STARTED",
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) =>const LoginScreen()));
                },
              ),
            ),

          ],
        ),
      )
    );
  }
}