import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:country_picker/country_picker.dart';

class ProfileProvider with ChangeNotifier {
  String _username = '';
  File? _image;
  Country? _country;

  String get username => _username;
  Country? get country => _country;
  File? get image => _image;

  void setUsername(String username) {
    _username = username;
    notifyListeners();
  }

  void setImage(File? image) {
    _image = image;
    notifyListeners();
  }

  void setCountry(Country country) {
   _country = country;
    notifyListeners();
  }
}
