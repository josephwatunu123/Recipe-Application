import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';
import 'package:recipe_app/recipe_product.dart';
import 'package:recipe_app/recipeApi.dart';

part 'recipe_store.g.dart';

class RecipeStore = _RecipeStore with _$RecipeStore;

abstract class _RecipeStore with Store {
  @observable
  ObservableList<Recipe> recipes = ObservableList<Recipe>();

  @action
  Future<void> loadRecipes() async {
    try {
      await Recipeapi.instance.fetchAndStoreRecipes();
      var box = await Hive.openBox<Recipe>('recipes');
      recipes = ObservableList.of(box.values.toList());
    } catch (error) {
      print('Failed to load recipes: $error');
    }
  }
}
