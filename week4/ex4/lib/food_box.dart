import 'package:ex4/cart_model.dart';
import 'package:ex4/food_detail.dart';
import 'package:flutter/material.dart';

class FoodBox extends StatelessWidget {
  const FoodBox({super.key, required this.food});

  final Food food;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                FoodDetail(food: food,),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(2),
        height: 120,
        child: Card(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: <Widget>[
                  const SizedBox(height: 2),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(55),
                    child: Image.asset(
                      'assets/${food.imagePath}',
                      height: 110,
                      width: 110,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      children: [
                        Text(food.name),
                        Text(
                         '${food.price} ฿',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Icon(Icons.favorite, color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
