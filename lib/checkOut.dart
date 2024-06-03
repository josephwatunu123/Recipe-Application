//CHECKOUT.DART
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Add this line

class CheckOutPage extends StatefulWidget {
  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  bool _isLoading = false;
  String _responseMessage = '';

  Future<void> _checkout() async {
    setState(() {
      _isLoading = true;
    });

    // Dummy data for POST request
    Map<String, dynamic> requestData = {
      'wines': ['wine1', 'wine2', 'wine3'],
    };

    // Replace this URL with your actual API endpoint
    final String apiUrl = 'https://jsonplaceholder.typicode.com/todos/1';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(requestData),
      );

      if (response.statusCode == 200) {
        // Handle success
        setState(() {
          _responseMessage = 'Checkout successful';
        });
      } else {
        // Handle error
        setState(() {
          _responseMessage = 'Checkout failed: ${response.reasonPhrase}';
        });
      }
    } catch (e) {
      // Handle network errors
      setState(() {
        _responseMessage = 'Error during checkout: $e';
      });
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Out'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _checkout,
              child: Text('Confirm Checkout'),
            ),
            SizedBox(height: 20),
            Text(_responseMessage),
          ],
        ),
      ),
    );
  }
}
