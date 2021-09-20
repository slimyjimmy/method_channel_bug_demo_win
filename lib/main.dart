import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:method_channel_bug_demo_win/second_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? testString;
  static const firstPlatform = MethodChannel('com.example.platform1');

  @override
  void initState() {
    super.initState();
    firstPlatform.setMethodCallHandler((call) async => print("received native call"));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(child: TextButton(child: const Text('press me'), onPressed: () {
          print("should now unregister native methodChannel callback...");
          firstPlatform.setMethodCallHandler(null);
        },),),
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('first screen')),
        body: Center(
            child:
                TextButton(child: const Text('click me'), onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondScreen())))));
  }
}
