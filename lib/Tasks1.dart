import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Tasks extends StatefulWidget {
  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  Widget build(BuildContext context) {
    List _checked1;
    return FutureBuilder(
      future: http.get(Uri.parse(
          'https://my-json-server.typicode.com/AbdallahYasser/tasks/db')),
      builder: (BuildContext ctx, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState != ConnectionState.done)
          return CircularProgressIndicator();
        if (snapshot.hasError) return Text('Oh no! Error! ${snapshot.error}');
        if (!snapshot.hasData) return Text('Nothing to show');

        int statusCode = snapshot.data.statusCode;
        if (statusCode > 299) return Text('Server error: $statusCode');

        Map _userData = json.decode(snapshot.data.body);
        List _users = _userData["tasks"];
        _checked1 = stateBuilder(_users.length, _users);
        return ListView.builder(
          itemCount: _users.length,
          itemBuilder: (context, index) {
            return CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(_users[index]['title']),
              subtitle: Text(_users[index]['subtitle']),
              value: _checked1[index],
              onChanged: (bool value) {
                setState(() {
                  _checked1[index] = value;
                });
              },
            );
          },
        );
      },
    );
  }
}

List stateBuilder(int length, List stateList) {
  List _checked = List<bool>.filled(0, false, growable: true);
  for (int i = 0; i < length; i++) {
    if (stateList[i]['state'] == 'true') {
      _checked.add(true);
    } else {
      _checked.add(false);
    }
  }
  return _checked;
}
