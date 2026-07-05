import 'package:ex4/cart_model.dart';
import 'package:ex4/cart_page.dart';
import 'package:ex4/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodDetail extends StatelessWidget {
  const FoodDetail({super.key, required this.food});

  final Food food;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Center(
        child: Column(
          spacing: 20,
          children: [
            ClipRRect(
              child: Image.asset(
                'assets/${food.imagePath}',
                height: 350,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            //const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsetsGeometry.all(20),
              child: Column(
                spacing: 20,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    food.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${food.price.toString()} ฿',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    "Enjoy our delicious ${food.name}, made with the freshest ingredients and prepared with love. A perfect choice for your meal today!",
                    style: TextStyle(
                      color: Colors.grey[600],
                      height: 1.5,
                      fontSize: 18,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      cartProvider.addToCart(food);
                      ScaffoldMessenger.of(context).clearSnackBars();

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('added ${food.name} in cart'),
                          duration: const Duration(seconds: 2),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.green,
                          persist: false,
                          action: SnackBarAction(
                            label: "view cart",
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CartPage(),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text(
                      'Add To Cart',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
