import 'package:flutter/material.dart';
import 'package:medhealth/utils/constants.dart';

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({Key? key, this.text, this.onPressed}) : super(key: key);
  final String? text;
   final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 100,
      height: 50,
      child: ElevatedButton(
        onPressed:  onPressed,
        child: Text(text!),
        style: ElevatedButton.styleFrom(
            primary: greenColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
