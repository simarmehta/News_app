import 'dart:convert';

import 'package:news_app/model/articlemodel.dart';
import 'package:http/http.dart' as http;

class News{

  List<ArticleModel> news =[];
  Future<void> getNews() async{

    String Surl="https://newsapi.org/v2/top-headlines?country=in&category=general&apiKey=d16ad87f62b34df198da6ca20338cca4";
    Uri url;
    url=Uri.parse(Surl);
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status']=='ok'){
      jsonData["articles"].forEach((element) {

        if(element["urlToImage"] != null && element['description'] !=null){
          ArticleModel articleModel=ArticleModel(
            title: element['title'],
             author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
            publishedAt: element['publishedAt'],
          );
          news.add(articleModel);
        }
      });
      }
    news.sort((a,b)=> a.publishedAt.compareTo(b.publishedAt));
    }

      }


class CategoryNews{

  List<ArticleModel> news =[];
  Future<void> getCategoryNews(String category) async{

    String Surl="https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=d16ad87f62b34df198da6ca20338cca4";
    Uri url;
    url=Uri.parse(Surl);
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status']=='ok'){
      jsonData["articles"].forEach((element) {

        if(element["urlToImage"] != null && element['description'] !=null){
          ArticleModel articleModel=ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
            publishedAt: element['publishedAt']
          );
          news.add(articleModel);
        }
      });
    }
    news.sort((a,b)=> a.publishedAt.compareTo(b.publishedAt));
  }

}

