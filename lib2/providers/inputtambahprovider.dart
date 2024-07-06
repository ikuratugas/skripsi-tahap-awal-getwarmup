import 'package:flutter/material.dart';

class InputTambahProvider extends ChangeNotifier {
  String name = '';
  double phone = 0;
  String address = '';

  void updateName(String newName) {
    name = newName;
    notifyListeners();
  }

  void updatePhone(double newPhone) {
    phone = newPhone;
    notifyListeners();
  }

  void updateAddress(String newAddress) {
    address = newAddress;
    notifyListeners();
  }
}
