import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 200, left: 100),
            child: Text(
              'Notes App',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20, left: 100),
            child: Text(
              'Minor Project By:',
              style: TextStyle(fontSize: 25),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20, left: 100),
            child: Text(
              'Rishabh, Sakshi, Srushti,\n       Mayuri, Utkarsha',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
