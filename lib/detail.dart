import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text("detail"),
        ),
        body: Column(
          children: <Widget>[
            Text("detail of"),
            Text("id: ${args['id']}"),
            Text("title: ${args['title']}"),
            Text("subtitle: ${args['subtitle']}"),
          ],
        ));
  }
}
