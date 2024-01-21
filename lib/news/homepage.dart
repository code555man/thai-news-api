// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, sort_child_properties_last

import 'dart:convert';
// import 'package:best_flutter_ui_templates/introduction_animation/components/mood_diary_vew.dart';
import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:best_flutter_ui_templates/news/news.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<NewsThailand> newsList = [];
  Future<List<NewsThailand>> fetchNews() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=th&category=business&apiKey=0afc839b7c0f47b4b01bfdcdc28cf914'));
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      List<dynamic> articles = responseJson['articles'];
      newsList = articles.map((m) => NewsThailand.fromJson(m)).toList();
      return newsList;
    } else {
      throw Exception('Failed to load news');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 99, 149, 183).withOpacity(0.5),
        centerTitle: true,
        title: Text('Thailand News'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 3),
        child: FutureBuilder(
          future: fetchNews(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(color: Colors.grey),
                          width: double.infinity,
                          height: 200,
                          child: Stack(children: [
                            Container(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  newsList[index].title,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )),
                            Container(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  'ผู้เขียน ${newsList[index].author}',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontStyle: FontStyle.italic),
                                )),
                            Positioned(
                                top: 100,
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${newsList[index].url}',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.blueAccent),
                                  ),
                                  width: 180,
                                  height: 100,
                                  decoration:
                                      BoxDecoration(color: Colors.white),
                                )),
                          ]),
                        )
                      ],
                    ),
                  );
                },
              );
            } else {
              return Text('error');
            }
          },
        ),
      ),
    );
  }
}
