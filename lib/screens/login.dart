import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_messanger/authentica/auth.dart';
import 'package:my_messanger/screens/home_screen.dart';
import 'package:my_messanger/shared_preferences/save_data.dart';
import 'package:my_messanger/widgets/appBar.dart';
import 'package:my_messanger/widgets/forgetPassword.dart';
import 'package:my_messanger/widgets/notRegister.dart';
import 'package:my_messanger/widgets/textFieldDecoration.dart';

class Login extends StatefulWidget {
  final Function isSignIn;

  Login({this.isSignIn});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailTextEditingController =
      new TextEditingController();
  TextEditingController _passwordTextEditingController =
      new TextEditingController();
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  Authenticate auth = new Authenticate();

  signIn() {
    var val = _key.currentState.validate();
    if (val) {
      SaveUserFunction.saveUserEmail(_emailTextEditingController.text);
      auth
          .logInEmailAndPassword(_emailTextEditingController.text,
              _passwordTextEditingController.text)
          .then((value) {
        SaveUserFunction.saveUserLoggedIn(true);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomeScreen(), fullscreenDialog: true));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar('Login'),
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
                  validator: (email) =>
                      email.isNotEmpty ? null : 'Empty or Wrong email',
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
                SizedBox(
                  height: 4.0,
                ),
                ForgetPassword(),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.green[900],
                        Colors.greenAccent,
                        Colors.green[800],
                      ]),
                      borderRadius: BorderRadius.circular(30)),
                  child: FlatButton.icon(
                      onPressed: () => signIn(),
                      icon: Icon(Icons.arrow_forward_ios),
                      label: Text(
                        'Login',
                        style: GoogleFonts.oswald(
                            fontSize: 25.0, fontWeight: FontWeight.w500),
                      )),
                ),
                RegisterOrSignIn(
                  titleOne: 'Don\'t have an account? ',
                  titleTwo: 'Register Now',
                  onTab: () => widget.isSignIn(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
