import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:walpify/model/walpaper_model.dart';
import 'dart:math';

class API_Manager {
  Future<WalpaperModel> getWalpapers() async {
    // Random random = new Random();
    // int randomNum = random.nextInt(8);
    var walpaperModel = null;
    try {
      var url =
          Uri.parse("https://api.pexels.com/v1/curated?page=3&per_page=100");
      var response = await http.get(url, headers: {
        "Authorization":
            "563492ad6f9170000100000106a3406aac0746a19935fb74eddd45a6"
      });
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        walpaperModel = WalpaperModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return walpaperModel;
    }
    return walpaperModel;
  }
}

class API_ManagerSearch {
  Future<WalpaperModel> getSearchWalpaper(String searchQuery) async {
    // Random random = new Random();
    // int randomNumber = random.nextInt(8);
    var walpaperModel = null;
    try {
      var url = Uri.parse(
          "https://api.pexels.com/v1/search?query=$searchQuery&page=2&per_page=80");
      var response = await http.get(url, headers: {
        "Authorization":
            "563492ad6f9170000100000106a3406aac0746a19935fb74eddd45a6"
      });
      print(response.body);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        walpaperModel = WalpaperModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return walpaperModel;
    }
    return walpaperModel;
  }
}
