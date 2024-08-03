import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serius_mode/providers/exp/exp_provider.dart';

class ExpScreen extends StatelessWidget {
  const ExpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ExpProvider>(builder: (_, expProvider, child) {
        return const Center(child: Text("coba saja dulu"));
      }),
    );
  }
}
