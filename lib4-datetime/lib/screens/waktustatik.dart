import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WaktuStatik extends StatelessWidget {
  const WaktuStatik({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now().toUtc().add(const Duration(hours: 8));
    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Time in Kuala Lumpur'),
      ),
      body: Center(
        child: Text(
          'Current Time in Kuala Lumpur: $formattedDate',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
