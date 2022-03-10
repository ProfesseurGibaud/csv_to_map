import 'dart:io';
import 'package:csv/csv.dart';

List<Map<String, dynamic>> csvToListOfMaps(String path) {
  File myFile = File(path);
  String content = myFile.readAsStringSync();
  List<List<dynamic>> list =
      CsvToListConverter().convert(content, eol: "\n").toList();
  List legend = list[0];
  List<Map<String, dynamic>> maps = [];
  list.sublist(1).forEach((List l) {
    Map<String, dynamic> map = {};
    for (int i = 0; i < legend.length; i++) {
      map.putIfAbsent('${legend[i]}', () => l[i]);
    }
    maps.add(map);
  });
  return maps;
}

void main() {
  String path = "assets/Definition.csv";
  List<Map<String, dynamic>> maps = csvToListOfMaps(path);
  print(maps[0]["nom"]);
}
