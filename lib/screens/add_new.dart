import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twentyfour_july/providers/products.dart';
import 'package:intl/intl.dart';
import 'package:twentyfour_july/widget/lpo_widget.dart';

import '../providers/product.dart';

class lpoaddscreen extends StatefulWidget {
  const lpoaddscreen({Key? key}) : super(key: key);
  static const routename = "/add_new";

  @override
  State<lpoaddscreen> createState() => lpoaddscreenState();
}

class lpoaddscreenState extends State<lpoaddscreen> {
  // var _isInit = true;
  final _form = GlobalKey<FormState>();
  final lponumbercont = TextEditingController();
  final lpodatecont = TextEditingController();
  final lpodepartmentcont = TextEditingController();
  final lpomeasurementcont = TextEditingController();
  final lponamecont = TextEditingController();
  final lpostatuscont = TextEditingController();
  final statusfocusnode = FocusNode();
  var editedlpo = Product(
      id: 'null',
      measurements: 'null',
      designation: 'null',
      Number: 'null',
      name: 'null',
      date: 'null',
      status: 'null',
      jacket: 'null',
      trouser: 'null',
      shirt: 'null',
      skirt: 'null',
      other: 'null',
      department: 'null');
  var initlpo = {
    "id": 'null',
    "measurements": 'Done',
    "designation": '',
    "number": '',
    "name": '',
    "date": DateFormat('dd.MM.yyyy').format(DateTime.now()).toString(),
    "status": 'Production',
    "jacket": '',
    "trouser": '',
    "shirt": '',
    "skirt": '',
    "other": ''
  };
  var _isLoading = true;
  var hotelname = '';
  var edit = false;
  var button = false;
  var editid = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    List<dynamic> args = ModalRoute.of(context)!.settings.arguments as List;
    if (args[1] != '') {
      editid = args[1];
      Provider.of<products>(context, listen: false)
          .findById(args[0], args[1])
          .then((DocumentSnapshot doc) {
        final value = doc.data() as Map<String, dynamic>;
        var listgot = {
          "id": value['id'].toString(),
          "measurements": value['measurements'].toString(),
          "designation": value['designation'].toString(),
          "Number": value['Number'].toString(),
          "name": value['name'].toString(),
          "date": value['date'].toString(),
          "status": value['status'].toString(),
          "jacket": value['jacket'].toString(),
          "trouser": value['trouser'].toString(),
          "shirt": value['shirt'].toString(),
          "skirt": value['skirt'].toString(),
          "other": value['other'].toString(),
        };
        setState(() {
          button = true;
          _isLoading = false;
          initlpo = listgot;
          hotelname = args[0];
        });
      });
    }
    if (args[1] == '') {
      setState(() {
        button = false;
        _isLoading = false;
        hotelname = args[0];
      });
    }

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    lponumbercont.dispose();
    lpodatecont.dispose();
    lponamecont.dispose();
    lpodepartmentcont.dispose();
    lpostatuscont.dispose();
    lpomeasurementcont.dispose();
    statusfocusnode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text('Add LPO', style: TextStyle(fontSize: 28))),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Form(
                  key: _form,
                  child: ListView(
                    children: [
                      TextFormField(
                        initialValue: initlpo['Number'],
                        decoration: const InputDecoration(labelText: 'Number'),
                        textInputAction: TextInputAction.next,
                        onSaved: (value) {
                          editedlpo = Product(
                              id: editedlpo.id,
                              name: editedlpo.name,
                              date: editedlpo.date,
                              Number: value,
                              measurements: editedlpo.measurements,
                              designation: editedlpo.designation,
                              status: editedlpo.status,
                              jacket: editedlpo.jacket,
                              trouser: editedlpo.trouser,
                              shirt: editedlpo.shirt,
                              skirt: editedlpo.skirt,
                              other: editedlpo.other,
                              department: editedlpo.department);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please provide a value';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        initialValue: initlpo['date'],
                        decoration: const InputDecoration(labelText: 'Date'),
                        textInputAction: TextInputAction.next,
                        onSaved: (value) {
                          editedlpo = Product(
                              id: editedlpo.id,
                              name: editedlpo.name,
                              date: value,
                              Number: editedlpo.Number,
                              measurements: editedlpo.measurements,
                              designation: editedlpo.designation,
                              status: editedlpo.status,
                              jacket: editedlpo.jacket,
                              trouser: editedlpo.trouser,
                              shirt: editedlpo.shirt,
                              skirt: editedlpo.skirt,
                              other: editedlpo.other,
                              department: editedlpo.department);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please provide a value';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        initialValue: initlpo['name'],
                        decoration: const InputDecoration(labelText: 'Name'),
                        textInputAction: TextInputAction.next,
                        onSaved: (value) {
                          editedlpo = Product(
                              id: editedlpo.id,
                              name: value,
                              date: editedlpo.date,
                              Number: editedlpo.Number,
                              measurements: editedlpo.measurements,
                              designation: editedlpo.designation,
                              status: editedlpo.status,
                              jacket: editedlpo.jacket,
                              trouser: editedlpo.trouser,
                              shirt: editedlpo.shirt,
                              skirt: editedlpo.skirt,
                              other: editedlpo.other,
                              department: editedlpo.department);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please provide a value';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        initialValue: initlpo['designation'],
                        decoration:
                            const InputDecoration(labelText: 'Designation'),
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(statusfocusnode);
                        },
                        onSaved: (value) {
                          editedlpo = Product(
                              id: editedlpo.id,
                              name: editedlpo.name,
                              date: editedlpo.date,
                              Number: editedlpo.Number,
                              measurements: editedlpo.measurements,
                              designation: value,
                              status: editedlpo.status,
                              jacket: editedlpo.jacket,
                              trouser: editedlpo.trouser,
                              shirt: editedlpo.shirt,
                              skirt: editedlpo.skirt,
                              other: editedlpo.other,
                              department: editedlpo.designation);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please provide a value';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        initialValue: initlpo['status'],
                        decoration: const InputDecoration(labelText: 'Status'),
                        textInputAction: TextInputAction.next,
                        focusNode: statusfocusnode,
                        onSaved: (value) {
                          editedlpo = Product(
                              id: editedlpo.id,
                              name: editedlpo.name,
                              date: editedlpo.date,
                              Number: editedlpo.Number,
                              measurements: editedlpo.measurements,
                              designation: editedlpo.designation,
                              status: value,
                              jacket: editedlpo.jacket,
                              trouser: editedlpo.trouser,
                              shirt: editedlpo.shirt,
                              skirt: editedlpo.skirt,
                              other: editedlpo.other,
                              department: editedlpo.department);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please provide a value';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        initialValue: initlpo['measurements'],
                        decoration:
                            const InputDecoration(labelText: 'Measurement'),
                        textInputAction: TextInputAction.next,
                        onSaved: (value) {
                          editedlpo = Product(
                              id: editedlpo.id,
                              name: editedlpo.name,
                              date: editedlpo.date,
                              Number: editedlpo.Number,
                              measurements: value,
                              designation: editedlpo.designation,
                              status: editedlpo.status,
                              jacket: editedlpo.jacket,
                              trouser: editedlpo.trouser,
                              shirt: editedlpo.shirt,
                              skirt: editedlpo.skirt,
                              other: editedlpo.other,
                              department: editedlpo.designation);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please provide a value';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: TextFormField(
                              initialValue: initlpo['jacket'],
                              decoration:
                                  const InputDecoration(labelText: 'Jacket'),
                              textInputAction: TextInputAction.next,
                              onSaved: (value) {
                                editedlpo = Product(
                                    id: editedlpo.id,
                                    name: editedlpo.name,
                                    date: editedlpo.date,
                                    Number: editedlpo.Number,
                                    measurements: editedlpo.measurements,
                                    designation: editedlpo.designation,
                                    status: editedlpo.status,
                                    jacket: value,
                                    trouser: editedlpo.trouser,
                                    shirt: editedlpo.shirt,
                                    skirt: editedlpo.skirt,
                                    other: editedlpo.other,
                                    department: editedlpo.department);
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please provide a value';
                                }
                                return null;
                              },
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                              initialValue: initlpo['trouser'],
                              decoration:
                                  const InputDecoration(labelText: 'Trouser'),
                              textInputAction: TextInputAction.next,
                              onSaved: (value) {
                                editedlpo = Product(
                                    id: editedlpo.id,
                                    name: editedlpo.name,
                                    date: editedlpo.date,
                                    Number: editedlpo.Number,
                                    measurements: editedlpo.measurements,
                                    designation: editedlpo.designation,
                                    status: editedlpo.status,
                                    jacket: editedlpo.jacket,
                                    trouser: value,
                                    shirt: editedlpo.shirt,
                                    skirt: editedlpo.skirt,
                                    other: editedlpo.other,
                                    department: editedlpo.department);
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please provide a value';
                                }
                                return null;
                              },
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                              initialValue: initlpo['shirt'],
                              decoration:
                                  const InputDecoration(labelText: 'shirt'),
                              textInputAction: TextInputAction.next,
                              onSaved: (value) {
                                editedlpo = Product(
                                    id: editedlpo.id,
                                    name: editedlpo.name,
                                    date: editedlpo.date,
                                    Number: editedlpo.Number,
                                    measurements: editedlpo.measurements,
                                    designation: editedlpo.designation,
                                    status: editedlpo.status,
                                    jacket: editedlpo.jacket,
                                    trouser: editedlpo.trouser,
                                    shirt: value,
                                    skirt: editedlpo.skirt,
                                    other: editedlpo.other,
                                    department: editedlpo.department);
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please provide a value';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: TextFormField(
                                initialValue: initlpo['skirt'],
                                decoration:
                                    const InputDecoration(labelText: 'skirt'),
                                textInputAction: TextInputAction.next,
                                onSaved: (value) {
                                  editedlpo = Product(
                                      id: editedlpo.id,
                                      name: editedlpo.name,
                                      date: editedlpo.date,
                                      Number: editedlpo.Number,
                                      measurements: editedlpo.measurements,
                                      designation: editedlpo.designation,
                                      status: editedlpo.status,
                                      jacket: editedlpo.jacket,
                                      trouser: editedlpo.trouser,
                                      shirt: editedlpo.shirt,
                                      skirt: value,
                                      other: editedlpo.other,
                                      department: editedlpo.department);
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please provide a value';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Flexible(
                              child: TextFormField(
                                initialValue: initlpo['other'],
                                decoration:
                                    const InputDecoration(labelText: 'other'),
                                textInputAction: TextInputAction.next,
                                onSaved: (value) {
                                  editedlpo = Product(
                                      id: editedlpo.id,
                                      name: editedlpo.name,
                                      date: editedlpo.date,
                                      Number: editedlpo.Number,
                                      measurements: editedlpo.measurements,
                                      designation: editedlpo.designation,
                                      status: editedlpo.status,
                                      jacket: editedlpo.jacket,
                                      trouser: editedlpo.trouser,
                                      shirt: editedlpo.shirt,
                                      skirt: editedlpo.skirt,
                                      other: value,
                                      department: editedlpo.department);
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please provide a value';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              var id = DateTime.now()
                                  .microsecondsSinceEpoch
                                  .toString();
                              _form.currentState?.save();
                              button
                                  ? Provider.of<products>(context,
                                          listen: false)
                                      .editproduct(
                                        editedlpo,
                                        hotelname,
                                        initlpo['id'].toString(),
                                      )
                                      .then(
                                        (value) => Navigator.of(context)
                                            .pushNamedAndRemoveUntil(
                                                lpo_widget.routename,
                                                (Route<dynamic> route) => false,
                                                arguments: hotelname)
                                            .then((value) =>
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                        const SnackBar(
                                                  content: Text('LPO ADDED !'),
                                                  duration: Duration(
                                                      milliseconds: 700),
                                                ))),
                                      )
                                  : Provider.of<products>(context,
                                          listen: false)
                                      .addProduact(editedlpo, hotelname, id).then((value) =>
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                            content: Text('LPO ADDED !'),
                                            duration:
                                                Duration(milliseconds: 700),
                                          )));
                            },
                            child: Container(
                                alignment: Alignment.center,
                                height: 40,
                                width: 100,
                                color: Colors.teal,
                                child: button
                                    ? const Text(
                                        'Update',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    : const Text(
                                        'Add',
                                        style: TextStyle(color: Colors.white),
                                      )),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  lpo_widget.routename,
                                  (Route<dynamic> route) => false,
                                  arguments: hotelname);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: 100,
                              color: Colors.teal,
                              child: const Text(
                                'LPO List',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
        ));
  }
}
