import 'package:flutter/material.dart';
import 'package:medhealth/pages/main/main_screen.dart';
import 'package:medhealth/widgets/button_primary.dart';
import 'package:medhealth/widgets/ilustration.dart';
import 'package:medhealth/widgets/logo_space.dart';

class SuccessCheckout extends StatelessWidget {
  const SuccessCheckout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LogoSpace(
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(24),
        children: [
          const SizedBox(
            height: 80,
          ),
          const Ilustration(
            image: "assets/order_success_ilustration.png",
            title: "Yeay, your order was successfully",
            subtitle1: "Consult with a doctor,",
            subtitle2: "Wherever and whenever you are",
          ),
          const SizedBox(
            height: 30,
          ),
          ButtonPrimary(
            text: "BACK TO HOME",
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const MainScreen()),
                  (route) => false);
            },
          )
        ],
      ),
    ));
  }
}
