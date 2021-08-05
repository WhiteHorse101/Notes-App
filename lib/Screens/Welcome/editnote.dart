import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditNote extends StatefulWidget {
  late DocumentSnapshot docToEdit;
  EditNote({required this.docToEdit});

  @override
  _EditNoteState createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  TextEditingController title = TextEditingController();
  TextEditingController note = TextEditingController();

  @override
  void initState() {
    super.initState();
    title = TextEditingController(text: widget.docToEdit.data()!['title']);
    note = TextEditingController(text: widget.docToEdit.data()!['note']);
  }

  late final QuerySnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(
              onPressed: () {
                widget.docToEdit.reference.update({
                  'title': title.text,
                  'note': note.text
                }).whenComplete(() => Navigator.pop(context));
              },
              child: Text("Save")),
          FlatButton(
            onPressed: () async {
              widget.docToEdit.reference
                  .delete()
                  .whenComplete(() => Navigator.pop(context));
            },
            child: Text('Delete'),
          ),
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
