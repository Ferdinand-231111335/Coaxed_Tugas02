import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:provider/provider.dart';
import '../providers/makhluk_provider.dart';
import '../providers/theme_provider.dart';
import 'detail_page.dart';
import 'about.dart';
import '../screens/add_makhluk.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.username});
  final String username;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedHabitat = 'Pilih Habitat';
  String _selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("AquaVerse", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
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
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Tentang Aplikasi'),
              onTap: () {
                Navigator.pop(context);
                Future.delayed(const Duration(milliseconds: 300), () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) =>  About(username: widget.username)));
                });
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Pilih Habitat:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                DropdownButton<String>(
                  value: _selectedHabitat,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedHabitat = newValue!;
                    });
                  },
                  items: <String>['Pilih Habitat', 'Air Tawar', 'Air Asin', 'All']
                      .map<DropdownMenuItem<String>>((value) => DropdownMenuItem(value: value, child: Text(value)))
                      .toList(),
                ),
                const SizedBox(height: 16),
                const Text('Pilih Kategori:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        title: const Text('Hewan'),
                        value: 'Hewan',
                        groupValue: _selectedCategory,
                        onChanged: (value) => setState(() => _selectedCategory = value!),
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        title: const Text('Tumbuhan'),
                        value: 'Tumbuhan',
                        groupValue: _selectedCategory,
                        onChanged: (value) => setState(() => _selectedCategory = value!),
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        title: const Text('All'),
                        value: 'All',
                        groupValue: _selectedCategory,
                        onChanged: (value) => setState(() => _selectedCategory = value!),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(color: Colors.blueAccent),
          _selectedHabitat == 'Pilih Habitat'
              ? const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      'Silahkan Pilih Habitat',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
                    ),
                  ),
                )
              : Expanded(
                  child: Consumer<MakhlukProvider>(
                    builder: (context, makhlukProvider, _) {
                      List makhlukList = [];

                      if (_selectedHabitat == 'Air Tawar') {
                        makhlukList = makhlukProvider.makhlukAirTawar;
                      } else if (_selectedHabitat == 'Air Asin') {
                        makhlukList = makhlukProvider.makhlukAirAsin;
                      } else if (_selectedHabitat == 'All') {
                        makhlukList = [
                          ...makhlukProvider.makhlukAirTawar,
                          ...makhlukProvider.makhlukAirAsin
                        ];
                      }

                      if (_selectedCategory != 'All') {
                        makhlukList = makhlukList
                            .where((makhluk) => makhluk.kategori == _selectedCategory)
                            .toList();
                      }

                      return GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                        ),
                        itemCount: makhlukList.length,
                        itemBuilder: (context, index) {
                          var makhluk = makhlukList[index];
                          return Card(
                            child: Column(
                              children: [
                                const SizedBox(height: 10),
                                Image.network(makhluk.gambar1, height: 120, width: 230, fit: BoxFit.fill, 
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.broken_image, size: 100, color: Colors.grey);
                                },),
                                const SizedBox(height: 15),
                                Text(makhluk.nama, style: const TextStyle(fontWeight: FontWeight.bold)),
                                Text(makhluk.habitat),
                                Text('(${makhluk.kategori})'),
                                const SizedBox(height: 15),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => DetailPage(makhluk: makhluk, username: widget.username,),
                                      ),
                                    );
                                  },
                                  child: const Text('Selengkapnya'),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (_) => const AddMakhluk(),
          );
        },
      ),

    );
  }
}
