import 'package:flutter/material.dart';
import '../services/file_storage.dart';

class FileLoginPage extends StatefulWidget {
  const FileLoginPage({super.key});

  @override
  State<FileLoginPage> createState() => _FileLoginPageState();
}

class _FileLoginPageState extends State<FileLoginPage> {
  final TextEditingController _inputController = TextEditingController();
  final TextEditingController _outputController = TextEditingController();

  final FileStorage storage = FileStorage();


  Future<void> saveToFile() async {
    await storage.writeData(_inputController.text.trim());
    _inputController.clear();
  }


  Future<void> readFromFile() async {
    final text = await storage.readData();
    _outputController.text = text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تخزين البيانات في ملف"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _inputController,
                decoration: InputDecoration(labelText: "الحقل الأول"),
              ),
              ElevatedButton(
                onPressed: saveToFile,
                child: Text("تخزين في ملف"),
              ),
              TextField(
                controller: _outputController,
                decoration: InputDecoration(labelText: "الحقل الثاني"),
              ),
              ElevatedButton(
                onPressed: readFromFile,
                child: Text("جلب من الملف"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
