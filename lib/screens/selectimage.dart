import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:twentyfour_july/widget/lpo_widget.dart';

class selectimage extends StatefulWidget {
  const selectimage({Key? key}) : super(key: key);
  static const routename = "/selectimage";

  @override
  State<selectimage> createState() => _selectimageState();
}

class _selectimageState extends State<selectimage> {
  File? _image;
  File? compresedimage;
  String url = '';
  final imagepicker = ImagePicker();

  showSnackbar(String snackText, Duration d) {
    final snackBar = SnackBar(
      content: Text(snackText),
      duration: d,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future imagePickerMethod() async {
    final pick = await imagepicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pick != null) {
        _image = File(pick.path);
        compressImage(_image);
      } else {
        showSnackbar('No Image Selected', const Duration(microseconds: 400));
      }
    });
  }

  void compressImage(File? file) async {
    // Get file path
    // eg:- "Volume/VM/abcd.jpeg"
    final filePath = file?.absolute.path;

    // Create output file path
    // eg:- "Volume/VM/abcd_out.jpeg"
    final lastIndex = filePath?.lastIndexOf(new RegExp(r'.jp'));
    final splitted = filePath?.substring(0, (lastIndex));
    final outPath = "${splitted}_out${filePath?.substring(lastIndex!)}";

    final compressedImage = await FlutterImageCompress.compressAndGetFile(
        filePath!, outPath,
        quality: 70);
    compresedimage = compressedImage;
  }

  Future uploadImage(String hotelname, String id, String name) async {
    Reference ref =
        FirebaseStorage.instance.ref().child(hotelname).child(id).child(name);
    await ref.putFile(compresedimage!);
    url = await ref.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> args = ModalRoute.of(context)!.settings.arguments
        as List; //for folder of image

    return Scaffold(
      appBar: AppBar(
        title: const Text('Imagee Upload'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(38),
            child: SizedBox(
              height: 500,
              width: double.infinity,
              child: Column(
                children: [
                  const Text('Upload image'),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      width: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.red)),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: _image == null
                                    ? const Center(child: Text('NO Image'))
                                    : Image.file(_image!)),
                            ElevatedButton(
                                onPressed: () {
                                  imagePickerMethod();
                                },
                                child: const Text('Pick Image')),
                            ElevatedButton(
                                onPressed: () async {
                                  await uploadImage(
                                          args[0],
                                          args[3],
                                          DateTime.now()
                                              .microsecondsSinceEpoch
                                              .toString())
                                      .then((value) => FirebaseFirestore
                                          .instance
                                          .collection(
                                              'hotel/${args[0]}/lpo/${args[3]}/image')
                                          .add({'image': url})).then((value) => Navigator.of(context).pushReplacementNamed(lpo_widget.routename).then((value) => SnackBar(
                                    content: const Text('Yay! A SnackBar!'),
                                    action: SnackBarAction(
                                      label: 'Undo',
                                      onPressed: () {
                                        // Some code to undo the change.
                                      },
                                    ),
                                  )
                                  ));
                                },
                                child: const Text('Upload Image')),
                            ElevatedButton(
                                onPressed: () {}, child: const Text('url')),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
