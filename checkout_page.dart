import 'package:flutter/material.dart';
import '../data/products_data.dart';

class CheckoutPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الدفع'),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration:
                InputDecoration(labelText: 'الاسم', border: OutlineInputBorder()),
                validator: (value) =>
                value!.isEmpty ? 'الرجاء إدخال الاسم' : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(
                    labelText: 'العنوان', border: OutlineInputBorder()),
                validator: (value) =>
                value!.isEmpty ? 'الرجاء إدخال العنوان' : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                    labelText: 'رقم الهاتف', border: OutlineInputBorder()),
                validator: (value) =>
                value!.isEmpty ? 'الرجاء إدخال رقم الهاتف' : null,
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    cart.clear(); // تفريغ العربة بعد الدفع
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('تم تأكيد الطلب!',
                            style: TextStyle(fontFamily: 'Cairo'))));
                    Navigator.popUntil(context, (route) => route.isFirst);
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink, padding: EdgeInsets.all(16)),
                child: Text('تأكيد الطلب',
                    style: TextStyle(fontFamily: 'Cairo', fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
