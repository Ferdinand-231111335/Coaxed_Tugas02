import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'about.dart';
import 'login_screen.dart';
import 'home_page.dart';
import 'donasi.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../providers/profile_provider.dart';
import 'profile_page.dart';

enum JenisMasalah { bug, error, lainnya }

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  final TextEditingController _judulController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();
  DateTime? _selectedDate;
  JenisMasalah? _selectedJenis;

  @override
  void dispose() {
    _judulController.dispose();
    _deskripsiController.dispose();
    super.dispose();
  }

  void _submitReport() {
    final deskripsi = _deskripsiController.text.trim();

    if (_selectedJenis == null || deskripsi.isEmpty || (_selectedJenis == JenisMasalah.lainnya && _judulController.text.trim().isEmpty)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Mohon lengkapi semua data.')),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Laporan berhasil dikirim!')),
    );

    _judulController.clear();
    _deskripsiController.clear();
    setState(() {
      _selectedJenis = null;
      _selectedDate = null;
    });
  }

  Future<void> _pickDate() async {
  final pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now().subtract(const Duration(days: 30)),
    lastDate: DateTime.now(),
  );

  if (pickedDate != null) {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );

    if (pickedTime != null) {
      final combinedDateTime = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );
      setState(() {
        _selectedDate = combinedDateTime;
      });
    }
  }
}


  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final username = Provider.of<ProfileProvider>(context).username;
    final image = Provider.of<ProfileProvider>(context).image;
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        title: const Text("AquaVerse", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    backgroundImage: image != null ? FileImage(image) : null,
                    child: image == null
                        ? const Icon(Icons.person, size: 40, color: Colors.blueGrey)
                        : null,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Aquaverse',
                            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text('Halo, $username!',
                            style: const TextStyle(color: Colors.white70, fontSize: 16)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Beranda'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profil'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProfilePage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Tentang Aplikasi'),
              onTap: () {
                Navigator.pop(context);
                Future.delayed(const Duration(milliseconds: 300), () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => About()));
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.volunteer_activism),
              title: const Text('Donasi'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => Donasi()));
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
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Laporkan Bug / Masalah',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),

                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Theme.of(context).inputDecorationTheme.fillColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Theme.of(context).inputDecorationTheme.enabledBorder?.borderSide.color ?? Colors.grey,
                          ),
                        ),
                        child: Column(
                          children: [
                            const Text('Pilih Jenis Masalah:', style: TextStyle(fontWeight: FontWeight.bold)),
                            CheckboxListTile(
                        title: const Text('Bug'),
                        value: _selectedJenis == JenisMasalah.bug,
                        onChanged: (_) {
                          setState(() {
                            _selectedJenis = JenisMasalah.bug;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: const Text('Error'),
                        value: _selectedJenis == JenisMasalah.error,
                        onChanged: (_) {
                          setState(() {
                            _selectedJenis = JenisMasalah.error;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: const Text('Lainnya'),
                        value: _selectedJenis == JenisMasalah.lainnya,
                        onChanged: (_) {
                          setState(() {
                            _selectedJenis = JenisMasalah.lainnya;
                          });
                        },
                      ),
                      if (_selectedJenis == JenisMasalah.lainnya) ...[
                        const SizedBox(height: 10),
                        TextField(
                          controller: _judulController,
                          decoration: const InputDecoration(
                            labelText: 'Judul Masalah',
                            border: OutlineInputBorder(),
                            filled: true,
                          ),
                        ),
                      ],
                          ],
                        )
                        ),
                      
                      const SizedBox(height: 16),

                      TextField(
                        controller: _deskripsiController,
                        maxLines: 4,
                        decoration: const InputDecoration(
                          labelText: 'Deskripsi Masalah',
                          border: OutlineInputBorder(),
                          filled: true,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).inputDecorationTheme.fillColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Theme.of(context).inputDecorationTheme.enabledBorder?.borderSide.color ?? Colors.grey,
                          ),
                        ),
                        child:  ListTile(
                          title: Text(
                            _selectedDate == null
                                ? 'Pilih Tanggal dan Waktu Terjadi'
                                : 'Tanggal & Waktu: ${DateFormat('dd/MM/yyyy hh:mm a').format(_selectedDate!)}',
                          ),
                          trailing: const Icon(Icons.access_time),
                          onTap: _pickDate,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Center(
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.send),
                          label: const Text('Kirim Laporan'),
                          onPressed: _submitReport,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                            textStyle: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
