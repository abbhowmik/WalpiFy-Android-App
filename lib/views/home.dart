import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:walpify/data/data.dart';
import 'package:walpify/model/cateries_model.dart';
import 'package:walpify/model/walpaper_model.dart';
import 'package:walpify/services/api_manager.dart';
import 'package:walpify/widget/widget.dart';
import 'category.dart';
import 'search.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchQuery = new TextEditingController();

  List<CategorieModel> categories = <CategorieModel>[];
  late Future<WalpaperModel> walpaperModel;

  Future getWalpapersData()async{
    categories = getCategories();
    walpaperModel = API_Manager().getWalpapers();
    setState(() {});
  }

  @override
  void initState() {
    getWalpapersData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: brandName(),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              // ! search Container
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                decoration: BoxDecoration(
                  color: Color(0xfff5f8fd),
                  borderRadius: BorderRadius.circular(36),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: searchQuery,
                        textInputAction: TextInputAction.search,
                        onSubmitted: (val) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Search(query: val)));
                        },
                        decoration: InputDecoration(
                          hintText: "Search for Wallpaper",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Search(query: searchQuery.text)));
                        },
                        child: Icon(Icons.search)),
                  ],
                ),
              ),
              SizedBox(
                height: 7,
              ),

              // ! Categories
              Container(
                margin: EdgeInsets.only(left:4),
                height: 70,
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
              // ! WalpaperList
              walpapersList(walpaperModel, context)
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SearchCategory(title: title)));
      },
      child: Container(
        margin: EdgeInsets.only(left:9, right: 5),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imgUrl,
                height: 50,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 50,
              width: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.black38, borderRadius: BorderRadius.circular(12)
              ),
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
      ),
    );
  }
}
