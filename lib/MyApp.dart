import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maglis_app/view/addExpense.dart';
import 'package:maglis_app/view/addLoan.dart';
import 'package:maglis_app/view/addOrder.dart';
import 'package:maglis_app/view/addRepresentatives.dart';
import 'package:maglis_app/view/addRoute.dart';
import 'package:maglis_app/view/addSalary.dart';
import 'package:maglis_app/view/adminPage.dart';
import 'package:maglis_app/view/allScreens.dart';
import 'package:maglis_app/view/approved-one.dart';
import 'package:maglis_app/view/approvedData.dart';
import 'package:maglis_app/view/approvedDetails.dart';
import 'package:maglis_app/view/approvedTwo.dart';
import 'package:maglis_app/view/beforeLogin.dart';
import 'package:maglis_app/view/distribute.dart';
import 'package:maglis_app/view/cashFlow.dart';
import 'package:maglis_app/view/cashFlowDetails.dart';
import 'package:maglis_app/view/collectedRoute.dart';
import 'package:maglis_app/view/customerServicesHome.dart';
import 'package:maglis_app/view/dateDetails.dart';
import 'package:maglis_app/view/dateScreen.dart';
import 'package:maglis_app/view/distributionCities.dart';
import 'package:maglis_app/view/distributionType.dart';
import 'package:maglis_app/view/expenses.dart';
import 'package:maglis_app/view/expensesNotApprobedDetails.dart';
import 'package:maglis_app/view/finance.dart';
import 'package:maglis_app/view/financeAndShipments.dart';
import 'package:maglis_app/view/home.dart';
import 'package:maglis_app/view/lineDetails.dart';
import 'package:maglis_app/view/loans.dart';
import 'package:maglis_app/view/login.dart';
import 'package:maglis_app/view/monthSalary.dart';
import 'package:maglis_app/view/newRoutes.dart';
import 'package:maglis_app/view/notApproved-one.dart';
import 'package:maglis_app/view/notApprovedDate.dart';
import 'package:maglis_app/view/notApprovedDetails.dart';
import 'package:maglis_app/view/notApprovedTwo.dart';
import 'package:maglis_app/view/operations.dart';
import 'package:maglis_app/view/orderCustormerScreen.dart';
import 'package:maglis_app/view/orders.dart';
import 'package:maglis_app/view/ordersLine.dart';
import 'package:maglis_app/view/ordersScreen.dart';
import 'package:maglis_app/view/recivedPage.dart';
import 'package:maglis_app/view/reports.dart';
import 'package:maglis_app/view/representativePage.dart';
import 'package:maglis_app/view/representatives.dart';
import 'package:maglis_app/view/revenue.dart';
import 'package:maglis_app/view/salaries.dart';
import 'package:maglis_app/view/sales.dart';
import 'package:maglis_app/view/salesAll.dart';
import 'package:maglis_app/view/salesHome.dart';
import 'package:maglis_app/view/OrderDetails.dart';
import 'package:maglis_app/view/sentPage.dart';
import 'package:maglis_app/view/shipment.dart';
import 'package:maglis_app/view/splashscreen.dart';
import 'package:maglis_app/view/RouteItemDetails.dart';
import 'package:maglis_app/view/OrderRouteDetails.dart';

import 'view/allScreens.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Get.key,
      home: AdminPage(),
      routes: {
        "/splashscreen": (ctx) => SplashScreen(),
        "/allScreens": (ctx) => AllScreens(),
        "/addOrder": (ctx) => AddOrder(),
        "/addRoute": (ctx) => AddRoute(),
        "/newRoute": (ctx)=> NewRoutes(),
        "/beforeLogin": (ctx) => BeforeLogin(),
        "/home": (ctx) => HomePage(),
        "/login": (ctx) => LoginPage(),
        "/orders": (ctx) => OrdersPage(),
        "/orderScreen": (ctx) => OrderScreen(),
        "/orderDetails": (ctx) => OrderDetails(),
        "/distribution": (ctx) => Distribution(),
        "/distributionCities": (ctx) => DistributionCities(),
        "/distributionType": (ctx) => DistributionType(),
        "/reprePage": (ctx) => ReprePage(),
        "/representatives": (ctx) => RepresentativesPage(),
        "/addRepresentatives": (ctx) => AddRepresentatives(),
        "/financeAndShipments": (ctx) => FinanceAndShipments(),
        "/shipments": (ctx) => Shipments(),
        "/admin": (ctx) => AdminPage(),
        "/finance": (ctx) => Finance(),
        "/revenue": (ctx) => Revenue(),
        "/expense": (ctx) => Expense(),
        "/expensesNotApprovedDetails": (ctx) => ExpensesNotApprovedDetails(),
        "/cashFlow": (ctx) => CashFlow(),
        "/cashFlowDetails": (ctx) => CashFlowDetails(),
        "/collectedRoutes": (ctx) => CollectedRoutes(),
        "/dateScreen": (ctx) => DateScreen(),
        "/dateDetails": (ctx) => DateDetails(),
        "/routeItemDetails": (ctx) => RouteItemDetails(),
        "/orderRouteDetails": (ctx) => OrderRouteDetails(),
        "/approved-one": (ctx) => ApprovedOne(),
        "/approvedDate": (ctx) => ApprovedDate(),
        "/notapproved-one": (ctx) => NotApprovedOne(),
        "/notApprovedDate": (ctx) => NotApprovedDate(),
        "/approvedDetails": (ctx) => ApprovedDetails(),
        "/notApprovedDetails": (ctx) => NotApprovedDetails(),
        "/addExpense": (ctx) => AddExpense(),
        "/approvedTwo": (ctx) => ApprovedTwo(),
        "/notapprovedTwo": (ctx) => NotApprovedTwo(),
        "/loans": (ctx) => Loans(),
        "/addLoans": (ctx) => AddLoans(),
        "/salaries": (ctx) => SalariesScreen(),
        "/monthSalary": (ctx) => MonthSalary(),
        "/addSalary": (ctx) => AddSalary(),
      },

      //initialRoute: '/distributionCities',
    );
  }
}
