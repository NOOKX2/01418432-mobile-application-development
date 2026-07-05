import 'package:ex4/cart_model.dart';
import 'package:ex4/cart_page.dart';
import 'package:ex4/cart_provider.dart';
import 'package:ex4/food_box.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  static const List<Food> foodList = [
    Food(
      name: 'Mcdonald Burger',
      price: 200,
      imagePath: 'mcdonald_burger.avif',
    ),
    Food(
      name: 'Pizza Signature',
      price: 300,
      imagePath: 'pizza_signature.avif',
    ),
    Food(name: 'Dairy Queen', price: 20, imagePath: 'dairy_queen.webp'),
    Food(name: 'Steak', price: 250, imagePath: 'steak.avif'),
    Food(name: 'Salad', price: 150, imagePath: 'salad.avif'),
    Food(name: 'Pancake', price: 150, imagePath: 'pancake.avif'),
    Food(name: 'Fried Egg', price: 50, imagePath: 'fried_egg.avif'),
    Food(name: 'Tom Yum Kung', price: 150, imagePath: 'tom_yum_kung.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: const Color.fromARGB(255, 244, 238, 238),
            pinned: true,
            floating: false,
            title: Text(
              title,
              style: GoogleFonts.lato(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1),

              child: Container(
                color: const Color.fromARGB(255, 191, 181, 181),
                height: 1,
              ),
            ),
            actions: [
              Consumer<CartProvider>(
                builder: (context, cart, child) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CartPage(),
                          ),
                        );
                      },
                      icon: Badge(
                        label: Text(
                          '${cart.totalItems}',
                          style: const TextStyle(color: Colors.white),
                        ),
                        isLabelVisible: cart.totalItems > 0,
                        child: const Icon(Icons.shopping_cart_outlined),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => FoodBox(food: foodList[index]),
                childCount: foodList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
