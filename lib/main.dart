import 'package:flutter/material.dart';
import 'dart:convert';
import 'discovery.dart';
import 'detailpage.dart';
import 'login.dart';
import 'profil.dart';
import 'apple.dart';
import 'detailtec.dart';
import 'bisnis.dart';
import 'detailbisnis.dart';
import 'tect.dart';
import 'techdetail.dart';
import 'indo.dart';
import 'indodetail.dart';
import 'package:http/http.dart' as http;


import 'model.dart';
import 'service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/profile': (context) => ProfilePage(),
        // '/politic': (context) => DetailPage(category: 'politic'),
        // '/economic': (context) => DetailPage(category: 'economic'),
        // '/lifestyle': (context) => DetailPage(category: 'lifestyle'),
        // '/sports': (context) => DetailPage(category: 'sports'),
        '/pencarian': (context) => DiscoverPage(),
        '/teknology': (context) => MyWidget(),
        '/bisnis' : (context) => MyWidgetBisnis(),
        '/techcruch' : (context) => MyWidgetTech(),
        '/indo' : (context) => MyWidgetWall(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<NewsArticle> newsList = [];
  List<NewsArticleBisnis> newsList2 = [];
  

  @override
  void initState() {
    super.initState();
    fetchNews();
    fetchNewsBisnis();
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

  Future<void> fetchNewsBisnis() async {
    try {
      final news = await NewsServiceBussines().fetchNewsBisnis();
      setState(() {
        newsList2 = news;
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

          Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),

         Expanded(
          child: FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: 0.5, // Mengambil 50% dari lebar
            child: newsList.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    scrollDirection: Axis.horizontal, // Menambahkan scrollDirection horizontal
                    padding: EdgeInsets.all(16.0),
                    itemCount: 1, // Hanya ada 1 item yaitu row dengan tombol
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start, // Menyusun tombol di kiri
                        children: [
                          // Tombol pertama
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0), // Jarak antar tombol
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/teknology');
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(120, 50), // Ukuran tombol
                              ),
                              child: const Text('Technology'),
                            ),
                          ),
                          // Tombol kedua
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0), // Jarak antar tombol
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/bisnis');
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(120, 50), // Ukuran tombol
                              ),
                              child: const Text('Business'),
                            ),
                          ),
                          // Tombol ketiga
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0), // Jarak antar tombol
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/techcruch');
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(120, 50), // Ukuran tombol
                              ),
                              child: const Text('Tech Crunch'),
                            ),
                          ),
                          // Tombol keempat
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0), // Jarak antar tombol
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/indo');
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(120, 50), // Ukuran tombol
                              ),
                              child: const Text('Street Wall'),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
          ),
         ),

          Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0), // Memberi padding pada teks
              child: Text(
                'Breaking News', // Teks yang ingin ditampilkan di atas
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ]
          ),

          Expanded(
                  child: newsList2.isEmpty
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          scrollDirection: Axis.horizontal, // Menambahkan scrollDirection horizontal
                          padding: EdgeInsets.all(16.0),
                          itemCount: newsList2.length,
                          itemBuilder: (context, index) {
                            var article = newsList2[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NewsDetailBussines(
                                      article: article,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 16.0), // Margin horizontal
                                width: 200,// Lebar setiap item
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
                                      
                                      SizedBox(height: 8),
                                      Text(
                                        article.title ?? '',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
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

            Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Memberi padding pada teks
                          child: Text(
                            'Viral News', // Teks yang ingin ditampilkan di atas
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ]
                      ),

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
                              builder: (context) => NewsDetailPage(
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





