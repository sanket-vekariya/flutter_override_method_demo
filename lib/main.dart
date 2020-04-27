import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("build statelessWidget");
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(initValue: 0),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key, this.initValue: 0});

  final int initValue;

  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter;

  @override
  void initState() {
    super.initState();
    _counter = widget.initValue;
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    print("build State widget");
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demo Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display4,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "Increment Counter",
            onPressed: () {
              if (mounted) {
                print("mounted");
                setState(
                  () => ++_counter,
                );
              } else {
                print("unmounted");
              }
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            heroTag: "Next Screen Navigation",
            onPressed: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return DemoScreen();
            })),
            tooltip: 'Next Screen',
            child: Icon(Icons.navigate_next),
          ),
        ],
      ),
    );
  }

  @override
  void didUpdateWidget(HomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}

class DemoScreen extends StatefulWidget {
  @override
  _DemoScreenState createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Screen"),
      ),
      body: Center(
        child: Text("Demo Screen"),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "Previous Screen Navigation",
        onPressed: () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return HomeScreen();
        })),
        tooltip: 'Previous Screen',
        child: Icon(Icons.navigate_before),
      ),
    );
  }
}

/*
  Attempt:
    1) add button click
    2) add button click
    3) next button click
  Output:
    flutter: build statelessWidget
    flutter: initState
    flutter: didChangeDependencies
    flutter: build State widget
    flutter: mounted
    flutter: build State widget
    flutter: mounted
    flutter: build State widget
    flutter: deactivate
    flutter: dispose
*/
