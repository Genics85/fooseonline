import 'package:flutter/material.dart';
import 'package:fooseonline/pages/landing_page.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("images/splash.png"),
            fit: BoxFit.cover
            )
            ),
      ),
      SizedBox(
        height: 20,
      ),
      Text(
        "FooseOnline",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      )
    ]);
  }
}
