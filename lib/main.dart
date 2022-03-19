import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fooseonline/cart_model.dart';
import 'package:fooseonline/pages/landing_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context)=>CartModel(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      home: LandingPage(),
    );
  }
}