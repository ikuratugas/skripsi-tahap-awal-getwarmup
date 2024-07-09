import 'package:dataxfirebase/providers/pelangganprovider.dart';
import 'package:flutter/material.dart';

class InputTambahProvider extends ChangeNotifier {
  late final PelangganProvider pelangganProvider;
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
