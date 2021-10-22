import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:walpify/model/walpaper_model.dart';
import 'package:walpify/views/image_view.dart';

Widget brandName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Walpi",
        style: TextStyle(color: Colors.black),
      ),
      Text(" "),
      Text(
        "Fy",
        style: TextStyle(color: Colors.blue),
      ),
    ],
  );
}

Widget walpapersList(
    Future<WalpaperModel> walpaperModel, BuildContext context) {
  return Container(
    child: FutureBuilder(
      future: walpaperModel,
      builder: (BuildContext context, AsyncSnapshot<WalpaperModel> snapshot) {
        if (snapshot.hasData) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 7),
            child: GridView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.56,
                  crossAxisSpacing: 6.4,
                  mainAxisSpacing: 7.8,
                ),
                itemBuilder: (context, index) {
                  final walp = snapshot.data!.photos[index];
                  return GridTile(
                    child: Container(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ImageView(imgUrl: walp.src.portrait)));
                        },
                        child: Hero(
                          tag: walp.src.portrait,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              walp.src.portrait,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: snapshot.data!.photos.length),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    ),
  );
}
