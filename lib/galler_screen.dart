import 'package:flutter/material.dart';
// import 'home.dart';
import 'package:photo_view/photo_view.dart';
import 'dart:io';
class GalleryView extends StatefulWidget {
  final List<String> imageList;

  const GalleryView({Key? key, required this.imageList}) : super(key: key);


  @override
  State<GalleryView> createState() => _GalleryViewState();
}
//changed on master
class _GalleryViewState extends State<GalleryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gallery"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: GridView.builder(


            
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, 
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0, 
            ),
            itemCount: widget.imageList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: PhotoView(
            imageProvider: FileImage(File(widget.imageList[index])),
          ),
        );
      },
    );
  },
                child: Image.file(
                  File(widget.imageList[index]),
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
