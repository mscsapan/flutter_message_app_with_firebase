import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_messanger/authentica/auth.dart';
import 'package:my_messanger/widgets/textStyle.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  GlobalKey<FormState> _resetKey = GlobalKey<FormState>();
  TextEditingController resetTextEditing = new TextEditingController();
  bool loading = false;
  void validateEmail() {
    var val = _resetKey.currentState.validate();
    if (val) {
      Authenticate().resetPassword(resetTextEditing.text).then((value) {
        setState(() {
          loading = true;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
      ),
      body: loading
          ? Container(
              child: Center(
                child: SpinKitCircle(
                  color: Colors.grey,
                  size: 50.0,
                ),
              ),
            )
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Column(
                children: [
                  Form(
                    key: _resetKey,
                    child: TextFormField(
                      validator: (email) =>
                          email.isNotEmpty ? null : 'Field can\'t be Empty',
                      controller: resetTextEditing,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        hintText: 'Your Email',
                        hintStyle: emailTextStyle2(),
                        filled: true,
                        fillColor: Colors.grey[200],
                        prefixIcon: Icon(
                          Icons.email_sharp,
                          color: Colors.green,
                          size: 26.0,
                        ),
                      ),
                      style: resetTextStyle2(),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.pinkAccent,
                          borderRadius: BorderRadius.circular(30)),
                      child: FlatButton.icon(
                        onPressed: () => null, //validateEmail(),
                        icon: Icon(Icons.reset_tv),
                        label: Text('Reset'),
                      ))
                ],
              ),
            ),
    );
  }
}
