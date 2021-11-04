import 'package:flutter/material.dart';
import 'package:medhealth/models/history_product.dart';
import 'package:medhealth/utils/constants.dart';

class CardHistory extends StatelessWidget {
  final HistoryOrdelModel? model;

  const CardHistory({Key? key,this.model}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("INV/" + model!.invoice.toString(),
                style: boldTextStyle.copyWith(fontSize: 16)),
            const Icon(
              Icons.arrow_forward_ios,
              size: 14,
            )
          ],
        ),
       const SizedBox(
          height: 6,
        ),
        Text(
          model!.orderAt.toString(),
          style: regulerTextStyle.copyWith(fontSize: 16),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          model!.status.toString() == "1"
              ? "Pesanan sedang dikonfirmasi"
              : "Pesanan selesai",
          style: lightTextStyle,
        ),
        const Divider()
      ],
    );
  }
}