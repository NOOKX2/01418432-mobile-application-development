import 'package:ex4/cart_model.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItem => _cartItems;

  int get count => cartItem.length;

  int get totalItems => _cartItems.fold(0, (sum, item) => sum + item.quantity);

  int get totalPrice {
    return _cartItems.fold(
      0,
      (sum, item) => sum + (item.food.price * item.quantity),
    );
  }

  void addToCart(Food food) {
    int index = _cartItems.indexWhere((item) => item.food.name == food.name);

    if (index != -1) {
      _cartItems[index].quantity++;
    } else {
      _cartItems.add(CartItem(food: food));
    }

    notifyListeners();
  }

  void removeFromCart(Food food) {
    int index = _cartItems.indexWhere((item) => item.food.name == food.name);

    if (_cartItems[index].quantity > 1) {
      _cartItems[index].quantity--;
    } else {
      _cartItems.removeAt(index);
    }

    notifyListeners();
  }

  void clearItem(Food food) {
    int index = _cartItems.indexWhere((item) => item.food.name == food.name);

    if (index != -1) {
      _cartItems.removeAt(index);
      notifyListeners();
    }
  }
}
