import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  final newRouteName = "/todo-screen";
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow,
        body: Center(
          child: Text(
            "Todo Screen",
            textAlign: TextAlign.center,
          ),
        ));
  }
}
