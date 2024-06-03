
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipe_app/productCard.dart';
import 'package:recipe_app/recipe_product.dart';
import 'package:recipe_app/recipe_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'recipe_store.dart';


void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(RecipeAdapter());
  await Hive.openBox<Recipe>('recipes');

  final recipeStore= RecipeStore();
  await recipeStore.loadRecipes();

  runApp(MyApp(store: recipeStore));
}

class MyApp extends StatelessWidget {
  final RecipeStore store;
  const MyApp({super.key, required this.store});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductCard(store: store),

    );
  }
}
