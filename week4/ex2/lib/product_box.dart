import 'package:flutter/material.dart';

class Productbox extends StatelessWidget {
  const Productbox({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  final String name;
  final String description;
  final double price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      height: 120,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('assets/$image'),
            Expanded(child: Container(
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(name, style: TextStyle(fontWeight: FontWeight.bold),),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(description),
                      ),
                    ),
                  Text('Price: $price'),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
