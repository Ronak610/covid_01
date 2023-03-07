import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home/view/homepage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => HomePage(),
      },
    ),
  );
}