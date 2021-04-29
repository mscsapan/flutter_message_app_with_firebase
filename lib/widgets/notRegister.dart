import 'package:flutter/material.dart';
import 'package:my_messanger/widgets/textStyle.dart';

class RegisterOrSignIn extends StatelessWidget {
  final String titleOne;
  final String titleTwo;
  final Function onTab;
  RegisterOrSignIn(
      {@required this.titleOne, @required this.titleTwo, @required this.onTab});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            titleOne,
            style: simpleTextStyle2(),
          ),
          GestureDetector(
            onTap: onTab,
            child: Text(
              titleTwo,
              style: simpleTexStyle(),
            ),
          )
        ],
      ),
    );
  }
}
