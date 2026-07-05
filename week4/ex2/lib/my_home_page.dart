import 'package:ex2/product_box.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( title ),
      ),
      body: ListView(
        children:<Widget>[
        Productbox(name: 'Macbook Pro M5', description: 'The M5 features a 10-core CPU design with up to four performance cores and six efficiency cores.', price: 68890, image: 'macbook_pro_m5.jpeg'),
        Productbox(name: 'IPhone 17 Pro Max', description: 'New Iphone in this year', price: 34490, image: 'iPhone_17_Pro_Max.webp'),
        Productbox(name: 'IPad Pro 11 M5', description: 'New Ipad with m5 chip in this year', price: 34490, image: 'ipad_pro_11_m5.jpg'),
        Productbox(name: 'Samsung Galaxy S25 Ultra', description: 'New Samsung Galaxy in this year', price: 34490, image: 'samsung_galaxy_s25_ultra.jpg'),
        Productbox(name: 'Nvidia Geforce RTX 5090', description: 'new nvidia gpu', price: 132000, image: 'nvidia_geforce_rtx_5090.png'),

        ]
        
      ),
    );
  }
}
