import 'package:flutter/material.dart';
import 'package:twentyfour_july/widget/lpo_widget.dart';

import 'add_new.dart';

class list_hotels extends StatelessWidget {
  const list_hotels({Key? key}) : super(key: key);
  static const routename = "/list_hotel";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  const Text('Hotels'),actions: [IconButton(icon: const Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(lpoaddscreen.routename,(Route<dynamic> route) => false);
          }, )],),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: ()=>Navigator.of(context).pushNamed(lpo_widget.routename,arguments: 'Palazzo'),
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Center(
                  child: Text('Palazzo', style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                width: 200.00,
                height: 70.00,
// to skew the container
                // transform: Matrix4.rotationZ(0.1),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(
                    color: Colors.red,
                    width: 2.0,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(40.0)),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 20.0,
                      spreadRadius: 20.0,
                    ),
                  ],
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.red,
                      Colors.white,
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: ()=>Navigator.of(context).pushNamed(lpo_widget.routename,arguments: 'Dukes'),
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Center(
                  child: Text('Dukes', style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                width: 200.00,
                height: 70.00,
// to skew the container
                // transform: Matrix4.rotationZ(0.1),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(
                    color: Colors.red,
                    width: 2.0,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(40.0)),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 20.0,
                      spreadRadius: 20.0,
                    ),
                  ],
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.red,
                      Colors.white,
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
    onTap: ()=>Navigator.of(context).pushNamed(lpo_widget.routename,arguments: 'NovotelAD'),
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Center(
                  child: Text('NovotelAD', style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                width: 200.00,
                height: 70.00,
// to skew the container
                // transform: Matrix4.rotationZ(0.1),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(
                    color: Colors.red,
                    width: 2.0,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(40.0)),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 20.0,
                      spreadRadius: 20.0,
                    ),
                  ],
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.red,
                      Colors.white,
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: ()=>Navigator.of(context).pushNamed(lpo_widget.routename,arguments: 'NovotelBD'),
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Center(
                  child: Text('NovotelBD', style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                width: 200.00,
                height: 70.00,
// to skew the container
                // transform: Matrix4.rotationZ(0.1),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(
                    color: Colors.red,
                    width: 2.0,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(40.0)),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 20.0,
                      spreadRadius: 20.0,
                    ),
                  ],
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.red,
                      Colors.white,
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: ()=>Navigator.of(context).pushNamed(lpo_widget.routename,arguments: 'OSG'),
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Center(
                  child: Text('OSG', style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                width: 200.00,
                height: 70.00,
// to skew the container
                // transform: Matrix4.rotationZ(0.1),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(
                    color: Colors.red,
                    width: 2.0,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(40.0)),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 20.0,
                      spreadRadius: 20.0,
                    ),
                  ],
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.red,
                      Colors.white,
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: ()=>Navigator.of(context).pushNamed(lpo_widget.routename,arguments: 'D1'),
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Center(
                  child: Text('D1', style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                width: 200.00,
                height: 70.00,
// to skew the container
                // transform: Matrix4.rotationZ(0.1),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(
                    color: Colors.red,
                    width: 2.0,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(40.0)),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 20.0,
                      spreadRadius: 20.0,
                    ),
                  ],
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.red,
                      Colors.white,
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
