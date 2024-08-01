import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serius_mode/models/pelanggan.dart';
import 'package:serius_mode/providers/pelangganprovider.dart';
import 'package:serius_mode/screens/user/userdetail_screen.dart';

class UserHomeScreen extends StatelessWidget {
  final Pelanggan pelanggan;
  const UserHomeScreen({required this.pelanggan, super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController isiChat = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          UserDetailScreen(pelanggan: pelanggan),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(40.0),
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 180, 255, 180),
                          Color.fromARGB(255, 190, 225, 190),
                        ],
                      ),
                    ),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runAlignment: WrapAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Detail Transaksi",
                          style: TextStyle(fontSize: 22.0),
                        ),
                        const SizedBox(
                          width: 30.0,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.account_balance_wallet),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Consumer<PelangganProvider>(
                        builder: (_, pelangganProvider, child) => Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 1,
                            height: MediaQuery.of(context).size.height * 0.9,
                            child: SimpleDialog(
                              contentPadding: const EdgeInsets.all(20),
                              children: <Widget>[
                                TextField(
                                  controller: isiChat,
                                  maxLines: 3,
                                  decoration: const InputDecoration(
                                    hintText:
                                        'Masukan Pesan, permintaan atau keluhan',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Add your onPressed code here!
                                      pelangganProvider.addChat(
                                          pelanggan.nama, isiChat.text);
                                      isiChat.clear();
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Kirim'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(40.0),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 190, 225, 190),
                          Color.fromARGB(255, 180, 255, 180),
                        ],
                      ),
                    ),
                    child: const Wrap(
                      children: [
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "Masukan",
                          style: TextStyle(fontSize: 22.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
