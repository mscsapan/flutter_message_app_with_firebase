import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_messanger/widgets/textStyle.dart';

// ignore: must_be_immutable
class SearchTextField extends StatelessWidget {
  TextEditingController controller = new TextEditingController();
  final String hintText;
  final IconData icon;
  Function onTab;

  SearchTextField(
      {@required this.controller,
      this.hintText,
      this.icon,
      @required this.onTab});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[700],
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: searchNameTextStyle2(),
              ),
              style: searchNameTextStyle2(),
            ),
          ),
          InkWell(
              onTap: onTab,
              child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(30)),
                  child: Icon(
                    icon,
                    size: 22.0,
                    color: Colors.white,
                  ))),
        ],
      ),
    );
  }
}
