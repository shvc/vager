import 'package:flutter/material.dart';

class BucketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = <Widget>[];

    var data = [
      {"id": 1, "title": "Test bucket 01", "subtitle": "Just a test page 01"},
      {"id": 2, "title": "Test bucket 02", "subtitle": "Just a test page 02"},
      {"id": 3, "title": "Test bucket 03", "subtitle": "Just a test page 03"},
      {"id": 4, "title": "Test bucket 04", "subtitle": "Just a test page 04"},
      {"id": 5, "title": "Test bucket 05", "subtitle": "Just a test page 05"},
      {"id": 6, "title": "Test bucket 06", "subtitle": "Just a test page 06"},
      {"id": 7, "title": "Test bucket 07", "subtitle": "Just a test page 07"},
      {"id": 8, "title": "Test bucket 08", "subtitle": "Just a test page 08"},
      {"id": 9, "title": "Test bucket 09", "subtitle": "Just a test page 09"},
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
        title: Text("buckets"),
      ),
      body: Center(
        child: ListView(
          children: list,
        ),
      ),
    );
  }
}
