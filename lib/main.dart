import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Stack / Positioned'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var ast = 'assets/images/';
  var imgWidth = 150.0;
  var padding = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              imgStack(
                caption: 'Coconut',
                imgAsset: ast + 'coconut-drink.png',
                topLeft: topLeft('ลด 5%'),
                topRight: Icon(
                  Icons.star,
                  color: Colors.orange,
                ),
                center: Text(''),
              ),
              SizedBox(
                height: 20,
              ),
              imgStack(
                caption: 'Soft Drink',
                imgAsset: ast + 'soft-drink.png',
                topLeft: topLeft('ลด 15%'),
                topRight: Icon(null),
                center: Text('หมด'),
              ),
              SizedBox(
                height: 20,
              ),
              imgStack(
                caption: 'Apple',
                imgAsset: ast + 'apple.png',
                topLeft: Text(' '),
                topRight: Image.asset(
                  ast + 'new.png',
                  height: 100,
                  scale: 1.3,
                ),
                center: Text(''),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget imgStack({
    required String caption,
    required String imgAsset,
    required Widget topLeft,
    required Widget topRight,
    required Widget center,
  }) =>
      Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            child: imgContainer(imgAsset),
          ),
          Positioned(
            child: topLeft,
            top: 0,
            left: 0,
          ),
          Positioned(
            top: 0,
            right: 0,
            child: topRight,
          ),
          center,
          Positioned(
            child: textCaption(caption),
            left: 0,
            bottom: 0,
          ),
        ],
      );

  Widget imgContainer(String imgAsset) => Container(
        padding: EdgeInsets.all(10),
        child: Image.asset(
          imgAsset,
          width: imgWidth,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black26),
        ),
      );

  Widget textCaption(String text) => Container(
        child: Text(
          text,
          textScaleFactor: 1.5,
          style: TextStyle(color: Colors.white),
        ),
        width: (imgWidth + (2 * padding) + 2),
        height: 35,
        color: Colors.black38,
        alignment: Alignment.center,
      );

  Widget topLeft(String text) => Container(
        width: 60,
        height: 32,
        child: Text(
          text,
          textScaleFactor: 1.0,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        color: Colors.red,
        alignment: Alignment.center,
      );

  Widget center(String text) => Container(
        child: Text(
          text,
          textScaleFactor: 1.0,
          style: TextStyle(color: Colors.white),
        ),
        width: 60,
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
      );
}
