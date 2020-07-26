import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final newRouteName = "/profile-screen";
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        body: Center(
          child: Text(
            "Profile Screen",
            textAlign: TextAlign.center,
          ),
        ));
  }
}
