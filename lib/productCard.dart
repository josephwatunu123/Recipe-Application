
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:recipe_app/cartPage.dart';
import 'package:recipe_app/recipe_product.dart';
import 'package:recipe_app/recipeApi.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:recipe_app/recipe_store.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'cart_items.dart';

class ProductCard extends StatefulWidget {
  final RecipeStore store;

  ProductCard({required this.store});
  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  // List<Recipe> _recipes = [];

  @override
  void initState() {
    super.initState();
    widget.store.loadRecipes();
  }
  //
  // Future<void> _fetchRecipes() async {
  //   await Recipeapi.instance.fetchAndStoreRecipes();
  //   var box = await Hive.openBox<Recipe>('recipes');
  //   setState(() {
  //     _recipes = box.values.toList();
  //   });
  // }
  Future<void> _addToCart(Recipe recipe) async {
    var cartModel = CartModel();
    await cartModel.addToCart(recipe);
    Fluttertoast.showToast(
      msg: "Product added to cart",
      toastLength: Toast.LENGTH_SHORT,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: Center(
          child: Observer(
            builder: (_) => widget.store.recipes.isEmpty
                ? CircularProgressIndicator()
                : ListView.builder(
              itemCount: widget.store.recipes.length,
              itemBuilder: (context, index) {
                final recipe = widget.store.recipes[index];
                return Container(
                  width: 350,
                  height: 300,
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Image.network(
                            recipe.image,
                            height: 150,
                          ),
                        ),
                        Text(
                          recipe.name,
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Cost: ${recipe.price}",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Rating: ${recipe.rating}",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 4),
                        TextButton(
                          onPressed: () {
                            _addToCart(recipe);
                            print("Add to cart button pressed");
                            Fluttertoast.showToast(
                              msg: "Product added to cart",
                              toastLength: Toast.LENGTH_SHORT,
                              fontSize: 16.0,
                            );
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Add to Cart',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                );

              },
            ),
          ),),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.shopping_cart),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> CartPage()),
            );
          },
        )

    );

  }
}
