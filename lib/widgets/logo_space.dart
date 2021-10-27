import 'package:flutter/material.dart';

class LogoSpace extends StatelessWidget {
  const LogoSpace({Key? key, this.child}) : super(key: key);
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Image.asset(
            "assets/logo.png",
            width: 115,
          ),
          child ?? const SizedBox()
        ],
      ),
    );
  }
}
