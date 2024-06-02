import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyCart(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class MyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton(
              onPressed: () {
                print("Going to checkout");
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: Text('Go to Checkout',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500
              )),
            ),
          ),
        ),
      ),
    );
  }
}
