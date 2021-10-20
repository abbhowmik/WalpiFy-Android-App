import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:walpify/data/data.dart';
import 'package:walpify/model/cateries_model.dart';
import 'package:walpify/model/walpaper_model.dart';
import 'package:walpify/widget/widget.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _searchQuery = TextEditingController();

  List<CategorieModel> categories = <CategorieModel>[];
  // List<WalpaperModel> walpapers = <WalpaperModel>[];

  //   Map<String, dynamic> jsonData = jsonDecode(response.body);
  //   jsonData["photos"].forEach((element) {
  //     WalpaperModel walpaperModel = new WalpaperModel();
  //     walpaperModel = WalpaperModel.Map(element);
  //     walpapers.add(walpaperModel);
  //   });
  //   setState(() {});

  @override
  void initState() {
    categories = getCategories();
    // getTrendingWalpaper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: brandName(),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                decoration: BoxDecoration(
                  color: Color(0xfff5f8fd),
                  borderRadius: BorderRadius.circular(38),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _searchQuery,
                        decoration: InputDecoration(
                          hintText: "Search for walpaper",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Icon(Icons.find_in_page),
                  ],
                ),
              ),
              SizedBox(
                height: 17,
              ),
              Container(
                height: 100,
                child: ListView.builder(
                    itemCount: categories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CatetoriesTile(
                        title: categories[index].categorieName,
                        imgUrl: categories[index].imgUrl,
                      );
                    }),
              ),
              // walpapersList(walpapers, context),
            ],
          ),
        ),
      ),
    );
  }
}

class CatetoriesTile extends StatelessWidget {
  final String imgUrl, title;

  CatetoriesTile({this.title = "", this.imgUrl = ""});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 4, left: 8),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              imgUrl,
              height: 50,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black38,
            height: 50,
            width: 100,
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
