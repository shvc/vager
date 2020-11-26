import 'package:flutter/material.dart';

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
      //home: new Center(
      //  child: new Text("hello world"),
      //)
      //home: new MyHomePage2()
    );
  }
}

class MyHomePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
        appBar: AppBar(
          title: Text("tittle"),
        ),
        body: Center(
          child: Text("hello Scaffold"),
        ));
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
  //MyHomePageState createState() => MyHomePageState();
  MyHomePageState2 createState() => MyHomePageState2(this.title);
}

class MyHomePageState2 extends State<MyHomePage> {
  int _cnt = 0;
  var msg = "default test msg";
  final String title;
  MyHomePageState2(this.title);

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
        onPressed: () {
          setState(() {
            _cnt++;
          });
        },
        tooltip: 'Create',
        child: Icon(Icons.add),
      ),
    );
  }
}

class MyHomePageState extends State<MyHomePage> {
  var _counter = 0;
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            this._counter++;
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add_alarm_sharp),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
