import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_messanger/screens/toggle_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primaryColor: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity),
    home: ToggleScreen(),
  ));
}
