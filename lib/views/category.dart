import 'package:flutter/material.dart';
import 'package:walpify/model/walpaper_model.dart';
import 'package:walpify/services/api_manager.dart';
import 'package:walpify/widget/widget.dart';

class SearchCategory extends StatefulWidget {
  late String title;
  SearchCategory({required this.title});

  @override
  State<SearchCategory> createState() => _SearchCategoryState();
}

class _SearchCategoryState extends State<SearchCategory> {
  late Future<WalpaperModel> searchWalpaper;
  @override
  void initState() {
    searchWalpaper = API_ManagerSearch().getSearchWalpaper(widget.title);
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
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 9),
        child: walpapersList(searchWalpaper, context),
      ),
    );
  }
}
