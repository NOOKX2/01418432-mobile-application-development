import 'package:ex4/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Cart")),
      body: Consumer<CartProvider>(
        builder: (context, cart, child) {
          if (cart.cartItem.isEmpty) {
            return Align(
              alignment: AlignmentGeometry.center,
              child: Text("This card is empty"),
            );
          } else {
            return ListView.builder(
              itemCount: cart.cartItem.length,
              itemBuilder: (context, index) {
                final cartItem = cart.cartItem[index];
                final food = cartItem.food;

                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/${food.imagePath}',
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(food.name, style: TextStyle(fontSize: 24)),
                              Text(
                                '${food.price} ฿',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () => cart.clearItem(food),
                                icon: const Icon(Icons.delete, size: 35),
                              ),
                              Row(
                                spacing: 5,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                    ),
                                    child: IconButton(
                                      onPressed: () =>
                                          cart.removeFromCart(food),
                                      icon: const Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                   Text(
                                    '${cartItem.quantity}',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                    ),
                                    child: IconButton(
                                      onPressed: () =>
                                          cart.addToCart(food),
                                      icon: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
      bottomNavigationBar: Consumer<CartProvider>(
        builder: (context, cart, child) {
          if (cart.cartItem.isEmpty) return const SizedBox(); // ถ้าตะกร้าว่าง ไม่ต้องโชว์แถบนี้

          return Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black)
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Total Price", style: TextStyle(color: Colors.black, fontSize: 16)),
                    Text("${cart.totalPrice} ฿", 
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red)),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    // Logic สำหรับการชำระเงิน
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: const Text("Pay Now", style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
