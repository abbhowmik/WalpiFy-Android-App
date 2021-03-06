import 'package:flutter/material.dart';
import 'package:walpify/model/walpaper_model.dart';
import 'package:walpify/services/api_manager.dart';
import 'package:walpify/widget/widget.dart';

class Search extends StatefulWidget {
  late String query;
  Search({required this.query});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late Future<WalpaperModel> searchWalpaper;
  TextEditingController searchQuery = new TextEditingController();

  @override
  void initState() {
    searchWalpaper = API_ManagerSearch().getSearchWalpaper(widget.query);
    searchQuery.text = widget.query;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: brandName(),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                      decoration: InputDecoration(
                        hintText: "Search for walpaper",
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
            walpapersList(searchWalpaper, context),
          ],
        ),
      ),
    );
  }
}
