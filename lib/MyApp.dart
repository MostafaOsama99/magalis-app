import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maglis_app/view/addRepresentatives.dart';
import 'package:maglis_app/view/adminPage.dart';
import 'package:maglis_app/view/beforeLogin.dart';
import 'package:maglis_app/view/cairoDistribute.dart';
import 'package:maglis_app/view/cashFlow.dart';
import 'package:maglis_app/view/distributionCities.dart';
import 'package:maglis_app/view/finance.dart';
import 'package:maglis_app/view/financeAndShipments.dart';
import 'package:maglis_app/view/home.dart';
import 'package:maglis_app/view/login.dart';
import 'package:maglis_app/view/orders.dart';
import 'package:maglis_app/view/representativePage.dart';
import 'package:maglis_app/view/representatives.dart';
import 'package:maglis_app/view/revenue.dart';
import 'package:maglis_app/view/shipment.dart';
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
        "/login":(ctx)=> LoginPage(),
        "/orders":(ctx)=> OrdersPage(),
        "/distributionCities":(ctx)=> DistributionCities(),
        "/cairoDistribution":(ctx)=> CairoDistribution(),
        "/reprePage":(ctx)=> ReprePage(),
        "/representatives": (ctx)=>RepresentativesPage(),
        "/addRepresentatives": (ctx)=>AddRepresentatives(),
        "/financeAndShipments": (ctx)=>FinanceAndShipments(),
        "/shipments": (ctx)=>Shipments(),
        "/admin": (ctx)=>AdminPage(),
        "/finance": (ctx)=>Finance(),
        "/revenue": (ctx)=>Revenue(),
        "/cashFlow": (ctx)=>CashFlow(),
      },

      initialRoute: '/splashscreen',
    );
  }
}