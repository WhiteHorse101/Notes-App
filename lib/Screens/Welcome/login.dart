import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import './signup.dart';
import './home.dart';

// Add you database conectivity here for login
class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Container(
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
                  padding: EdgeInsets.only(top: 255.0, left: 20.0, right: 20.0),
                  child: Column(children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        suffixIcon: new Icon(Icons.email_rounded),
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(15.0),
                          ),
                        ),
                        hintText: "Name",
                      ),
                    )
                  ]),
                ),
                Container(
                  padding: EdgeInsets.only(top: 335.0, left: 20.0, right: 20.0),
                  child: Column(children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                          suffixIcon: new Icon(Icons.remove_red_eye_outlined),
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(15.0),
                            ),
                          ),
                          hintText: "Password"),
                    )
                  ]),
                ),
                Container(
                  padding: EdgeInsets.only(top: 455.0, left: 50.0, right: 50.0),
                  child: ButtonTheme(
                    minWidth: 300,
                    height: 45,
                    child: RaisedButton(
                        onPressed: () {
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
                  padding: EdgeInsets.only(top: 405.0, left: 30.0, right: 20.0),
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
