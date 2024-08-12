import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoritesScreen(this.favoriteMeals, {super.key});

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Container(
        color: Colors.white, // Cambia el color de fondo a blanco
        child: const Center(
          child: Text(
            '¡Agrega favoritos para verlos aquí!',
            style: TextStyle(
                color:
                    Colors.black), // Ajusta el color del texto si es necesario
          ),
        ),
      );
    } else {
      return Container(
        color: Colors.white, // Cambia el color de fondo a blanco
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: favoriteMeals[index].id,
              title: favoriteMeals[index].title,
              imageUrl: favoriteMeals[index].imageUrl,
              duration: favoriteMeals[index].duration,
              complexity: favoriteMeals[index].complexity,
            );
          },
          itemCount: favoriteMeals.length,
        ),
      );
    }
  }
}
