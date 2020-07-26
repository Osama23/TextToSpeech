import 'package:flutter/material.dart';

class ApplicationsScreen extends StatefulWidget {
  final newRouteName = "/applications-screen";
  @override
  _ApplicationsScreenState createState() => _ApplicationsScreenState();
}

class _ApplicationsScreenState extends State<ApplicationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Center(
          child: Text(
            "Applications Screen",
            textAlign: TextAlign.center,
          ),
        ));
  }
}