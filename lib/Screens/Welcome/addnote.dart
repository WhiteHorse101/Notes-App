import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddNote extends StatelessWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  TextEditingController title = TextEditingController();
  TextEditingController note = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('notes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(
              onPressed: () {
                ref.add({'title': title.text, 'note': note.text}).whenComplete(
                    () => Navigator.pop(context));
              },
              child: Text("Save"))
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              child: TextField(
                controller: title,
                decoration: InputDecoration(hintText: 'Title'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                child: TextField(
                  controller: note,
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(hintText: 'Note'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
