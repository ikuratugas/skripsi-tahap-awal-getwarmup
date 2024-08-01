import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serius_mode/providers/pelangganprovider.dart';
import 'package:serius_mode/screens/user/userhomepage_screen.dart';

class UserLoginScreen extends StatelessWidget {
  UserLoginScreen({super.key});

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _usernameController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Masukan Username",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Masukkan password",
                ),
                obscureText: true,
              ),
              const SizedBox(
                height: 10,
              ),
              Consumer<PelangganProvider>(
                builder: (context, provider, child) {
                  return TextButton(
                    onPressed: () {
                      final username = _usernameController.text;
                      final password = _passwordController.text;

                      final pelanggan = provider.login(username, password);

                      if (pelanggan != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Login Berhasil")),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  // UserDetailScreen(pelanggan: pelanggan),
                                  UserHomeScreen(
                                    pelanggan: pelanggan,
                                  )),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("Username atau password salah")),
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => const Color.fromARGB(255, 215, 192, 255)),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      width: MediaQuery.of(context).size.width * 1,
                      child: const Center(child: Text("L o g i n")),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
