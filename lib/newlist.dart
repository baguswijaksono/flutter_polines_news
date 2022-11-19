import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_news/article.dart';
import 'package:flutter_application_news/detailpage.dart';

class NewsListPage extends StatelessWidget {
  static const routeName = '/article_list';
  const NewsListPage({Key? key}) : super(key: key);
 @override
 Widget build(BuildContext context) {
 return Scaffold(
 appBar: AppBar(
 title: const Text('Polines News '),
 ),
 body: FutureBuilder<String>(
 future:

 DefaultAssetBundle.of(context).loadString('assets/articles.json'),
 // ignore: unused_local_variable
 builder: (context, snapshot) {final List<Article> articles = parseArticles(snapshot.data);
 return ListView.builder(
  itemCount: articles.length,
  itemBuilder: (context, index) {
    return _buildArticleItem(context, articles[index]);
    },
    );
 },
 ),
 );
 }
  Widget _buildArticleItem(BuildContext context, Article article) {
 return ListTile(
contentPadding:
const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
leading: Image.network(
article.urlToImage,
width: 100,
),
onTap: () {
 Navigator.pushNamed(context, ArticleDetailPage.routeName,
 arguments: article);
 },
title: Text(article.title),
subtitle: Text(article.author),
);
}
   List<Article> parseArticles(String? json) {
  if (json == null) {
    return [];
 }
 final List parsed = jsonDecode(json);
 return parsed.map((json) => Article.fromJson(json)).toList();
 }
 }