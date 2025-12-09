import 'package:flutter/material.dart';
import '../data/products_data.dart';
import 'checkout_page.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double get total {
    double sum = 0;
    cart.forEach((p) => sum += p.price);
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('العربة'),
        backgroundColor: Colors.pink,
      ),
      body: cart.isEmpty
          ? Center(
          child: Text('العربة فارغة',
              style: TextStyle(fontFamily: 'Cairo', fontSize: 20)))
          : ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final product = cart[index];
          return ListTile(
            leading: Image.asset(product.image,
                width: 50, height: 50, fit: BoxFit.cover),
            title:
            Text(product.name, style: TextStyle(fontFamily: 'Cairo')),
            subtitle:
            Text('${product.price} \$', style: TextStyle(fontFamily: 'Cairo')),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                setState(() {
                  cart.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      bottomNavigationBar: cart.isEmpty
          ? null
          : Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CheckoutPage()));
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pink,
              padding: EdgeInsets.all(16)),
          child: Text('إتمام الدفع - الإجمالي: ${total.toStringAsFixed(2)} \$',
              style: TextStyle(fontFamily: 'Cairo', fontSize: 18)),
        ),
      ),
    );
  }
}
