import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Notes extends StatefulWidget {
  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: http.get(Uri.parse(
            'https://my-json-server.typicode.com/AbdallahYasser/notes/db')),
        builder: (BuildContext ctx, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState != ConnectionState.done)
            return CircularProgressIndicator();
          if (snapshot.hasError) return Text('Oh no! Error! ${snapshot.error}');
          if (!snapshot.hasData) return Text('Nothing to show');

          int statusCode = snapshot.data.statusCode;
          if (statusCode > 299) return Text('Server error: $statusCode');

          Map userData = json.decode(snapshot.data.body);
          List _users = userData["notes"];

          return ListView.builder(
            itemCount: _users.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(_users[index]["title"]),
                  subtitle: Text(_users[index]['contnet']),
                  //
                ),
                margin: EdgeInsets.all(20),
                color: Color(int.parse(_users[index]['color'])),
                //
              );
            },
          );
        });
  }
}
