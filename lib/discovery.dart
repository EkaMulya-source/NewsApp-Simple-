import 'package:flutter/material.dart';
import 'main.dart';
import 'service.dart';
import 'model.dart';
import 'detailpage.dart';

class DiscoverPage extends StatefulWidget {
  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {

  List<NewsArticle> newsList = [];
  

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  Future<void> fetchNews() async {
    try {
      final news = await NewsService().fetchNews();
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
        title: Text('Discover'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search bar for discovering news
            TextField(
              decoration: InputDecoration(
                hintText: 'Search news...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
              ),
            ),
            SizedBox(height: 16),
            // Category filter chips
            Container(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal, // Horizontal scrolling for filter chips
                children: [
                  ChoiceChip(label: Text('All'), selected: true), // All filter chip (selected by default)
                  SizedBox(width: 8),
                  ChoiceChip(label: Text('Politics'), selected: false), // Politics filter chip
                  SizedBox(width: 8),
                  ChoiceChip(label: Text('Sports'), selected: false), // Sports filter chip
                  SizedBox(width: 8),
                  ChoiceChip(label: Text('Education'), selected: false), // Education filter chip
                ],
              ),
            ),

            SizedBox(height: 16),
            // Grid view for displaying news articles
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two items per row
                  crossAxisSpacing: 16, // Space between columns
                  mainAxisSpacing: 16, // Space between rows
                ),
                itemCount: 6, // Number of news articles in the grid
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16), // Rounded corners for each news item
                      image: DecorationImage(
                        image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3GAhygMxBP1NZqhHF7uXRvXx3L-k_lmSlrfnzqeHoTIvEuj3TyH9JmHIVB7aAUC539Ck&usqp=CAU'),
                        fit: BoxFit.cover, // Ensures the image covers the entire container
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'News Headline', // Placeholder headline text
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
          
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


