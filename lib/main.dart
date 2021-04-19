import 'package:flutter/material.dart';

import 'Appointments.dart';
import 'Contacts.dart';
import 'Notes.dart';
import 'Tasks.dart';
//import 'Tasks1.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            title: Text('FlutterBook'),
            bottom: TabBar(
              indicatorColor: Colors.indigo[900],
              tabs: [
                Tab(
                  icon: Icon(Icons.calendar_today_outlined),
                  text: ('Appointment'),
                ),
                Tab(
                  icon: Icon(Icons.contacts),
                  text: ('Contacts'),
                ),
                Tab(
                  icon: Icon(Icons.note_sharp),
                  text: ('Notes'),
                ),
                Tab(
                  icon: Icon(Icons.check_box),
                  text: ('Tasks'),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {},
          ),
          body: TabBarView(
            children: [
              CalendarOne(),
              Contacts(),
              Notes(),
              Tasks(),
            ],
          ),
        ),
      ),
    );
  }
}
