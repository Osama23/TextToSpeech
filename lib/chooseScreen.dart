import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

enum RequestType {
  PROFILE,
  TODO,
  APPLICATIONS,
  DASHBOARD,
}

class ChooseParentScreen{

  List screensList = [
    "Open profile screen", 
    "open profile screen", 
    "hello",
    "Open to do screen",
    "Open dashboard screen",
    "Open applications screen"
  ];

  StreamController streamController;

  ChooseParentScreen (String screen){
    _choosingSpecificScreen(screen);
  }


  void _choosingSpecificScreen(String screen){
    streamController = new StreamController<String>();
    // check if string exists
    print(screensList.contains(screen)); 
    int screenIndex = screensList.indexOf(screen);
    streamController.sink.add(screensList[screenIndex]);
  }
}


