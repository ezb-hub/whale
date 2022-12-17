import 'package:flutter/material.dart';

import 'package:ezb/src/AppBar.dart';

void main() => runApp(const MaterialApp(
      home: Scaffold(
        appBar: MainAppBar(
          title: Text(
            'EZB',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Center(
          child: Text('Lorem ipsum dolor sit amet, consectetur'),
        ),
      ),
    ));
