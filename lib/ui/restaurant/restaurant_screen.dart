import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_taste/model/restaurant.dart';
import 'package:tech_taste/ui/_core/widgets/appbar.dart';

import '../../model/dish.dart';
import '../_core/bag_provider.dart';

class RestaurantScreen extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context, title: restaurant.name),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            spacing: 12.0,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/${restaurant.imagePath}', width: 128),
              Text("Mais pedidos", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
              Column(
                children: List.generate(restaurant.dishes.length, (index) {
                  Dish dish = restaurant.dishes[index];
                  return ListTile(
                    leading: Image.asset('assets/dishes/default.png', width: 38, height: 38,),
                    title: Text(dish.name),
                    subtitle: Text("R\$${dish.price.toStringAsFixed(2)}"),
                    trailing: IconButton(onPressed: () {
                      context.read<BagProvider>().addAllDishes([dish]);
                    }, icon: Icon(Icons.add),)
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
