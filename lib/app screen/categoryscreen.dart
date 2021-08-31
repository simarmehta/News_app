import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news_app/Content/data.dart';
import 'package:news_app/Content/news.dart';
import 'package:news_app/model/articlemodel.dart';

import 'articlescreen.dart';
import 'homescreen.dart';

class CategoryScreen extends StatefulWidget {
  late final String category;
  CategoryScreen({required this.category});

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<ArticleModel> articles = <ArticleModel>[];
  bool _loading =true;
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    getCategoryNews();
    refreshList();

  }
  Future<dynamic> refreshList() async {
    refreshKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _loading=true;
    });
    return getCategoryNews();
  }
  getCategoryNews() async{
    CategoryNews newsC= CategoryNews();
    await newsC.getCategoryNews(widget.category);
    articles=newsC.news;
    setState(() {
      _loading =false;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.blueAccent,
        title:
        Text(widget.category.toUpperCase()+" NEWS",style: TextStyle(fontSize: 16,fontWeight:FontWeight.w600,fontStyle: FontStyle.italic),),

      ),
      body:_loading ? Center(
      child: Container(
      child: CircularProgressIndicator(),
      ),
      ) : RefreshIndicator(
        key: refreshKey,
        onRefresh: refreshList,
        child: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top:16),
                  child: ListView.builder(
                      itemCount: articles.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, index){
                        return NewsTile(imgUrl: articles[index].urlToImage ,
                          title: articles[index].title,
                          desc: articles[index].description,
                          url: articles[index].url,
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NewsTile extends StatelessWidget {
  late final String imgUrl, title, desc,url;
  NewsTile({required this.imgUrl,required this.title,required this.desc,required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => ArticleScreen(newsUrl: url,))
        );
      } ,
      child: Container(
        margin: EdgeInsets.only(bottom:16),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(imgUrl)),
            SizedBox(height: 4,),
            Text(title,style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500
            ),),
            SizedBox(height: 8,),
            Text(desc,style: TextStyle(
                color: Colors.black38
            ),)

          ],
        ),
      ),
    );
  }
}

