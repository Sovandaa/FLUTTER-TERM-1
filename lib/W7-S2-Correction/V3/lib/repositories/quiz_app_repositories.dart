import 'dart:convert';
import 'dart:io';
import 'package:my_quiz/model/app/app.dart';

Future<void> writeQuizApp(File file, App app) async {
  
  // 1 Serialize the app
  final jsonString = jsonEncode(app.toJson());

  // 2 Write content
  await file.writeAsString(jsonString, mode: FileMode.write);

  print("File " + file.path + " successfully written");
}

Future<App> readQuizApp(File file) async {

  // 1  Read content
  String stringData = await file.readAsString();
  final jsonData = jsonDecode(stringData) as Map<String, dynamic>;

  // 2  Deserialize the app
  return App.fromJson(jsonData);
}
