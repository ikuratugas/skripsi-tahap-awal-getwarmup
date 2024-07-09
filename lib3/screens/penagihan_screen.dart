import 'package:dataxfirebase/providers/pelangganprovider.dart';
import 'package:dataxfirebase/screens/belum_screen.dart';
import 'package:dataxfirebase/screens/done_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PenagihanScreen extends StatelessWidget {
  const PenagihanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(tabs: [
            Tab(
                icon: Text(
              "Belum Selesai",
              style: TextStyle(fontSize: 12),
            )),
            Tab(
                icon: Text(
              "Selesai",
              style: TextStyle(fontSize: 12),
            )),
          ]),
        ),
        body: const TabBarView(children: [
          BelumSelesaiTab(),
          SelesaiTab(),
        ]),
      ),
    );
  }
}

class BelumSelesaiTab extends StatelessWidget {
  const BelumSelesaiTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search Belum Selesai...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onChanged: (query) {
              Provider.of<PelangganProvider>(context, listen: false)
                  .filterNama(query);
            },
          ),
        ),
        const Expanded(
          child: Center(
            child: BelumScreen(),
          ),
        ),
      ],
    );
  }
}

class SelesaiTab extends StatelessWidget {
  const SelesaiTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search Selesai...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onChanged: (query) {
              Provider.of<PelangganProvider>(context, listen: false)
                  .filterNama(query);
            },
          ),
        ),
        const Expanded(
          child: Center(
            child: DoneScreen(),
          ),
        ),
      ],
    );
  }
}
