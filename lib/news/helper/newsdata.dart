import 'dart:convert';

import 'package:farmers_market/news/model/newsmodel.dart';
import 'package:http/http.dart';

class News {
  // save json data inside this
  List<ArticleModel> datatobesavedin = [];

  Future<void> getNews() async {
    var response = await get(
      Uri.parse(
        'https://newsapi.org/v2/everything?q=agriculture&apiKey=ac06bdaa9ed64ae18d64a20076cbed1e'));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          // initliaze our model class

          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            urlToImage: element['urlToImage'],
            description: element['description'],
            url: element['url'],
          );

          datatobesavedin.add(articleModel);
        }
      });
    }
  }
}

// fetching news by  category
class CategoryNews {
  List<ArticleModel> datatobesavedin = [];

  Future<void> getNews(String category) async {
    var response = await get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=ac06bdaa9ed64ae18d64a20076cbed1e'));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          // initliaze our model class

          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            urlToImage: element['urlToImage'],
            description: element['description'],
            url: element['url'],
          );

          datatobesavedin.add(articleModel);
        }
      });
    }
  }
}
