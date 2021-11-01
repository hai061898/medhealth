import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medhealth/utils/constants.dart';

class CardProduct extends StatelessWidget {
  final String? imageProduct;
  final String? nameProduct;
  final String? price;
  const CardProduct({Key? key, this.imageProduct, this.nameProduct, this.price}):super(key: key);
  @override
  Widget build(BuildContext context) {
    final priceFormat = NumberFormat("#,##0", "EN_US");
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Image.network(
            imageProduct!,
            width: 115,
            height: 76,
          ),
         const SizedBox(
            height: 16,
          ),
          Text(
            nameProduct!,
            style: regulerTextStyle,
            textAlign: TextAlign.center,
          ),
         const SizedBox(
            height: 14,
          ),
          Text(
            "Rp " + priceFormat.format(int.parse(price!)),
            style: boldTextStyle,
          )
        ],
      ),
    );
  }
}