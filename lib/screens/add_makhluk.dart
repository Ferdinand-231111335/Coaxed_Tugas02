import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/makhluk.dart';
import '../providers/makhluk_provider.dart';

class AddMakhluk extends StatefulWidget {
  const AddMakhluk({super.key});

  @override
  State<AddMakhluk> createState() => _AddMakhlukState();
}

class _AddMakhlukState extends State<AddMakhluk> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _deskripsiController = TextEditingController();
  final _gambar1Controller = TextEditingController();
  final _gambar2Controller = TextEditingController();
  final _statusController = TextEditingController();

  String _habitat = 'Air Tawar';
  String _kategori = 'Hewan';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Makhluk'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const Text('Form Tambah Makhluk Baru',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _namaController,
                  decoration: const InputDecoration(labelText: 'Nama Makhluk'),
                  validator: (value) => value!.isEmpty ? 'Harus diisi' : null,
                ),
                TextFormField(
                  controller: _deskripsiController,
                  decoration: const InputDecoration(labelText: 'Deskripsi'),
                  maxLines: 3,
                  validator: (value) => value!.isEmpty ? 'Harus diisi' : null,
                ),
                TextFormField(
                  controller: _gambar1Controller,
                  decoration: const InputDecoration(labelText: 'URL Gambar 1'),
                ),
                TextFormField(
                  controller: _gambar2Controller,
                  decoration: const InputDecoration(labelText: 'URL Gambar 2'),
                ),
                TextFormField(
                  controller: _statusController,
                  decoration: const InputDecoration(labelText: 'Status'),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: _habitat,
                  items: ['Air Tawar', 'Air Asin']
                      .map((e) =>
                          DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (val) => setState(() => _habitat = val!),
                  decoration: const InputDecoration(labelText: 'Habitat'),
                ),
                DropdownButtonFormField<String>(
                  value: _kategori,
                  items: ['Hewan', 'Tumbuhan']
                      .map((e) =>
                          DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (val) => setState(() => _kategori = val!),
                  decoration: const InputDecoration(labelText: 'Kategori'),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final newMakhluk = Makhluk(
                        nama: _namaController.text,
                        habitat: _habitat,
                        kategori: _kategori,
                        deskripsi: _deskripsiController.text,
                        gambar1: _gambar1Controller.text,
                        gambar2: _gambar2Controller.text,
                        status: _statusController.text,
                      );
                      Provider.of<MakhlukProvider>(context, listen: false)
                          .addMakhluk(newMakhluk);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Makhluk berhasil ditambahkan!'),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.green,
                        ),
                      );

                      Future.delayed(const Duration(milliseconds: 1000), () {
                        Navigator.of(context).pop();
                      });
                    }
                  },
                  icon: const Icon(Icons.save),
                  label: const Text('Simpan Makhluk'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
