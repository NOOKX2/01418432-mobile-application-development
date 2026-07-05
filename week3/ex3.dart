import 'dart:math';

abstract class Shape {
  double get area;
  double get perimeter;
  void printValue();
}

class Square extends Shape {
  Square(this.side);
  final double side;

  @override
  double get area => side * side;

  @override
  double get perimeter => side * 4;

  @override
  void printValue() {
    print("Square Area: ${area.toStringAsFixed(2)} \nSquare Perimeter: ${perimeter.toStringAsFixed(2)}");
  }
}

class Circle extends Shape {
  Circle(this.radius);
  final double radius;

  @override
  double get area => pi * radius * radius;

  @override
  double get perimeter => 2 * pi * radius;

  @override
  void printValue() {
    print("Circle Area: ${area.toStringAsFixed(2)} \nCircle Perimeter: ${perimeter.toStringAsFixed(2)}");
  }
}

void main() {
  List<Shape> shapes = [Square(5), Circle(3)];
  for (var shape in shapes) {
    shape.printValue();
  }
}
