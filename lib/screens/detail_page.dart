import 'package:flutter/material.dart';
import 'home_page.dart';
import '../models/makhluk.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import 'about.dart';
import 'login_screen.dart';
import 'donasi.dart';

class DetailPage extends StatelessWidget {
  final Makhluk makhluk;
  final String username;
  const DetailPage({super.key, required this.makhluk, required this.username});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dukung Kami', style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          Row(
            children: [
              Icon(themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode),
              Tooltip(
                message: 'Mode Terang/Gelap',
                child: Switch(
                  value: themeProvider.isDarkMode,
                  onChanged: (_) => themeProvider.toggleTheme(),
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Aquaverse', style: TextStyle(color: Colors.white, fontSize: 24)),
                  const SizedBox(height: 10),
                  Text(
                    'Halo, $username!',
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Beranda'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) =>  HomePage(username: username)));
              }
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Tentang Aplikasi'),
              onTap: () {
                Navigator.pop(context);
                Future.delayed(const Duration(milliseconds: 300), () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) =>  About(username: username)));
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.volunteer_activism),
              title: const Text('Donasi'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => Donasi(username: username)));
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Keluar'),
              onTap: () async {
                final shouldLogout = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Konfirmasi'),
                    content: const Text('Apakah kamu yakin ingin keluar?'),
                    actions: [
                      TextButton(
                        child: const Text('Batal'),
                        onPressed: () => Navigator.pop(context, false),
                      ),
                      TextButton(
                        child: const Text('Ya, Keluar'),
                        onPressed: () => Navigator.pop(context, true),
                      ),
                    ],
                  ),
                );

                if (shouldLogout == true) {
                  Navigator.pop(context);
                  Future.delayed(const Duration(milliseconds: 300), () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                      (route) => false,
                    );
                  });
                }
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'lib/assets/Wallpaper Aquaverse.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
          child: Column(
            children: [
              Image.network(makhluk.gambar1, errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.broken_image, size: 100, color: Colors.grey);
              },),
              SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Theme.of(context).inputDecorationTheme.enabledBorder?.borderSide.color ?? Colors.grey,
                    ),
                  ),
                child: Column(
                  children: [
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
                  ],
                )
              ),
              SizedBox(height: 20),
              Image.network(makhluk.gambar2, errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.broken_image, size: 100, color: Colors.grey);
              },),
            ],
          ),
        ),
      ]),
    );
  }
}
