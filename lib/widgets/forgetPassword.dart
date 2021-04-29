import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_messanger/screens/forgetPassword.dart';

class ForgetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => ResetPassword())),
            child: Text('Forget Password',
                style: GoogleFonts.roboto(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }
}
