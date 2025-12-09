import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileStorage {

  Future<String> get _filePath async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/userdata.txt';
  }


  Future<void> writeData(String text) async {
    final path = await _filePath;
    final file = File(path);
    await file.writeAsString(text);
  }


  Future<String> readData() async {
    try {
      final path = await _filePath;
      final file = File(path);

      if (await file.exists()) {
        return await file.readAsString();
      } else {
        return 'لا يوجد بيانات محفوظة';
      }
    } catch (e) {
      return 'خطأ في قراءة الملف';
    }
  }
}
