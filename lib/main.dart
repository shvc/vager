import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'user.dart';
import 'bucket.dart';
import 'detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo(material)',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        "userpage": (context) => UserPage(),
        "bucketpage": (context) => BucketPage(),
        "detail": (context) => DetailPage(),
      },
      home: MyHomePage(title: 'Flutter Demo(home)'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState(this.title);
}

class MyHomePageState extends State<MyHomePage> {
  int _cnt = 0;
  var msg = "default test msg";
  final String title;
  MyHomePageState(this.title);

  @override
  void initState() {
    super.initState();
    _readCounter().then((int v) {
      setState(() {
        _cnt = v;
      });
    });
  }

  Future<File> _getLocalFile() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    return File('$dir/counter.txt');
  }

  Future<int> _readCounter() async {
    try {
      File file = await _getLocalFile();
      String contents = await file.readAsString();
      return int.parse(contents);
    } on FileSystemException {
      return 0;
    }
  }

  Future<Null> _incrementCounter() async {
    setState(() {
      _cnt++;
    });
    // Write to local file
    await (await _getLocalFile()).writeAsString('$_cnt');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("Note: $msg $_cnt"),
            /*
            FlatButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.push(ctx, MaterialPageRoute(builder: (ctx) {
                  return ListPage();
                }));
              },
              child: Text("click me", style: TextStyle(fontSize: 20.0)),
            )
          */
            RaisedButton(
                child: Text("user"),
                onPressed: () {
                  Navigator.pushNamed(context, "userpage");
                }),
            RaisedButton(
                child: Text("bucket"),
                onPressed: () {
                  Navigator.pushNamed(context, "bucketpage");
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Create',
        child: Icon(Icons.add),
      ),
    );
  }
}
