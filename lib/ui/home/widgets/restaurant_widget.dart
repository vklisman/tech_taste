import 'package:flutter/cupertino.dart';

import '../../../model/restaurant.dart';

class RestaurantWidget extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantWidget({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12.0,
      children: [Image.asset('assets/${restaurant.imagePath}', width: 72,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [Text(restaurant.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
        Row(
          children: List.generate(restaurant.stars.toInt(), (index) {
            return Image.asset('assets/others/star.png', width: 16,);
          }),
        ),
        Text("${restaurant.distance} km"),
      ],
    ),
    ],
    );
  }
}
