import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:twentyfour_july/providers/product.dart';

class products with ChangeNotifier {
  List _items = [];

  List<Product> get items {
    return [..._items];
  }
  Future<void> addProduact(Product editedlpo, String hotelname, String id) async {
    FirebaseFirestore.instance.collection('hotel/$hotelname/lpo').doc(id).set( {"id": id,
        "name": editedlpo.name,
        "date": editedlpo.date,
        "Number": editedlpo.Number,
        "measurements": editedlpo.measurements,
        "designation": editedlpo.designation,
        "status": editedlpo.status,
        "jacket": editedlpo.jacket,
        "trouser": editedlpo.trouser,
        "shirt": editedlpo.shirt,
        "skirt": editedlpo.skirt,
        "other": editedlpo.other});
        // need to see this

  }
  Future<DocumentSnapshot<Map<String, dynamic>>> findById(String hotelname ,String id) {
    return FirebaseFirestore.instance.collection('hotel/$hotelname/lpo').doc(id).get();
  }
  Future<void> editproduct(Product editedlpo, String hotelname,String id) async {
    FirebaseFirestore.instance
        .collection('hotel/$hotelname/lpo').doc(id).update(
        {
      "id": editedlpo.id,
      "name": editedlpo.name,
      "date": editedlpo.date,
      "Number": editedlpo.Number,
      "measurements": editedlpo.measurements,
      "designation": editedlpo.designation,
      "status": editedlpo.status,
      "jacket": editedlpo.jacket,
      "trouser": editedlpo.trouser,
      "shirt": editedlpo.shirt,
      "skirt": editedlpo.skirt,
      "other": editedlpo.other,
      "text": 'Heloo'
    }
    );
  }
  Future<void> deleteproduct(String hotelname,String id) async {
    FirebaseFirestore.instance
        .collection('hotel/$hotelname/lpo').doc(id).delete();
  }
// static Product fromJson(Map<String,dynamic>json)=>Product(
//     jacket: json['id'],
//     trouser:json['trouser'],
//     shirt: json['shirt'],
//     skirt: json['skirt'],
//     other: json['other'],
//     id: json['id'],
//     Number: json['Number'],
//     date: json['date'],
//     department: json['department'],
//     name: json['name'],
//     measurements: json['measurements'],
//     designation: json['designation'],
//     status: json['status']);
}
