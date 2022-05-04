import 'package:adaptive_app/Login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Main());
}
class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);
  @override
  _Main createState() => _Main();
}

class _Main extends State<Main> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Main screen"),
        ),
        body: Column(children: <Widget>[
          Container(child: const Text('Main screen'),
          margin:const EdgeInsets.only(top:20)),
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          }, child: const Text('Quay lại', style: TextStyle(fontSize: 20)),
          )
        ]),
      ),
    );
  }
}
