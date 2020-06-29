import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maglis_app/view/beforeLogin.dart';
import 'package:maglis_app/view/home.dart';
import 'package:maglis_app/view/login.dart';
import 'package:maglis_app/view/splashscreen.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Get.key,
      routes: {
        "/splashscreen":(ctx)=> SplashScreen(),
        "/beforeLogin":(ctx)=> BeforeLogin(),
        "/home":(ctx)=> HomePage(),
        "/login":(ctx)=> LoginPage()
      },

      initialRoute: '/splashscreen',
    );
  }
}