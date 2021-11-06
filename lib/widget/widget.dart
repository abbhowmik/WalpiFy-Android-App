import 'package:flutter/material.dart';
import 'package:walpify/model/walpaper_model.dart';
import 'package:walpify/views/image_view.dart';

Widget brandName() {
  return RichText(
    text: TextSpan(
      style: TextStyle(fontSize: 21),
      children: <TextSpan>[
        TextSpan(
            text: 'Walpi',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        TextSpan(text: ' Fy', style: TextStyle(color: Colors.blue)),
      ],
    ),
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
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 140),
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    ),
  );
}
