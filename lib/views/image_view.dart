// ignore: unused_import
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:permission_handler/permission_handler.dart';

// ignore: must_be_immutable
class ImageView extends StatefulWidget {
  late String imgUrl;
  ImageView({required this.imgUrl});
  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  // ! for Setting Walpaper

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: widget.imgUrl,
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.network(widget.imgUrl, fit: BoxFit.cover)),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () async {
                    print("Reloading...");
                    _save();
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 58,
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xff1C1B1B).withOpacity(0.8),
                        ),
                      ),
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 2,
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 29),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white70, width: 1),
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(colors: [
                              Color(0x36FFFFFF),
                              Color(0x36FFFFFF)
                            ])),
                        child: Column(
                          children: [
                            Text("Save Walpaper",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 1),
                            Text("will save to your Gallary",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Hero(
                    tag: "a",
                    child: Container(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        child: Text("Cancel",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold))),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _save() async {
    if (Platform.isAndroid) {
      await _askPermission();
    }
    var response = await Dio()
        .get(widget.imgUrl, options: Options(responseType: ResponseType.bytes));
    final result =
        await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    print(result);
    Navigator.pop(context);
  }

  _askPermission() async {
    if (Platform.isIOS) {
      /*Map<PermissionGroup, PermissionStatus> permissions =
          */
      await PermissionHandler().requestPermissions([PermissionGroup.photos]);
    } else {
      await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
    }
  }
}
