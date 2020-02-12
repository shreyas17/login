import 'package:flutter/material.dart';
import 'package:easy_web_view/easy_web_view.dart';


class App extends StatefulWidget {
  @override
  _AppState createState() => new _AppState();
}

class _AppState extends State<App> {


  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var app = new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
        ),
        body: EasyWebView(
          src: 'https://wa-bg-hmis.azurewebsites.net/dashboard/pmc',
// width: 100,
// height: 100,
        )
      ),
    );
    return app;
  }


}