import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _phrases = [
    'No matter how thin you slice it, there will always be two sides.',
    'Everything excellent is as difficult as it is rare.',
    'Do not weep. Do not wax indignant. Understand.',
    'The endeavor to understand is the first and only basis of virtue.',
    'No to laugh, not to lament, not to detest, but to understand.'
  ];

  var _phrase = '';
  var _img = 'images/cookie.png';

  void _createPhrase() {
    var number = Random().nextInt(_phrases.length);

    setState(() {
      _img = 'images/cookie_open.png';
      _phrase = '"' + _phrases[number] + '"';
    });

    Timer timer = new Timer(new Duration(seconds: 3), () {
      setState(() {
        _phrase = '';
        _img = 'images/cookie.png';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        padding: EdgeInsets.only(top: 100),
        width: double.infinity,
        child: Column(
          children: [
            Image.asset(_img, width: 250, height: 250),
            Container(
              padding: EdgeInsets.only(top: 1),
              width: 220,
              child: Text(
                _phrase,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 22,
                    fontStyle: FontStyle.italic,
                    color: Colors.orange[800]),
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 60),
                width: 230,
                height: 110,
                child: FlatButton(
                  onPressed: () => {_createPhrase()},
                  child: Text('Open Cookie',
                      style: TextStyle(color: Colors.orange[800],fontSize: 18,fontWeight: FontWeight.bold),),
                  textColor: Colors.orange[800],
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.orange[800],
                          width: 2,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(25)),
                ))
          ],
        ),
      ),
    ));
  }
}
