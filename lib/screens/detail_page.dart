import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_page.dart';
import '../models/makhluk.dart';


class DetailPage extends StatelessWidget {
  final Makhluk makhluk;
  final String username;
  const DetailPage({super.key, required this.makhluk, required this.username});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(makhluk.nama),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            tooltip: 'Kembali ke Home',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage(username: username)),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(makhluk.gambar1, errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.broken_image, size: 100, color: Colors.grey);
            },),
            SizedBox(height: 15),
            Text(makhluk.nama, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text('Habitat: ${makhluk.habitat}', style: TextStyle(fontSize: 18)),
            Text('Kategori: ${makhluk.kategori}', style: TextStyle(fontSize: 18)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(makhluk.deskripsi),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Status: ${makhluk.status}', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 20),
            Image.network(makhluk.gambar2, errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.broken_image, size: 100, color: Colors.grey);
            },),
          ],
        ),
      ),
    );
  }
}
