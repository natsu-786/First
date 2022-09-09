import 'package:flutter/material.dart';
import "package:firebase_core/firebase_core.dart";
import 'package:provider/provider.dart';
import 'package:twentyfour_july/providers/product.dart';
import 'package:twentyfour_july/providers/products.dart';
import 'package:twentyfour_july/screens/add_new.dart';
import 'package:twentyfour_july/screens/imageview.dart';
import 'package:twentyfour_july/screens/list_hotels.dart';
import 'package:twentyfour_july/screens/selectimage.dart';
import 'package:twentyfour_july/widget/lpo_widget.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [
    ChangeNotifierProvider.value(value: Product(),),
        ChangeNotifierProvider.value(value: products())
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home:  const list_hotels(),
        routes: {
          list_hotels.routename : (ctx)=> const list_hotels(),
          lpoaddscreen.routename : (ctx)=> const lpoaddscreen(),
          lpo_widget.routename : (ctx)=> lpo_widget(),
          selectimage.routename: (ctx) => const selectimage(),
          imageview.routename: (ctx)=> const imageview(),

        },
      ),
    );
  }
}
