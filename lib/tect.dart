import 'package:flutter/material.dart';
import 'dart:convert';
import 'discovery.dart';
import 'detailpage.dart';
import 'login.dart';
import 'profil.dart';
import 'package:http/http.dart' as http;

import 'main.dart';
import 'model.dart';
import 'service.dart';
import 'detailtec.dart';
import 'techdetail.dart';
import 'detailbisnis.dart';

class MyWidgetTech extends StatefulWidget {
  const MyWidgetTech({super.key});

  @override
  State<MyWidgetTech> createState() => _MyWidgetTechState();
}

class _MyWidgetTechState extends State<MyWidgetTech> {

  List<NewsArticleTech> newsList = [];

  @override
  void initState() {
    super.initState();
    fetchNewsTech();
  }

  Future<void> fetchNewsTech() async {
    try {
      final news = await NewsServiceTech().fetchNewsTech();
      setState(() {
        newsList = news;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load news')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.pushNamed(context, '/pencarian');
              }),
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: newsList.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    padding: EdgeInsets.all(16.0),
                    itemCount: newsList.length,
                    itemBuilder: (context, index) {
                      var article = newsList[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsDetailTechCruch(
                                article: article,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 16.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image: article.urlToImage != null
                                ? DecorationImage(
                                    image: NetworkImage(article.urlToImage!),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                            color: article.urlToImage == null ? Colors.grey : null,
                          ),
                          height: 200,
                          child: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Chip(
                                  label: Text(
                                    article.sourceName ?? 'Unknown',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.blue,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  article.title ?? '',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  article.description ?? '',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmark',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/home');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/profile');
          }
        },
      ),
    );
  }
}


