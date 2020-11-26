import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = <Widget>[];

    var data = [
      {"id": 1, "title": "Test user 01", "subtitle": "Just a test user 01"},
      {"id": 2, "title": "Test user 02", "subtitle": "Just a test user 02"},
      {"id": 3, "title": "Test user 03", "subtitle": "Just a test user 03"},
      {"id": 4, "title": "Test user 04", "subtitle": "Just a test user 04"},
      {"id": 5, "title": "Test user 05", "subtitle": "Just a test user 05"},
      {"id": 6, "title": "Test user 06", "subtitle": "Just a test user 06"},
      {"id": 7, "title": "Test user 07", "subtitle": "Just a test user 07"},
      {"id": 8, "title": "Test user 08", "subtitle": "Just a test user 08"},
      {"id": 9, "title": "Test user 09", "subtitle": "Just a test user 09"},
    ];

    for (var item in data) {
      print(item["title"]);

      list.add(ListTile(
        title: Text(item["title"], style: TextStyle(fontSize: 18.0)),
        subtitle: Text(item["subtitle"]),
        leading: Icon(Icons.fastfood, color: Colors.orange),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.pushNamed(context, "detail", arguments: item);
        },
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("users"),
      ),
      body: Center(
        child: ListView(
          children: list,
        ),
      ),
    );
  }
}
