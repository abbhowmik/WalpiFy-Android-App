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

Widget walpapersList(List<WalpaperModel> walpapers, BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 9),
    child: GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      crossAxisSpacing: 6.4,
      physics: ClampingScrollPhysics(),
      mainAxisSpacing: 7.6,
      children: walpapers.map((WalpaperModel walpaper) {
        return GridTile(
          child: Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                "https://images.pexels.com/photos/9749656/pexels-photo-9749656.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800",
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}

CachedNetworkImage({String? imageUrl, placeholder}) {}
