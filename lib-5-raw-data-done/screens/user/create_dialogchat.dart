import 'package:flutter/material.dart';

class CreateDialogChat extends StatelessWidget {
  const CreateDialogChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialog Box Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return SimpleDialog(
                  contentPadding: const EdgeInsets.all(20),
                  children: <Widget>[
                    const TextField(
                      maxLines: 3, // or 4
                      decoration: InputDecoration(
                        hintText: 'Masukan Pesan, permintaan atau keluhan',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Add your onPressed code here!
                        },
                        child: const Text('Kirim'),
                      ),
                    ),
                  ],
                );
              },
            );
          },
          child: const Text('Show Dialog'),
        ),
      ),
    );
  }
}
