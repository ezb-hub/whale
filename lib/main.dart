import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          title: Text(
            'Corsair',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black,
              ),
            ),
          ],
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: Text('lorem ipsum dolor sit amet, consectetur adip '),
        ),
      ),
    ));
