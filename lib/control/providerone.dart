import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class ProviderOne with ChangeNotifier {
  final my_box = Hive.box('my_box');

  List<dynamic> get items => my_box.values.toList();

  void addItem(String title, String subtitle) {
    my_box.add({'title': title, 'subtitle': subtitle});
    notifyListeners();
  }

  void updateItem(int index, String title, String subtitle) {
    my_box.putAt(index, {'title': title, 'subtitle': subtitle});
    notifyListeners();
  }

  void deleteItem(int index) {
    my_box.deleteAt(index);
    notifyListeners();
  }
}
