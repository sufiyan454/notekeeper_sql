import 'package:flutter/material.dart';

import '../modelss/note.dart';
import '../utils/database_helper.dart';
import 'notedetailsss.dart';

class NotList extends StatefulWidget {
  const NotList({super.key});

  @override
  State<NotList> createState() => _NotListState();
}

class _NotListState extends State<NotList> {
  DatabaseHelper _databaseHelper = DatabaseHelper();
  List<Note>? noteList;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notes',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: getNotListView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        onPressed: () {
          navigateToDetail('Add Note');
        },
        tooltip: 'Add Note',
      ),
    );
  }

  ListView getNotListView() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          elevation: 20,
          child: ListTile(
            leading: CircleAvatar(backgroundColor: Colors.red),
            title: Text(
              'Book Flight ticket to LA',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Nov 1,2018'),
            trailing: IconButton(
              onPressed: () {
                navigateToDetail('Edit Note');
              },
              icon: Icon(Icons.delete, color: Colors.grey),
            ),
          ),
        );
      },
    );
  }

  Color getPriorityColor(int priority){
    switch (priority){
      case 1:
        return Colors.red;
      case 2:
        return Colors.yellow;
      default :
        return Colors.yellow;
    }
  }

  Icon getPriorityIcon(int priority){
    switch (priority) {
      case 1 :
        return const Icon(Icons.play_arrow);
      case 2:
        return const Icon(Icons.keyboard_arrow_right);
      default:
        return const Icon(Icons.keyboard_arrow_right);
    }
  }

  void _delete(BuildContext context,Note note)async {
    int result = await _databaseHelper.deleteNote(note.id);
    if (result != 0){
      _showSnapBar(context, 'Note Deleted Succeessfully');
      setState(() {
        noteList!.remove(note);
        count = noteList!.length;
      });
    }
  }
  void _showSnapBar(BuildContext context ,String message){
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


  void navigateToDetail(String title) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => NoteDetails(appBarTitle: title),
      ),
    );
  }
}
