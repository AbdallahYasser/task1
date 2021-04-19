import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: http.get(Uri.parse(
            'https://my-json-server.typicode.com/AbdallahYasser/contacts/db')),
        builder: (BuildContext ctx, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState != ConnectionState.done)
            return CircularProgressIndicator();
          if (snapshot.hasError) return Text('Oh no! Error! ${snapshot.error}');
          if (!snapshot.hasData) return Text('Nothing to show');

          int statusCode = snapshot.data.statusCode;
          if (statusCode > 299) return Text('Server error: $statusCode');

          Map userData = json.decode(snapshot.data.body);
          List _users = userData['data'];

          return ListView.builder(
            itemCount: _users.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                    backgroundImage: NetworkImage(_users[index]['avatar'])),
                title: Text(_users[index]['first_name'] +
                    " " +
                    _users[index]['last_name']),
                subtitle: Text(_users[index]['email']),
              );
            },
          );
        });
  }
}
