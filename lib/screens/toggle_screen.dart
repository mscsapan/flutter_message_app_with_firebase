import 'package:flutter/material.dart';
import 'package:my_messanger/screens/login.dart';
import 'package:my_messanger/screens/register.dart';

class ToggleScreen extends StatefulWidget {
  @override
  _ToggleScreenState createState() => _ToggleScreenState();
}

class _ToggleScreenState extends State<ToggleScreen> {
  bool screenView = true;

  void screenToggleView() {
    setState(() {
      screenView = !screenView;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (screenView) {
      return Login(isSignIn: screenToggleView);
    } else {
      return Register(isRegister: screenToggleView);
    }
  }
}
