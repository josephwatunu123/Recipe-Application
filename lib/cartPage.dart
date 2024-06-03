import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:recipe_app/cart_items.dart';
import 'package:recipe_app/recipe_product.dart';
import 'package:recipe_app/checkOut.dart'; // Import your CheckOutPage

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Recipe> _cartItems = [];

  @override
  void initState() {
    super.initState();
    _fetchCartItems();
  }

  Future<void> _fetchCartItems() async {
    var cartModel = CartModel();
    var items = await cartModel.getCartItems();
    setState(() {
      _cartItems = items;
    });
  }

  void _goToCheckOut() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CheckOutPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: _cartItems.isEmpty
                ? Center(child: Text('Your cart is empty'))
                : ListView.builder(
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                final recipe = _cartItems[index];
                return ListTile(
                  leading: Image.network(recipe.image, height: 50, width: 50),
                  title: Text(recipe.name),
                  subtitle: Text("Cost: ${recipe.price}"),
                  trailing: Text("Rating: ${recipe.rating}"),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _goToCheckOut,
              child: Text('Check Out'),
            ),
          ),
        ],
      ),
    );
  }
}
