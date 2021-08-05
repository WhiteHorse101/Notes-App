import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Profile.dart';
import 'addnote.dart';
import 'editnote.dart';
import 'aboutus.dart';

class Home extends StatelessWidget {
  final ref = FirebaseFirestore.instance.collection('notes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, // Do not delete this line of code this saves the code from Null Safety

      // Appbar Code
      appBar: AppBar(
        title: Text("Dashboard"),
        actions: <Widget>[],
      ),
      // Side Drawer Code
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Notes App',
                style: TextStyle(fontSize: 45),
              ),
            ),
            ListTile(
              title: Text(
                "Add New Note",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => AddNote()));
              },
            ),
            ListTile(
              title: Text(
                "Reminders",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {},
            ),
            Divider(
              color: Colors.white,
            ),
            ListTile(
              title: Text(
                "Trash",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
            ),
            ListTile(
              title: Text(
                "Edit Note",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Home()));
              },
            ),
            Divider(
              color: Colors.white,
            ),
            ListTile(
              title: Text(
                "Setting",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                "About Us",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => AboutUs()));
              },
            ),
            Divider(
              color: Colors.white,
            ),
          ],
        ),
      ),
      body: StreamBuilder(
          stream: ref.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: snapshot.hasData ? snapshot.data!.docs.length : 0,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditNote(
                                  docToEdit: snapshot.data!.docs[index])));
                    },
                    onDoubleTap: () {},
                    child: Container(
                      height: 150,
                      color: Colors.grey[200],
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            snapshot.data!.docs[index]['title'],
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                          Text(snapshot.data!.docs[index]['note'],
                              textAlign: TextAlign.left,
                              style: TextStyle(color: Colors.black)),
                        ],
                      ),
                    ),
                  );
                });
          }),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => AddNote()));
          print('Floating Button pressed ');
          // Add your onPressed code here!
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
