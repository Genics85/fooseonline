import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fooseonline/assets/splash_screen.dart';
import 'package:fooseonline/cart_model.dart';
import 'package:fooseonline/pages/landing_page.dart';
import 'package:provider/provider.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

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
      home: AnimatedSplashScreen(
        splash: SplashScreen(),
        
        splashTransition: SplashTransition.fadeTransition,

        splashIconSize: 200,

        duration: 3000,

         nextScreen: LandingPage()
         ),
    );
  }
}