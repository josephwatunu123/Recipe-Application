import 'package:hive/hive.dart';
import 'recipe_product.dart';

class CartModel {
  static const String boxName = 'cart';

  Future<void> addToCart(Recipe recipe) async {
    var box = await Hive.openBox<Recipe>(boxName);
    await box.add(recipe);
  }

  Future<List<Recipe>> getCartItems() async {
    var box = await Hive.openBox<Recipe>(boxName);
    return box.values.toList();
  }

  Future<void> clearCart() async {
    var box = await Hive.openBox<Recipe>(boxName);
    await box.clear();
  }
}
