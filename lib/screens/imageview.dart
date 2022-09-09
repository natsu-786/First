import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class imageview extends StatefulWidget {
  const imageview({Key? key}) : super(key: key);
  static const routename = "/imageview";
  @override
  State<imageview> createState() => _imageviewState();
  Future loadimage() async{
  }
}

class _imageviewState extends State<imageview> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> args = ModalRoute.of(context)!.settings.arguments as List;
    Stream<QuerySnapshot<Map<String, dynamic>>> stream = FirebaseFirestore.instance.collection('hotel/${args[0]}/lpo/${args[3]}/image/').snapshots();


    return StreamBuilder(
        stream: stream,
        builder: (BuildContext ctx, AsyncSnapshot stc) {
          if (stc.connectionState == ConnectionState.waiting) {
            return const Center(

              child: CircularProgressIndicator(),
            );
          }
          return PageView.builder(itemCount: stc.data.docs.length, scrollDirection: Axis.vertical,

              itemBuilder: (ctx, index) =>InteractiveViewer(minScale:0.1,maxScale:6,child: Image.network(stc.data.docs[index]['image'].toString())));
        }
    );
  }
}
