import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_messanger/widgets/textStyle.dart';

class SearchTile extends StatelessWidget {
  final String username;
  final String email;
  SearchTile({this.username, this.email});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                username,
                style: nameTextStyle2(),
              ),
              Text(
                email,
                style: emailTextStyle2(),
              ),
              SizedBox(
                height: 25.0,
              ),
            ],
          ),
          Spacer(),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
              margin: EdgeInsets.only(right: 15.0),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(0)),
              ),
              child: Icon(
                Icons.message,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
