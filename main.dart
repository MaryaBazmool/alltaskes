import 'package:flutter/material.dart';
import 'textfild.dart';
import 'package:final_test/listview/shared_preferences.dart.dart';
import 'SingleChild.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
      home: const FirstPage(),
    );
  }
}
class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Menu'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildNavigationButton(context, 'Single Child', Colors.pinkAccent, Icons.child_care, SingleChild()),

              _buildNavigationButton(context, 'Text Field', Colors.purpleAccent, Icons.text_fields, Textfild()),

              _buildNavigationButton(context, 'shared_preference', Colors.blue[800]!, Icons.share, shared_preferences()),

            ],
          ),
        ),
      ),
    );
  }
  Widget _buildNavigationButton(BuildContext context, String title, Color color, IconData icon, Widget page) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      elevation: 5,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(icon, color: Colors.white, size: 30),
              Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
