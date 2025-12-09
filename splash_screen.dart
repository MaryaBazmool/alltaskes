import 'dart:async';
import 'package:flutter/material.dart';
import 'login_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    // الانتقال لصفحة تسجيل الدخول بعد 3 ثواني
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,

        // خلفية متدرجة وردية
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFC1D9), // وردي فاتح
              Color(0xFFFFE4EC), // وردي أفتح
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // صورة الشعار
            Image.asset(
              'assets/images/RareRose.jpg', // غيرها حسب اسم شعارك
              width: 150,
              height: 150,
            ),

            SizedBox(height: 30),

            // حركة تحميل
            CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 3,
            ),
          ],
        ),
      ),
    );
  }
}
