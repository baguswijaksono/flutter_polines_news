// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_application_news/article.dart';
import 'package:flutter_application_news/articlewebview.dart';
import 'package:flutter_application_news/detailpage.dart';
import 'package:flutter_application_news/newlist.dart';
import 'package:flutter_application_news/style.dart';
import 'package:flutter_application_news/text_theme.dart';

void main() {

 runApp(const MyApp());
  }
  class MyApp extends StatelessWidget {

 const MyApp({Key? key}) : super(key: key);

 @override

 Widget build(BuildContext context) {
 return MaterialApp(
 title: 'News App',
 theme: ThemeData(
  appBarTheme: AppBarTheme(elevation: 0),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: secondaryColor,
      onPrimary: Colors.white,
      textStyle: const TextStyle(),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(0),
          ),
          ),
          ),
          ),
  textTheme: myTextTheme,
 colorScheme: Theme.of(context).colorScheme.copyWith(
  primary: primaryColor,
  onPrimary: Colors.black,
  secondary: secondaryColor,
 ),


visualDensity: VisualDensity.adaptivePlatformDensity,
),
initialRoute: NewsListPage.routeName,
routes: {
 NewsListPage.routeName: (context) => const NewsListPage(),
 ArticleDetailPage.routeName: (context) => ArticleDetailPage(
 article: ModalRoute.of(context)?.settings.arguments as Article,
 ), ArticleWebView.routeName: (context) => ArticleWebView(
 url: ModalRoute.of(context)?.settings.arguments as String,
 ),
 },
 );
}
}