import "dart:io";

const pizzaPrices = {'margherita': 5.5, 'pepperoni': 7.5, 'vegetarian': 6.5};

void main() {
  List<String> pizza = [];
  print("Input your Pizza: ");
  String? input = stdin.readLineSync();

  if (input != null && input.isNotEmpty) {
    pizza = input.split(" ");

    double totalPrice = 0;
    for (int i = 0; i < pizza.length; i++) {
      if (pizzaPrices.containsKey(pizza[i])) {
        print("${pizza[i]}: \$${pizzaPrices[pizza[i]]}");
        double price = pizzaPrices[pizza[i]]!;
        totalPrice += price;
      } else {
        print('${pizza[i]} is not on the menu');
      }
    }
    
    print("Total: $totalPrice");
  }
}
