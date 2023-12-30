// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gallery_app/galler_screen.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatelessWidget {
   Home({super.key});

  List<String> imageList = [   
    


    
    ];

  Future _getImageFromCamera() async {
    final selectedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (selectedImage != null) {
      String imageItem = selectedImage.path;
   
       imageList.add(imageItem);
     
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => GalleryView(imageList: imageList),
                    )),
                    child: Image.network(
                        "https://downloadr2.apkmirror.com/wp-content/uploads/2020/12/71/5fec247913c42-384x384.png",
                        height: 120,
                        width: 120, errorBuilder: (BuildContext context,
                            Object error, StackTrace? stackTrace) {
                      return const Icon(
                        Icons.error, // You can use any custom error widget here
                        size: 60,
                        color: Colors.red,
                      );
                    }),
                  )),
            ),
            IconButton(
              onPressed: () {
                _getImageFromCamera();
              },
              icon: const Icon(
                Icons.camera,
                size: 40,
              ),
            )
          ],
        ),
      )),
    );
  }
}

