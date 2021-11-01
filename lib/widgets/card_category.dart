import 'package:flutter/material.dart';
import 'package:medhealth/utils/constants.dart';

class CardCategory extends StatelessWidget {
  final String? imageCategory;
  final String? nameCategory;

   const CardCategory({Key? key,this.imageCategory, this.nameCategory}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imageCategory!,
          width: 65,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          nameCategory!,
          style: mediumTextStyle.copyWith(fontSize: 10),
        )
      ],
    );
  }
}