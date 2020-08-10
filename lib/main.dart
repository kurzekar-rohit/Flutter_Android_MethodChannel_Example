import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

const CHANNEL = "id.pahlevikun.native_communication.channel";
const KEY_NATIVE = "showNativeView";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter-Native Bridging',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = const MethodChannel(CHANNEL);

  String phoneNumbersList = " ";
//  static const platforms =
//      const MethodChannel('id.pahlevikun.native_communication.channel');
  var phoneNumbers = "";

//  Future<String> _getList() async {
//    phoneNumbersList =
//        await platform.invokeMethod('id.pahlevikun.native_communication.channel');
//    print(phoneNumbersList);
//    return phoneNumbersList;
//  }

  Future<String> getList() async {
    final String result = await platform.invokeMethod('method');
    String phno = result;
    setState(() {
      phoneNumbers = phno;
    });
    phoneNumbers = phno;
    print("phoneNumbers  :$phoneNumbers");
    print("phno  :$phno");
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Call Detecting App Flutter"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
              child: new Text('Click for Permissions'),
              onPressed: _showNativeView,
            ),
            new RaisedButton(
              child: new Text('Clicks to display contact number.'),
              onPressed: getList,
            ),
            Text("phoneNumbers: $phoneNumbers"),
          ],
        ),
      ),
    );
  }

  Future<Null> _showNativeView() async {
    await platform.invokeMethod(KEY_NATIVE);
  }

//  Future<List<String>> _getList() async {
//    final String result = await platforms.invokeMethod('method');
//    String phno = result;
//    phoneNumbers = phno;
//    print("phoneNumbers  :${phoneNumbers}");
//    print("phno  :${phno}");
//  }
}

//class MyHomePage extends StatelessWidget {
//  static const platform = const MethodChannel(CHANNEL);
//  final String title;
//  List<dynamic> phoneNumbersList = <dynamic>[];
//  static const platforms =
//      const MethodChannel('id.pahlevikun.native_communication.channel');
//  String phoneNumbers = "";
//
//  MyHomePage({Key key, this.title}) : super(key: key) {
////    platform.setMethodCallHandler(_handleMethod);
//  }
//  Future<List<String>> _getList() async {
//    final String result = await platforms.invokeMethod('method');
//    String phno = result;
//    phoneNumbers = phno;
//    print("phoneNumbers  :${phoneNumbers}");
//    print("phno  :${phno}");
//  }
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text(title),
//      ),
//      body: new Center(
//        child: new Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            new RaisedButton(
//              child: new Text('Click for Permissions'),
//              onPressed: _showNativeView,
//            ),
//            new RaisedButton(
//              child: new Text('Clicks to display contact number.'),
//              onPressed: _getList,
//            ),
//            Text('phoneNumbers' + phoneNumbers),
//          ],
//        ),
//      ),
//    );
//  }
//
//  Future<Null> _showNativeView() async {
//    await platform.invokeMethod(KEY_NATIVE);
//  }
//
////  Future<dynamic> _handleMethod(MethodCall call) async {
////    switch (call.method) {
////      case "message":
////        debugPrint(call.arguments);
////        return new Future.value("");
////    }
////  }
//
////  Future<List<String>> _getList() async {
////    final String result = await platforms.invokeMethod('method');
////    String phno = result;
////    phoneNumbers = phno;
////    print("phoneNumbers  :${phoneNumbers}");
////    print("phno  :${phno}");
////  }
//}
