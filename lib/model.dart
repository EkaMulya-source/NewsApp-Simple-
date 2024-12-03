import 'package:flutter/material.dart';
import 'dart:convert';
import 'discovery.dart';
import 'detailpage.dart';
import 'login.dart';
import 'profil.dart';
import 'package:http/http.dart' as http;

import 'service.dart';

// Model Class
class NewsArticle {
  final String? title;
  final String? description;
  final String? urlToImage;
  final String? content;
  final String? sourceName;

  NewsArticle({
    this.title,
    this.description,
    this.urlToImage,
    this.content,
    this.sourceName,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'],
      description: json['description'],
      urlToImage: json['urlToImage'],
      content: json['content'],
      sourceName: json['source']['name'],
    );
  }
}

class NewsArticleApple {
  final String? title;
  final String? description;
  final String? urlToImage;
  final String? content;
  final String? sourceName;

  NewsArticleApple({
    this.title,
    this.description,
    this.urlToImage,
    this.content,
    this.sourceName,
  });

  factory NewsArticleApple.fromJson(Map<String, dynamic> json) {
    return NewsArticleApple(
      title: json['title'],
      description: json['description'],
      urlToImage: json['urlToImage'],
      content: json['content'],
      sourceName: json['source']['name'],
    );
  }
}

class NewsArticleBisnis {
  final String? title;
  final String? description;
  final String? urlToImage;
  final String? content;
  final String? sourceName;

  NewsArticleBisnis({
    this.title,
    this.description,
    this.urlToImage,
    this.content,
    this.sourceName,
  });

  factory NewsArticleBisnis.fromJson(Map<String, dynamic> json) {
    return NewsArticleBisnis(
      title: json['title'],
      description: json['description'],
      urlToImage: json['urlToImage'],
      content: json['content'],
      sourceName: json['source']['name'],
    );
  }
}

class NewsArticleTech {
  final String? title;
  final String? description;
  final String? urlToImage;
  final String? content;
  final String? sourceName;

  NewsArticleTech({
    this.title,
    this.description,
    this.urlToImage,
    this.content,
    this.sourceName,
  });

  factory NewsArticleTech.fromJson(Map<String, dynamic> json) {
    return NewsArticleTech(
      title: json['title'],
      description: json['description'],
      urlToImage: json['urlToImage'],
      content: json['content'],
      sourceName: json['source']['name'],
    );
  }
}

class NewsArticleWall {
  final String? title;
  final String? description;
  final String? urlToImage;
  final String? content;
  final String? sourceName;

  NewsArticleWall({
    this.title,
    this.description,
    this.urlToImage,
    this.content,
    this.sourceName,
  });

  factory NewsArticleWall.fromJson(Map<String, dynamic> json) {
    return NewsArticleWall(
      title: json['title'],
      description: json['description'],
      urlToImage: json['urlToImage'],
      content: json['content'],
      sourceName: json['source']['name'],
    );
  }
}