import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  static const secondPlatform = MethodChannel('com.example.platform2');

  @override
  void initState() {
    super.initState();
    print("registering second platform (method channel)...");
    secondPlatform.setMethodCallHandler(
        (call) async => print('Native call to second screen'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('second screen')));
  }
}
