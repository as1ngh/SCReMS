import 'package:flutter/material.dart';
import 'package:screams/Home.dart';
import 'history.dart';
import 'profile.dart';

enum Pages {
  home,
  profile,
  history,
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SCReMS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  Pages current_page = Pages.home;
  final String title;
  final String name = "Abhishek";
  final String email = "apatil@cs.iitr.ac.in";

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget Current = Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Current,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(widget.name),
              accountEmail: Text(widget.email),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.blue
                        : Colors.white,
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              title: Text("Home"),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.of(context).pop();
                setState(() {
                  widget.current_page = Pages.home;
                  Current = _buildScreen();
                });
              },
            ),
            ListTile(
              title: Text("Profile"),
              leading: Icon(Icons.person),
              onTap: () {
                Navigator.of(context).pop();
                setState(() {
                  widget.current_page = Pages.profile;
                  Current = _buildScreen();
                });
              },
            ),
            ListTile(
              title: Text("History"),
              leading: Icon(Icons.history),
              onTap: () {
                Navigator.of(context).pop();
                setState(() {
                  widget.current_page = Pages.history;
                  Current = _buildScreen();
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScreen() {
    Widget _page;
    switch (widget.current_page) {
      case Pages.home:
        _page = Home();
        break;

      case Pages.profile:
        _page = Profile();

        break;

      case Pages.history:
        _page = History();
        break;
    }

    return _page == null ? Home() : _page;
  }
}
