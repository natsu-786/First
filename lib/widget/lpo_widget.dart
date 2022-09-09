import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twentyfour_july/providers/products.dart';
import 'package:twentyfour_july/screens/list_hotels.dart';
import 'package:twentyfour_july/screens/selectimage.dart';
import '../screens/add_new.dart';
import '../screens/imageview.dart';
class lpo_widget extends StatefulWidget with ChangeNotifier{
  static const routename = "/lpowidget";

  lpo_widget({Key? key}) : super(key: key);

  @override
  State<lpo_widget> createState() => _lpo_widgetState();
}


class _lpo_widgetState extends State<lpo_widget> {
  bool isexp= false;
  int ?open=-1;


  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    String hotelname = ModalRoute.of(context)!.settings.arguments as String;
    Stream<QuerySnapshot<Map<String, dynamic>>> stream = FirebaseFirestore.instance.collection('hotel/$hotelname/lpo').snapshots();
    return Scaffold(

        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.keyboard_backspace,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).popAndPushNamed(list_hotels.routename);//after
            },),
            actions: [

              IconButton(
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(lpoaddscreen.routename,arguments: [hotelname,'']);//after
              },),

            ],



            centerTitle: true,
            title:  Text(hotelname, style: const TextStyle(fontSize: 28))),

        body: Container(
          width: width,
          height: height,
          child: StreamBuilder(

            stream: stream,
            builder: (BuildContext ctx, AsyncSnapshot stc) {
              if (stc.connectionState == ConnectionState.waiting) {
                return const Center(

                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                  itemCount: stc.data.docs.length,
                  itemBuilder: (ctx, index) =>
                      GestureDetector(
                        onHorizontalDragEnd:(_){
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: const Text("Alert Dialog Box"),
                              content: const Text("Chose Your Action"),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Provider.of<products>(context, listen: false).deleteproduct( hotelname, stc.data.docs[index].reference.id.toString()).then((value) => Navigator.of(ctx).pop());

                                  },
                                  child: Container(
                                    color: Colors.teal,
                                    padding: const EdgeInsets.all(14),
                                    child: const Text("Delete",style: TextStyle(color: Colors.black),),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(lpoaddscreen.routename,arguments:[hotelname,stc.data.docs[index].reference.id.toString(),stc.data.docs[index].toString()]);
                                  },
                                  child: Container(
                                    color: Colors.teal,
                                    padding: const EdgeInsets.all(14),
                                    child: const Text("Update",style: TextStyle(color: Colors.black),),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(ctx).pop();
                                  },
                                  child: Container(
                                    color: Colors.teal,
                                    padding: const EdgeInsets.all(14),
                                    child: const Text("Cancel",style:TextStyle(color: Colors.black),),
                                  ),
                                ),
                              ],
                            ),
                          );

                        },
                        onLongPress: () {

                          Navigator.of(context).pushNamed(selectimage.routename , arguments: [hotelname,stc.data.docs[index]['name'].toString(),stc.data.docs[index].toString(),stc.data.docs[index].reference.id.toString()]);
                        },
                        onTap: (){
                          Navigator.of(context).pushNamed(imageview.routename,arguments: [hotelname,stc.data.docs[index]['name'].toString(),stc.data.docs[index].toString(),stc.data.docs[index].reference.id.toString()]);
                        },
                        child: ExpansionPanelList(expansionCallback: (i,isexp){

                          setState(() {
                            if(index ==open){
                              open=-1;
                            }else{
                              open = index;
                            }
                          });
                          },
                        children: [
                          ExpansionPanel(
                              headerBuilder: (BuildContext context,bool isexp ){
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Row(

                                      crossAxisAlignment: CrossAxisAlignment
                                          .center,
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        SizedBox(width: 100,
                                            child: Text(stc.data
                                                .docs[index]['Number'].toUpperCase(),)),
                                        SizedBox(width: 90,
                                            child: Text(stc.data
                                                .docs[index]['name'].toUpperCase(),)),
                                        SizedBox(width: 100,
                                            child: Text(stc.data
                                                .docs[index]['date'].toUpperCase(),)),
                                      ],

                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .center,
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        SizedBox(width: 100,
                                            child: Text(stc.data
                                                .docs[index]['designation'].toUpperCase(),)),
                                        SizedBox(width: 100,
                                            child: Text(stc.data
                                                .docs[index]['measurements'].toUpperCase(),)),
                                        SizedBox(
                                            width: 90,
                                            child: Text(stc.data
                                                .docs[index]['status'].toUpperCase(),)),
                                      ],
                                    ),
                                      const SizedBox(height: 10,child: Divider(),),
                                  ],
                                );},
                              isExpanded : index==open,//check please
                              body:Container(
                                padding: EdgeInsets.zero,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          child: Text('Jacket :${stc.data
                                              .docs[index]['jacket'].toUpperCase()}',)),
                                      SizedBox(
                                          child: Text('Trouser :${stc.data
                                              .docs[index]['trouser'].toUpperCase()}',)),
                                      SizedBox(
                                          child: Text('Shirts :${stc.data
                                              .docs[index]['shirt'].toUpperCase()}',)),
                                      SizedBox(
                                          child: Text('Skirts :${stc.data
                                              .docs[index]['skirt'].toUpperCase()}')),
                                      SizedBox(
                                          child: Text(':${stc.data
                                              .docs[index]['other'].toUpperCase()}')),
                                       const SizedBox(height: 10,
                                         child: Divider(color: Colors.black,),),
                                    ]),
                              ),

                          ),


                        ],

                        ),

                      ),
              );
            },
          ),
        ));

  }
}


