import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:medhealth/api/url_api.dart';
import 'package:medhealth/models/history_product.dart';
import 'package:medhealth/models/profile.dart';
import 'package:medhealth/utils/constants.dart';
import 'package:medhealth/widgets/card_history.dart';
import 'package:medhealth/widgets/ilustration.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<HistoryOrdelModel> list = [];
  String? userID;

  getPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      userID = sharedPreferences.getString(PrefProfile.idUSer);
    });
    getHistory();
  }

  getHistory() async {
    list.clear();
    var urlHistory = Uri.parse(BASEURL.historyOrder + userID!);
    final response = await http.get(urlHistory);
    if (response.statusCode == 200) {
      setState(() {
        final data = jsonDecode(response.body);
        for (Map<String, dynamic> item in data) {
          list.add(HistoryOrdelModel.fromJson(item));
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                height: 70,
                child: Text(
                  "History Order",
                  style: regulerTextStyle.copyWith(fontSize: 25),
                )),
            SizedBox(
              height: (list.isEmpty) ? 80 : 20,
            ),
            list.isEmpty
                ? Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: const Ilustration(
                        image: "assets/no_history_ilustration.png",
                        subtitle1: "You dont have history order",
                        subtitle2: "lets shopping now",
                        title: "Oops, there are no history order",
                      ),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (context, i) {
                      final x = list[i];
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 8),
                        child: CardHistory(
                          model: x,
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
