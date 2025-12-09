import 'package:flutter/material.dart';
import '../models/product.dart';
import '../data/products_data.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              product.image,
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(product.name,
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('${product.price} \$',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Cairo',
                    color: Colors.grey[700])),
            SizedBox(height: 16),
            Text(product.description,
                style: TextStyle(fontSize: 16, fontFamily: 'Cairo')),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                cart.add(product);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('تم إضافة المنتج للعربة!',
                        style: TextStyle(fontFamily: 'Cairo'))));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  padding:
                  EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              child: Text('إضافة للعربة',
                  style: TextStyle(fontFamily: 'Cairo', fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
