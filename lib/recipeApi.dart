import 'dart:convert';
import 'recipe_product.dart';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';

class Recipeapi {
  Recipeapi._instantiate();
  static final Recipeapi instance = Recipeapi._instantiate();

  final String baseUrl = "api.spoonacular.com";
  static const String apiKey = "6beaf7d90bff41f2b5335fc11e8242f8";

  Future<void> fetchAndStoreRecipes() async {
    final queryParams = {
      'apiKey': apiKey,
      'wine': 'merlot',
      'maxPrice': '50',
      'number': '20',
    };

    final uri = Uri.https(baseUrl, '/food/wine/recommendation', queryParams);

    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        print(response.body);
        final Map<String,dynamic> jsonData = json.decode(response.body);
        final List<dynamic> wines= jsonData['recommendedWines'];
        final List<Recipe> recipes = wines.map((data)=> Recipe.fromMap(data)).toList();

        var box = await Hive.openBox<Recipe>('recipes');
        await box.clear();
        for (var recipe in recipes) {
          await box.add(recipe);
        }
      } else {
        throw Exception('Failed to fetch recipes: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to fetch recipes: $error');
    }
  }
}
