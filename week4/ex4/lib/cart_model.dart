class Food {
  final String name;
  final int price;
  final String imagePath;

  const Food({
    required this.name,
    required this.price,
    required this.imagePath,
  });
}

class CartItem {
  final Food food;
  int quantity;

  CartItem({required this.food, this.quantity = 1});
}
