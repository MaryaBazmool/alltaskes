import 'package:flutter/material.dart';
import '../data/products_data.dart';
import 'product_details_page.dart';

class CategoriesPage extends StatelessWidget {
  final Map<String, List> categories = {
    'ورود': demoProducts.sublist(0, 3),
    'باقة مختارة': demoProducts.sublist(3, 4),
    'زهور صغيرة': demoProducts.sublist(4, 6),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الأقسام'),
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: categories.entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entry.key,
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        color: Colors.pink[700]),
                  ),
                  SizedBox(
                    height: 180,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: entry.value.length,
                      itemBuilder: (context, index) {
                        final product = entry.value[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ProductDetailsPage(product: product)),
                            );
                          },
                          child: Container(
                            width: 140,
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.pink[50],
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  blurRadius: 4,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(product.image,
                                    width: 90, height: 90, fit: BoxFit.cover),
                                SizedBox(height: 5),
                                Text(product.name,
                                    style: TextStyle(
                                        fontFamily: 'Cairo',
                                        fontWeight: FontWeight.bold)),
                                Text('${product.price} \$',
                                    style: TextStyle(fontFamily: 'Cairo')),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
