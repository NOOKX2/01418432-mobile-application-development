import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'service/firestore.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirestoreService firestoreService = FirestoreService();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();

  void openFoodBox(
    BuildContext context, {
    String? docID,
    String? name,
    String? price,
    String? category,
  }) {
    if (docID != null) {
      _nameController.text = name.toString();
      _priceController.text = price.toString();
    } else {
      _nameController.clear();
      _priceController.clear();
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Food'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(hintText: 'Name'),
            ),
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(hintText: 'Price'),
            ),
             TextField(
              controller: _categoryController,
              decoration: const InputDecoration(hintText: 'Category'),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              double? price = double.tryParse(_priceController.text);
              if (_nameController.text.isNotEmpty && price != null) {
                if (docID == null) {
                  firestoreService.addFood(_nameController.text, price, _categoryController.text);
                } else {
                  firestoreService.updateFood(
                    docID,
                    _nameController.text,
                    price,
                    _categoryController.text,
                  );
                }

                _nameController.clear();
                _priceController.clear();
                Navigator.pop(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('กรุณากรอกชื่อและราคาให้ถูกต้อง'),
                  ),
                );
              }
            },
            child: (docID == null) ? const Text('Add') : const Text('Update'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => openFoodBox(context),
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirestoreService().getFoodStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var foodList = snapshot.data?.docs ?? [];
            return ListView.builder(
              itemCount: foodList.length,
              itemBuilder: (context, index) {
                DocumentSnapshot document = foodList[index];
                String docID = document.id;

                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                String name = data['name'];
                String price = data['price'].toString();
                String category = data['category']?? "";

                return ListTile(
                  title: Text(name),
                  subtitle: Text("฿ $price"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.settings),
                        onPressed: () => openFoodBox(
                          context,
                          docID: docID,
                          name: name,
                          price: price,
                          category: category,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => firestoreService.deleteFood(docID),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Text("No food menu ...");
          }
        },
      ),
    );
  }
}
