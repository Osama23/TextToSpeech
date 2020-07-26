import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  final newRouteName = "/dashboard-screen";
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Text(
            "Dashboard Screen",
            textAlign: TextAlign.center,
          ),
        ));
  }
}