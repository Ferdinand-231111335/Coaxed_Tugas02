import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:country_picker/country_picker.dart';
import '../providers/profile_provider.dart';

class EditProfile extends StatefulWidget {
  final String username;
  final String? currentImagePath;

  const EditProfile({
    super.key,
    required this.username,
    this.currentImagePath,
  });

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late TextEditingController _usernameController;
  File? _imageFile;
  Country? _selectedCountry;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController(text: widget.username);

    if (widget.currentImagePath != null) {
      _imageFile = File(widget.currentImagePath!);
    }

    final profileProvider = Provider.of<ProfileProvider>(context, listen: false);
    _selectedCountry = profileProvider.country;
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  void _showCountryPicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      onSelect: (Country country) {
        setState(() {
          _selectedCountry = country;
        });
      },
    );
  }

  void _saveChanges() {
    final profileProvider = Provider.of<ProfileProvider>(context, listen: false);

    profileProvider.setUsername(_usernameController.text);
    if (_imageFile != null) {
      profileProvider.setImage(_imageFile!);
    }
    if (_selectedCountry != null) {
      profileProvider.setCountry(_selectedCountry!);
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profil berhasil diperbarui!')),
    );

    Navigator.pop(context);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profil'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: _imageFile != null ? FileImage(_imageFile!) : null,
                    child: _imageFile == null
                        ? const Icon(Icons.person, size: 60, color: Colors.white)
                        : null,
                  ),
                  const Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.black54,
                      radius: 20,
                      child: Icon(Icons.camera_alt, size: 20, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(height: 20),
            _selectedCountry == null
                ? const Text('Belum memilih negara')
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(_selectedCountry!.flagEmoji, style: const TextStyle(fontSize: 32)),
                      const SizedBox(width: 8),
                      Text('${_selectedCountry!.name} (+${_selectedCountry!.phoneCode})'),
                    ],
                  ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: _showCountryPicker,
              icon: const Icon(Icons.flag),
              label: const Text("Pilih Negara"),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              icon: const Icon(Icons.save),
              label: const Text('Simpan Perubahan'),
              onPressed: _saveChanges,
            ),
          ],
        ),
      ),
    );
  }
}
