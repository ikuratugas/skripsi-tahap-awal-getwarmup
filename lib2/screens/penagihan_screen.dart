import 'package:dataxfirebase/screens/belum_screen.dart';
import 'package:dataxfirebase/screens/done_screen.dart';
import 'package:flutter/material.dart';

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

class BelumSelesaiTab extends StatefulWidget {
  const BelumSelesaiTab({super.key});

  @override
  _BelumSelesaiTabState createState() => _BelumSelesaiTabState();
}

class _BelumSelesaiTabState extends State<BelumSelesaiTab> {
  String searchQuery = '';

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
              setState(() {
                searchQuery = query;
              });
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

class SelesaiTab extends StatefulWidget {
  const SelesaiTab({super.key});

  @override
  _SelesaiTabState createState() => _SelesaiTabState();
}

class _SelesaiTabState extends State<SelesaiTab> {
  String searchQuery = '';

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
              setState(() {
                searchQuery = query;
              });
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
