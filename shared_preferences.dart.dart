
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class shared_preferences extends StatefulWidget {
  const shared_preferences({super.key});

  @override
  State<shared_preferences> createState() => _shared_preferencesState();
}

class _shared_preferencesState extends State<shared_preferences> {
  final _contollre1=TextEditingController();
  final _contollre2=TextEditingController();

  Future<void> _Storgedata() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('Textfild1', _contollre1.text.trim());
    _contollre1.clear();
  }
  Future<void> _getdata() async {
    final prefs = await SharedPreferences.getInstance();
    final Texrfild1 = await prefs.getString('Textfild1');
    _contollre2.text=Texrfild1!;
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('SharedPreferences'),
        backgroundColor: Colors.purple[600],),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _contollre1,
              decoration: InputDecoration(
                  labelText: 'الحقل الاول'
              ),
            ),
            ElevatedButton(
                onPressed:_Storgedata ,
                child: Text('تخزين')),
            TextField(
              controller: _contollre2,
              decoration: InputDecoration(
                  labelText: 'الحقل الثاني'
              ),
            ),
            ElevatedButton(
                onPressed:_getdata ,
                child: Text('جلب'))
          ],
        ),
      ),
    );
  }
}
// TODO Implement this library.