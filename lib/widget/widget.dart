import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:walpify/model/walpaper_model.dart';

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
          return GridView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.49,
                crossAxisSpacing: 6.4,
                mainAxisSpacing: 7.8,
              ),
              itemBuilder: (context, index) {
                final walp = snapshot.data!.photos[index];
                return Container(
                  padding: EdgeInsets.only(right: 5, left:5),
                  child: GridTile(
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          walp.src.portrait,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: snapshot.data!.photos.length);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    ),
  );
}


// Container(
//     padding: EdgeInsets.symmetric(horizontal: 9),
//     child: GridView.count(
      // shrinkWrap: true,
//       crossAxisCount: 2,
//       childAspectRatio: 0.6,
//       crossAxisSpacing: 6.4,
//       physics: ClampingScrollPhysics(),
//       mainAxisSpacing: 7.6,
//     ),
//   );
  //  children: walpapers.map((WalpaperModel walpaper) {
        // return GridTile(
        //   child: Container(
        //     child: ClipRRect(
        //       borderRadius: BorderRadius.circular(10),
        //       child: Image.network(
        //         "https://images.pexels.com/photos/9749656/pexels-photo-9749656.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
        //         fit: BoxFit.cover,
        //       ),
        //     ),
        //   ),
        // );
  //     }).toList(),