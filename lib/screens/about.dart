import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'home_page.dart';
import '../providers/theme_provider.dart';

class About extends StatefulWidget {
  const About({super.key, required this.username});
  final String username;
  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "AquaVerse",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          Row(
            children: [
              Icon(themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode),
              Switch(
                value: themeProvider.isDarkMode,
                onChanged: (_) => themeProvider.toggleTheme(),
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
                    'Halo, ${widget.username}!',
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Beranda'),
              onTap: () {
                Future.delayed(const Duration(milliseconds: 300), () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomePage(username: widget.username,)));
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Tentang Aplikasi'),
              onTap: () {
                Future.delayed(const Duration(milliseconds: 300), () {
                Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Keluar'),
              onTap: () {
                Future.delayed(const Duration(milliseconds: 300), () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
                });
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Image.network(
                'https://static.vecteezy.com/system/resources/previews/014/630/917/non_2x/blue-water-wave-line-icon-in-the-sea-free-png.png',
                height: 150,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Tentang AquaVerse',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'AquaVerse adalah aplikasi edukatif yang dibuat untuk meningkatkan kesadaran dan pengetahuan '
              'tentang keberagaman makhluk air, baik hewan maupun tumbuhan. '
              'Aplikasi ini dikembangkan oleh tim yang peduli terhadap lingkungan, '
              'khususnya ekosistem perairan yang semakin terancam oleh aktivitas manusia.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16),
            const Text(
              'Tujuan utama AquaVerse adalah memberikan informasi yang menarik tentang '
              'makhluk air dari berbagai habitat seperti air tawar dan air asin, '
              'serta status kepunahan makhluk air. '
              'Aplikasi ini juga bertujuan untuk menjadi media pembelajaran bagi pelajar, guru, dan '
              'masyarakat umum dalam memahami pentingnya menjaga kelestarian air dan makhluk di dalamnya.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 50,),
            const Text(
              'Salam dari kami, Coaxed',
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
