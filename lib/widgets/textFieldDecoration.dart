import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class SimpleTextFieldDecoration extends StatelessWidget {
  TextEditingController controller = new TextEditingController();
  final String hintText;
  bool isSecure;
  final Icon prefixIcon;
  final Function validator;

  SimpleTextFieldDecoration(
      {this.controller,
      this.hintText,
      this.isSecure,
      this.prefixIcon,
      @required this.validator});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(30),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            filled: true,
            fillColor: Colors.grey[200],
            hintText: hintText,
            prefixIcon: prefixIcon,
            hintStyle:
                GoogleFonts.acme(fontSize: 20.0, fontWeight: FontWeight.w400)),
        obscureText: isSecure,
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }
}
