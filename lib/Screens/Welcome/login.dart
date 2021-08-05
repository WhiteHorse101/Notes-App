import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import './signup.dart';
import './home.dart';

class LoginScreen extends StatefulWidget {
  @override
  Login createState() => Login();
}

// Add you database conectivity here for login
class Login extends State<LoginScreen> {
  late String _email, _pass;
  final auth = FirebaseAuth.instance;
  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();

  void validate() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      print('Everything looks good!');
      print(_email);
      print(_pass);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 45.0, 0.0, 0.0),
                  child: Text(
                    "Welcome \nBack",
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 180.0, 0.0, 0.0),
                  child: Text(
                    "Log In",
                    style: TextStyle(fontSize: 38),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 245.0, left: 20.0, right: 20.0),
                  child: Column(children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        suffixIcon: new Icon(Icons.email_rounded),
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(15.0),
                          ),
                        ),
                        hintText: "Email",
                      ),
                      validator: (input) {
                        if (input == null || input.isEmpty) {
                          return 'Enter Email';
                        }
                        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(input)) {
                          return 'Please enter a valid email address';
                        }
                        // Return null if the entered email is valid
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _email = value.trim();
                        });
                      },
                    )
                  ]),
                ),
                Container(
                  padding: EdgeInsets.only(top: 335.0, left: 20.0, right: 20.0),
                  child: Column(children: <Widget>[
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(_isObscure
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(15.0),
                            ),
                          ),
                          hintText: "Password"),
                      validator: (input) {
                        if (input == null || input.isEmpty) {
                          return 'Password is required';
                        }
                        if (input.length < 6) {
                          return 'Password lenght must be greater then 6';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _pass = value.trim();
                        });
                      },
                    )
                  ]),
                ),
                Container(
                  padding: EdgeInsets.only(top: 465.0, left: 50.0, right: 50.0),
                  child: ButtonTheme(
                    minWidth: 300,
                    height: 45,
                    child: RaisedButton(
                        onPressed: () {
                          validate();
                          auth.signInWithEmailAndPassword(
                              email: _email, password: _pass);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            ),
                          );
                        },
                        color: Color(0xff246BFE),
                        elevation: 8,
                        child: Text(
                          "Log In",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 425.0, left: 30.0, right: 20.0),
                  child: RichText(
                    text: TextSpan(
                      text: "Forgot Password ?",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Pass your forgot password code here
                          print("Forgot Password Pressed");
                        },
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
