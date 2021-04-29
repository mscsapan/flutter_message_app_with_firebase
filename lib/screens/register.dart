import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_messanger/authentica/auth.dart';
import 'package:my_messanger/database/user_record.dart';
import 'package:my_messanger/screens/home_screen.dart';
import 'package:my_messanger/shared_preferences/save_data.dart';
import 'package:my_messanger/widgets/appBar.dart';
import 'package:my_messanger/widgets/notRegister.dart';
import 'package:my_messanger/widgets/textFieldDecoration.dart';

class Register extends StatefulWidget {
  final Function isRegister;

  Register({this.isRegister});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _nameTextEditingController =
      new TextEditingController();
  TextEditingController _emailTextEditingController =
      new TextEditingController();
  TextEditingController _passwordTextEditingController =
      new TextEditingController();
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  Authenticate auth = new Authenticate();
  Database db = new Database();
  String exp =
      "^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$";

  void validateField() {
    var val = _key.currentState.validate();
    if (val) {
      auth.registerEmailAndPassword(_emailTextEditingController.text,
          _passwordTextEditingController.text);

      SaveUserFunction.saveUserName(_nameTextEditingController.text);
      SaveUserFunction.saveUserEmail(_emailTextEditingController.text);

      Map<String, dynamic> map = {
        "name": _nameTextEditingController.text,
        "email": _emailTextEditingController.text,
      };
      db.saveUserInfo(map);
      SaveUserFunction.saveUserLoggedIn(true);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar('Register'),
      body: Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        margin: EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(),
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SimpleTextFieldDecoration(
                    validator: (name) =>
                        name.isNotEmpty ? null : 'Please insert you name',
                    controller: _nameTextEditingController,
                    hintText: 'Username',
                    isSecure: false,
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.blueGrey,
                    )),
                SimpleTextFieldDecoration(
                  validator: (email) => RegExp(exp).hasMatch(email)
                      ? null
                      : 'Please insert correct email',
                  controller: _emailTextEditingController,
                  hintText: 'Email',
                  isSecure: false,
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.green,
                  ),
                ),
                SimpleTextFieldDecoration(
                  validator: (password) =>
                      password.isEmpty || password.length < 4
                          ? 'Empty or Short length'
                          : null,
                  controller: _passwordTextEditingController,
                  hintText: 'Password',
                  isSecure: true,
                  prefixIcon: Icon(
                    Icons.enhanced_encryption_outlined,
                    color: Colors.pink,
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.green[900],
                        Colors.greenAccent,
                        Colors.green[800],
                      ]),
                      borderRadius: BorderRadius.circular(30)),
                  child: FlatButton.icon(
                      onPressed: () => validateField(),
                      icon: Icon(Icons.arrow_forward_ios),
                      label: Text(
                        'Register',
                        style: GoogleFonts.oswald(
                            fontSize: 25.0, fontWeight: FontWeight.w500),
                      )),
                ),
                SizedBox(height: 10.0),
                RegisterOrSignIn(
                    titleOne: 'Already have an account? ',
                    titleTwo: 'SignIn',
                    onTab: () => widget.isRegister())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
