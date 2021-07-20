import 'package:flutter/material.dart';
import './login.dart';

class Signup extends StatelessWidget {
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
                    "Start Taking,\nNote's",
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 180.0, 0.0, 0.0),
                  child: Text(
                    "Create Account",
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Container(
                    padding:
                        EdgeInsets.only(top: 255.0, left: 20.0, right: 20.0),
                    child: Column(children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                          suffixIcon: new Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(15.0),
                            ),
                          ),
                          hintText: "Name",
                        ),
                      )
                    ])),
                Container(
                    padding:
                        EdgeInsets.only(top: 335.0, left: 20.0, right: 20.0),
                    child: Column(children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                          suffixIcon: new Icon(Icons.email_rounded),
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(15.0)),
                          ),
                          hintText: "E-mail",
                        ),
                      )
                    ])),
                Container(
                    padding:
                        EdgeInsets.only(top: 415.0, left: 20.0, right: 20.0),
                    child: Column(children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                          suffixIcon: new Icon(Icons.remove_red_eye_outlined),
                          border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(15.0))),
                          hintText: "Password",
                        ),
                      )
                    ])),
                Container(
                    padding:
                        EdgeInsets.only(top: 495.0, left: 20.0, right: 20.0),
                    child: Column(children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                          suffixIcon: new Icon(Icons.remove_red_eye_outlined),
                          border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(15.0))),
                          hintText: "Retype Password",
                        ),
                      )
                    ])),
                Container(
                  padding: EdgeInsets.only(top: 575.0, left: 50.0, right: 50.0),
                  child: ButtonTheme(
                    minWidth: 300,
                    height: 45,
                    child: RaisedButton(
                      onPressed: () {},
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
                  padding:
                      EdgeInsets.only(top: 640.0, left: 183.0, right: 183.0),
                  child: Text(
                    "Or",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 675.0, left: 50.0, right: 50.0),
                  child: ButtonTheme(
                    height: 45,
                    minWidth: 300,
                    child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        color: Color(0xff246BFE),
                        elevation: 8,
                        child: Text(
                          "Log In",
                          style:
                              TextStyle(color: Color(0xffFFFFFF), fontSize: 18),
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
