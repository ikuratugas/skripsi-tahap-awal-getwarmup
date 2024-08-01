import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serius_mode/providers/pelangganprovider.dart';

class TagihanViewScreen extends StatelessWidget {
  const TagihanViewScreen({super.key});

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
  // ignore: library_private_types_in_public_api
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
              Provider.of<PelangganProvider>(context, listen: false)
                  .filterPelanggan(searchQuery);
            },
          ),
        ),
        Expanded(
          child: Consumer<PelangganProvider>(
            builder: (context, pelangganProvider, child) {
              final filteredPelanggan =
                  pelangganProvider.getFilteredPelanggan();
              return ListView.builder(
                itemCount: filteredPelanggan.length,
                itemBuilder: (context, index) {
                  final pelanggan = filteredPelanggan[index];
                  final currentMonthTagihan =
                      pelangganProvider.getTagihanBulananBelumBayar(pelanggan);
                  if (currentMonthTagihan.isEmpty) {
                    return const SizedBox.shrink();
                  }
                  return Dismissible(
                    key: Key(pelanggan.uuid!),
                    direction: DismissDirection.startToEnd,
                    confirmDismiss: (direction) async {
                      return await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Confirm"),
                            content: const Text(
                                "Are you sure you want to delete this item?"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                                child: const Text("No"),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                },
                                child: const Text("Yes"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    onDismissed: (direction) {
                      pelangganProvider.updateSudahBayar(pelanggan);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("${pelanggan.nama} dismissed")),
                      );
                    },
                    background: Container(
                        color: Colors.green,
                        child: const Icon(Icons.done, color: Colors.white)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            pelanggan.nama,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: currentMonthTagihan.length,
                          itemBuilder: (context, billIndex) {
                            final bill = currentMonthTagihan[billIndex];
                            final tampilTanggal = bill.jatuhTempo.toDate();
                            String formattedDate =
                                '${tampilTanggal.year.toString().padLeft(4, '0')}-'
                                '${tampilTanggal.month.toString().padLeft(2, '0')}-'
                                '${tampilTanggal.day.toString().padLeft(2, '0')}';
                            return ListTile(
                              title: Text(
                                'Jatuh Tempo: $formattedDate',
                              ),
                              subtitle: Text("Status: ${bill.sudahBayar}"),
                            );
                          },
                        ),
                        const Divider(),
                      ],
                    ),
                  );
                },
              );
            },
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
              Provider.of<PelangganProvider>(context, listen: false)
                  .filterPelanggan(searchQuery);
            },
          ),
        ),
        Expanded(
          child: Consumer<PelangganProvider>(
            builder: (context, pelangganProvider, child) {
              final filteredPelanggan =
                  pelangganProvider.getFilteredPelanggan();
              return ListView.builder(
                itemCount: filteredPelanggan.length,
                itemBuilder: (context, index) {
                  final pelanggan = filteredPelanggan[index];
                  final currentMonthTagihan =
                      pelangganProvider.getTagihanBulananSudahBayar(pelanggan);
                  if (currentMonthTagihan.isEmpty) {
                    return const SizedBox.shrink();
                  }
                  return Dismissible(
                    key: Key(pelanggan.uuid!),
                    direction: DismissDirection.endToStart,
                    confirmDismiss: (direction) async {
                      return await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Confirm"),
                            content: const Text(
                                "Are you sure you want to delete this item?"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                                child: const Text("No"),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                },
                                child: const Text("Yes"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    onDismissed: (direction) {
                      pelangganProvider.updateKeBelumBayar(pelanggan);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("${pelanggan.nama} dismissed")),
                      );
                    },
                    background: Container(
                        color: Colors.red,
                        child: const Icon(Icons.delete, color: Colors.white)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            pelanggan.nama,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: currentMonthTagihan.length,
                          itemBuilder: (context, billIndex) {
                            final bill = currentMonthTagihan[billIndex];
                            final tampilTanggal = bill.jatuhTempo.toDate();
                            String formattedDate =
                                '${tampilTanggal.year.toString().padLeft(4, '0')}-'
                                '${tampilTanggal.month.toString().padLeft(2, '0')}-'
                                '${tampilTanggal.day.toString().padLeft(2, '0')}';
                            return ListTile(
                              title: Text(
                                'Jatuh Tempo: $formattedDate',
                              ),
                              subtitle: Text("Status: ${bill.sudahBayar}"),
                            );
                          },
                        ),
                        const Divider(),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
