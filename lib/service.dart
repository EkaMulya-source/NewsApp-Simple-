import 'package:flutter/material.dart';
import 'dart:convert';
import 'discovery.dart';
import 'detailpage.dart';
import 'login.dart';
import 'profil.dart';
import 'package:http/http.dart' as http;
import 'model.dart';
import 'service.dart';

// Service Class
class NewsService {
  final String _baseUrl = 'https://newsapi.org/v2/everything?q=tesla&from=2024-11-03&sortBy=publishedAt&apiKey=8de7e983dc084b1a86efb5e021393253';

  Future<List<NewsArticle>> fetchNews() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body)['articles'];
      return body.map((dynamic item) => NewsArticle.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}

class NewsServiceApple {
  final String _baseUrl = 'https://newsapi.org/v2/everything?q=apple&from=2024-12-02&to=2024-12-02&sortBy=popularity&apiKey=8de7e983dc084b1a86efb5e021393253';

  Future<List<NewsArticleApple>> fetchNewsApple() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body)['articles'];
      return body.map((dynamic item) => NewsArticleApple.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}

class NewsServiceBussines {
  final String _baseUrl = 'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=8de7e983dc084b1a86efb5e021393253';

  Future<List<NewsArticleBisnis>> fetchNewsBisnis() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body)['articles'];
      return body.map((dynamic item) => NewsArticleBisnis.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}

class NewsServiceTech {
  final String _baseUrl = 'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=8de7e983dc084b1a86efb5e021393253';

  Future<List<NewsArticleTech>> fetchNewsTech() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body)['articles'];
      return body.map((dynamic item) => NewsArticleTech.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}

class NewsServiceWall {
  final String _baseUrl = 'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=8de7e983dc084b1a86efb5e021393253';

  Future<List<NewsArticleWall>> fetchNewsWall() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body)['articles'];
      return body.map((dynamic item) => NewsArticleWall.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}
