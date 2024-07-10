import 'package:dataxbulan/providers/pelangganprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PelangganProvider>(
      builder: (context, value, child) {
        return const Scaffold(
          body: Center(
            child: Text("Selamat datang kembali"),
          ),
        );
      },
    );
  }
}
