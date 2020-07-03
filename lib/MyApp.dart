import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maglis_app/view/addExpense.dart';
import 'package:maglis_app/view/addRepresentatives.dart';
import 'package:maglis_app/view/adminPage.dart';
import 'package:maglis_app/view/allScreens.dart';
import 'package:maglis_app/view/approved-one.dart';
import 'package:maglis_app/view/approvedDetails.dart';
import 'package:maglis_app/view/approvedTwo.dart';
import 'package:maglis_app/view/beforeLogin.dart';
import 'package:maglis_app/view/cairoDistribute.dart';
import 'package:maglis_app/view/cashFlow.dart';
import 'package:maglis_app/view/collectedRoute.dart';
import 'package:maglis_app/view/dateDetails.dart';
import 'package:maglis_app/view/dateScreen.dart';
import 'package:maglis_app/view/distributionCities.dart';
import 'package:maglis_app/view/expenses.dart';
import 'package:maglis_app/view/finance.dart';
import 'package:maglis_app/view/financeAndShipments.dart';
import 'package:maglis_app/view/home.dart';
import 'package:maglis_app/view/login.dart';
import 'package:maglis_app/view/notApproved-one.dart';
import 'package:maglis_app/view/notApprovedDetails.dart';
import 'package:maglis_app/view/notApprovedTwo.dart';
import 'package:maglis_app/view/orders.dart';
import 'package:maglis_app/view/representativePage.dart';
import 'package:maglis_app/view/representatives.dart';
import 'package:maglis_app/view/revenue.dart';
import 'package:maglis_app/view/shipment.dart';
import 'package:maglis_app/view/splashscreen.dart';
import 'package:maglis_app/view/customerItemDetails.dart';
import 'package:maglis_app/view/customerRepresentative.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Get.key,
      home: SplashScreen(),
      routes: {
        "/splashscreen":(ctx)=> SplashScreen(),
        "/allScreens":(ctx)=> AllScreens(),
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
        "/expense": (ctx)=>Expense(),
        "/cashFlow": (ctx)=>CashFlow(),
        "/collectedRoutes": (ctx)=>CollectedRoutes(),
        "/dateScreen":(ctx)=> DateScreen(),
        "/dateDetails": (ctx)=> DateDetails(),
        "/customerItemDetails":(ctx)=>CustomerItemDetails(),
        "/customerRepresentative":(ctx)=>CustomerRepresentative(),
        "/approved-one":(ctx)=>ApprovedOne(),
        "/notapproved-one":(ctx)=>NotApprovedOne(),
        "/approvedDetails":(ctx)=>ApprovedDetails(),
        "/notApprovedDetails":(ctx)=>NotApprovedDetails(),
        "/addExpense":(ctx)=>AddExpense(),
        "/approvedTwo":(ctx)=>ApprovedTwo(),
        "/notapprovedTwo":(ctx)=>NotApprovedTwo(),
      },

      //initialRoute: '/distributionCities',
    );
  }
}