import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_taste/data/categories_data.dart';
import 'package:tech_taste/data/restaurant_data.dart';
import 'package:tech_taste/ui/home/widgets/categories_widget.dart';
import 'package:tech_taste/ui/home/widgets/restaurant_widget.dart';

import '../../model/restaurant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RestaurantData restaurantData = Provider.of<RestaurantData>(context);
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 32.0,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset('assets/logo.png', width: 147)),
              Text("Boas vindas!"),
              TextFormField(),
              Text("Escolha por categoria"),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 8.0,
                  children: List.generate(CategoriesData.listCategories.length,
                    (index) {
                      return CategoriesWidget(
                        category: CategoriesData.listCategories[index],
                      );
                    } ),),
              ),
              Image.asset('assets/banners/banner_promo.png'),
              Text("Bem avaliados"),
              Column(
                spacing: 16.0,
                children: List.generate(restaurantData.listRestaurant.length, (index) {
                Restaurant restaurant = restaurantData.listRestaurant[index];
                return RestaurantWidget(restaurant: restaurant);
              }),),
              SizedBox(height: 64.0,),
            ],
          ),
        )),
    );
  }
}
