import 'dart:convert';

import 'package:http/http.dart';
import 'package:newsapp/postmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Alldata {
  SharedPreferences pref = SharedPreferences.getInstance() as SharedPreferences;

  static Future<List<Post>> getallposts(
      String categoryname, String language) async {
    List<Post> allpostes = List<Post>();

    Response futurepost = await get(
        'https://newsapi.org/v2/top-headlines?language=${language}&category=${categoryname}&apiKey=04c74aee5c93440dad43965905235f27');
    if (futurepost.statusCode == 200) {
      var parsed = json.decode(futurepost.body);

      parsed['articles'].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          Post post = Post.fromjson(element);
          allpostes.add(post);
          print(post);
        }
      });
      return allpostes;
    }
  }
}
