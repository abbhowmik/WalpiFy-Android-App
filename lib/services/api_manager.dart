import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:walpify/model/walpaper_model.dart';

class API_Manager {
  void getWalpapers() async {
    var url = Uri.parse("https://api.pexels.com/v1/curated?page=2&per_page=80");
    var response = await http.get(url, headers: {
      "Authorization":
          "563492ad6f9170000100000106a3406aac0746a19935fb74eddd45a6"
    });
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      var welcome = Welcome.fromJson(jsonMap);
    }
  }
}
