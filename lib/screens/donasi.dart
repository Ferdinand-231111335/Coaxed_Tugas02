import 'package:flutter/material.dart';
import 'home_page.dart';
import 'about.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import '../providers/theme_provider.dart';
import 'package:provider/provider.dart';

class Donasi extends StatefulWidget {
  const Donasi({super.key, required this.username});
  final String username;

  @override
  State<Donasi> createState() => _DonasiState();
}

class _DonasiState extends State<Donasi> {
  
  final TextEditingController _nominalController = TextEditingController();
  double _nominal = 10000;

  @override
  void initState() {
    super.initState();
    _nominalController.text = _nominal.toInt().toString();
  }

  void _updateNominalFromText(String value) {
    final parsed = double.tryParse(value.replaceAll(',', ''));
    if (parsed != null && parsed >= 1000) {
      setState(() {
        _nominal = parsed.clamp(1000, 1000000);
      });
    }
  }

  @override
  void dispose() {
    _nominalController.dispose();
    super.dispose();
  }

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
                    'Halo, ${widget.username}!',
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Beranda'),
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => HomePage(username: widget.username)),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Tentang Aplikasi'),
              onTap: () {
                Navigator.pop(context);
                Future.delayed(const Duration(milliseconds: 300), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => About(username: widget.username)),
                  );
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.volunteer_activism),
              title: const Text('Donasi'),
              onTap: () => Navigator.pop(context),
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
      body: SizedBox.expand(
  child: Stack(
    children: [
      Positioned.fill(
        child: Image.asset(
          'lib/assets/Wallpaper Aquaverse.jpg',
          fit: BoxFit.cover,
        ),
      ),
      SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                    const Text(
                      'Bantu kami mengembangkan AquaVerse!',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Donasimu akan sangat berarti dalam pengembangan fitur baru, pemeliharaan aplikasi, dan biaya server.'
                    ),
                    
                  ],
                ),
              ),
              const SizedBox(height: 20),
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
                    const Text(
                      'Masukkan nominal donasi:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _nominalController,
                      keyboardType: TextInputType.number,
                      onChanged: _updateNominalFromText,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixText: 'Rp ',
                        hintText: 'Minimal Rp 1.000',
                        filled: true,
                      ),
                    ),

                    const SizedBox(height: 16),
                    Slider(
                      value: _nominal,
                      min: 1000,
                      max: 1000000,
                      divisions: 199,
                      label: 'Rp ${_nominal.toInt()}',
                      onChanged: (value) {
                        setState(() {
                          _nominal = value;
                          _nominalController.text = value.toInt().toString();
                        });
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Rp 1.000', style: TextStyle(fontSize: 12)),
                        Text('Rp 1.000.000', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
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
                    const Text(
                      'Donasi melalui:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    ListTile(
                      tileColor: Theme.of(context).cardColor.withOpacity(0.8),
                      leading: const Icon(Icons.qr_code),
                      title: const Text('QRIS / Dompet Digital'),
                      subtitle: Text('Nominal: Rp ${_nominal.toInt()}'),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Scan QR Donasi'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.network(
                                  'https://www.researchgate.net/publication/340906030/figure/fig1/AS:884016483954690@1587777362630/Gambar-1-Kode-QR-Data-yang-dikodekan-ini-dapat-didecode-dengan-memindai-barcode.ppm',
                                  height: 200,
                                ),
                                const SizedBox(height: 10),
                                Text('Rp ${_nominal.toInt()}', style: const TextStyle(fontWeight: FontWeight.bold)),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('Batal'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text('Donasi anda sejumlah Rp ${_nominal.toInt()} sudah kami terima! Terima kasih banyak!'),
                                            duration: const Duration(seconds: 3),
                                          ),
                                        );
                                      },
                                      child: const Text('Done'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    ],
  ),
),
    );}}