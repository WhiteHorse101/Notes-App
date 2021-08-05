import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './login.dart';
import './home.dart';

class SignupScreen extends StatefulWidget {
  @override
  Signup createState() => Signup();
}

// Add you database conectivity here for signup
class Signup extends State<SignupScreen> {
  late String _email, _password;
  final auth = FirebaseAuth.instance;
  bool _isObscure = true;

  final _formKey = GlobalKey<FormState>();

  void validate() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      print('Everything looks good!');
      print(_email);
      print(_password);
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
                      padding: EdgeInsets.fromLTRB(15.0, 125.0, 0.0, 0.0),
                      child: Text(
                        "Start Taking,\nNote's",
                        style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 260.0, 0.0, 0.0),
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(
                            top: 325.0, left: 20.0, right: 20.0),
                        child: Column(children: <Widget>[
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              suffixIcon: new Icon(Icons.email_rounded),
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(15.0)),
                              ),
                              hintText: "E-mail",
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
                          ),
                        ])),
                    Container(
                        padding: EdgeInsets.only(
                            top: 405.0, left: 20.0, right: 20.0),
                        child: Column(children: <Widget>[
                          TextFormField(
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
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
                                        const Radius.circular(15.0))),
                                hintText: "Password",
                              ),
                              validator: (input) {
                                if (input == null || input.isEmpty) {
                                  return 'Password can not be null';
                                }
                                if (input.length < 6) {
                                  return 'Password lenght must be greater then 6';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                _password = value;
                                setState(() {
                                  _password = value.trim();
                                });
                              }),
                        ])),
                    Container(
                      padding:
                          EdgeInsets.only(top: 505.0, left: 50.0, right: 50.0),
                      child: ButtonTheme(
                        minWidth: 300,
                        height: 45,
                        child: RaisedButton(
                          onPressed: () {
                            validate();
                            auth.createUserWithEmailAndPassword(
                                email: _email, password: _password);
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
                            "Sign Up",
                            style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontSize: 18,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: 570.0, left: 183.0, right: 183.0),
                      child: Text(
                        "Or",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.only(top: 605.0, left: 50.0, right: 50.0),
                      child: ButtonTheme(
                        height: 45,
                        minWidth: 300,
                        child: RaisedButton(
                            onPressed: () {
                              validate();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()),
                              );
                            },
                            color: Color(0xff246BFE),
                            elevation: 8,
                            child: Text(
                              "Log In",
                              style: TextStyle(
                                  color: Color(0xffFFFFFF), fontSize: 18),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                      ),
                    )
                  ],
                ))
          ],
        ));
  }
}
