import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:provider/provider.dart';
import '../providers/makhluk_provider.dart';
import '../providers/theme_provider.dart';
import 'detail_page.dart';
import 'about.dart';
import '../screens/add_makhluk.dart';
import 'donasi.dart';
import 'report.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.username});
  final String username;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedHabitat = 'Pilih Habitat';
  String _selectedCategory = 'All';
  bool _isSorted = false;
  bool _isReverseSorted = false;

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
              Tooltip(
                message: 'Mode Terang/Gelap',
                child: Switch(
                  value: themeProvider.isDarkMode,
                  onChanged: (_) => themeProvider.toggleTheme(),
                ),
              ),
            ],
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (value) {
              if (value == 'refresh') {
                setState(() {
                  _isSorted = false;
                  _isReverseSorted = false;
                });
              } else if (value == 'sort') {
                setState(() {
                  _isSorted = true;
                });
              } else if (value == 'sort_z') {
                setState(() {
                  _isReverseSorted = true;
                  _isSorted = false;
                });
              } else if (value == 'lapor') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Report(username: widget.username),
                  ),
                );
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem(
                value: 'refresh',
                child: Row(
                  children: [
                    Icon(Icons.refresh, size: 20),
                    SizedBox(width: 8),
                    Text('Refresh Data'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'sort',
                child: Row(
                  children: [
                    Icon(Icons.sort, size: 20),
                    SizedBox(width: 8),
                    Text('Urutkan Nama (A-Z)'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'sort_z',
                child: Row(
                  children: [
                    Icon(Icons.sort, size: 20),
                    SizedBox(width: 8),
                    Text('Urutkan Nama (Z-A)'),
                  ],
                ),
              ),
              const PopupMenuItem(
                enabled: false,
                child: Divider(thickness: 1),
              ),
              const PopupMenuItem(
                value: 'lapor',
                child: Row(
                  children: [
                    Icon(Icons.warning, size: 20),
                    SizedBox(width: 8),
                    Text('Laporkan Bug/Masalah'),
                  ],
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
              leading: const Icon(Icons.volunteer_activism),
              title: const Text('Donasi'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => Donasi(username: widget.username,)));
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
          Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Card(
                    color: Theme.of(context).cardColor.withOpacity(0.7),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Pilih Habitat:', style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          DropdownButton<String>(
                            isExpanded: true,
                            value: _selectedHabitat,
                            onChanged: (String? newValue) {
                              setState(() => _selectedHabitat = newValue!);
                            },
                            items: <String>['Pilih Habitat', 'Air Tawar', 'Air Asin', 'All']
                                .map((value) => DropdownMenuItem(value: value, child: Text(value)))
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Card(
                    color: Theme.of(context).cardColor.withOpacity(0.7),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Pilih Kategori:', style: TextStyle(fontWeight: FontWeight.bold)),
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
                  ),
                ],
              ),
            ),
            _selectedHabitat == 'Pilih Habitat'
                ? const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(
                      child: Text(
                        'Silahkan Pilih Habitat',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,),
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
        
                        if (_isSorted) {
                          makhlukList.sort((a, b) => a.nama.compareTo(b.nama));
                        } else if (_isReverseSorted) {
                          makhlukList.sort((a, b) => b.nama.compareTo(a.nama));
                        }
        
                        return GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 1,
                            crossAxisSpacing: 15,
                            childAspectRatio: 2 / 3,
                          ),
                          itemCount: makhlukList.length,
                          itemBuilder: (context, index) {
                            var makhluk = makhlukList[index];
                            return Center(
                              child: SizedBox(
                                width: 280,
                                height: 350,
                                child: Card(
                                  color: Theme.of(context).cardColor.withOpacity(0.7),
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                                        child: Image.network(
                                          makhluk.gambar1,
                                          height: 140,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) {
                                            return const Icon(Icons.broken_image, size: 100, color: Colors.grey);
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              makhluk.nama,
                                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(height: 4),
                                            Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                              decoration: BoxDecoration(
                                                color: const Color.fromARGB(255, 221, 247, 222),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              child: Text(
                                                makhluk.habitat,
                                                style: const TextStyle(fontSize: 15, color: Color.fromARGB(255, 58, 156, 61)),
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Text(makhluk.kategori, style: const TextStyle(fontSize: 15)),
                                            SizedBox(height: 8,),
                                            Text(
                                              makhluk.deskripsi,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Center(
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) => DetailPage(makhluk: makhluk, username: widget.username),
                                              ),
                                            );
                                          },
                                          child: const Text('Selengkapnya'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });}))
          ],
        ),
      ]),
      floatingActionButton: Tooltip(
        message: 'Add Makhluk',
        child: FloatingActionButton(
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
      ),

    );
  }
}
