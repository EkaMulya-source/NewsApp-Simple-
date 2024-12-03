import 'package:flutter/material.dart';
import 'main.dart';
import 'model.dart';
import 'service.dart';
import 'techdetail.dart';

class DetailPage extends StatefulWidget {
  final Map<String, dynamic> article;

  DetailPage({required this.article});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Article Detail'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image for the article
              if (widget.article['urlToImage'] != null)
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16), // Rounded corners for the image
                    image: DecorationImage(
                      image: NetworkImage(widget.article['urlToImage']), // Image from API
                      fit: BoxFit.cover, // Ensures the image covers the entire container
                    ),
                  ),
                ),
              SizedBox(height: 16),
              // Article headline
              Text(
                widget.article['title'] ?? 'No Title',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              // Article metadata (source and time)
              Text(
                '${widget.article['source']['name']} - ${widget.article['publishedAt']}',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 16),
              // Article content preview
              Text(
                widget.article['content'] ?? 'No Content Available',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Existing classes: DiscoverPage, LoginPage, NewsDetailPage, etc., remain unchanged
class NewsDetailPage extends StatelessWidget {
  final NewsArticle article;

  NewsDetailPage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title ?? 'Article Detail'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (article.urlToImage != null && article.urlToImage!.isNotEmpty)
                Image.network(article.urlToImage!),
              SizedBox(height: 16),
              Text(
                article.title ?? 'No Title',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                article.sourceName ?? 'Unknown Source',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 16),
              Text(
                article.content ?? 'No Content Available',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Existing classes: DiscoverPage, LoginPage, etc., remain unchanged
