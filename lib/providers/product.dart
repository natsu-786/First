import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String? id;
  final String? Number;
  final String? date;
  final String? department;
  final String? name;
  final String? measurements;
  final String? designation;
  final String? status;
  final String? jacket;
  final String? trouser;
  final String? shirt;
  final String? skirt;
  final String? other;

  bool isFavorite;

  Product({
    @required this.jacket,
    @required this.trouser,
    @required this.shirt,
    @required this.skirt,
    @required this.other,
    @required this.id,
    @required this.Number,
    @required this.date,
    @required this.department,
    @required this.name,
    @required this.measurements,
    @required this.designation,
    @required this.status,
    this.isFavorite = false,
  });

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

}
