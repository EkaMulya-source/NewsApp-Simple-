import 'package:flutter/material.dart';
import 'main.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profile Page'),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Gambar Profil
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/Logo.png'), // Ganti dengan path gambar Anda
                ),
                SizedBox(height: 20),
                
                // Nama Pengguna
                Text(
                  'Arum',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                
                // Email Pengguna
                Text(
                  'arumningrum@example.com',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 20),
                
                // Tombol Edit Profil
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  child: Text('Edit Profil'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

