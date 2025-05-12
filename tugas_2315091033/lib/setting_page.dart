import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pengaturan',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 9, 28, 122),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.notifications, color: Colors.blue),
            title: const Text('Notifikasi'),
            subtitle: const Text('Kelola pengaturan notifikasi'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Bisa diarahkan ke halaman notifikasi jika diperlukan
            },
          ),
          const Divider(),

          // Bahasa Section
          ListTile(
            leading: const Icon(Icons.language, color: Colors.blue),
            title: const Text('Bahasa'),
            subtitle: const Text('Pilih bahasa aplikasi'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Bisa diarahkan ke halaman pengaturan bahasa jika diperlukan
            },
          ),
          const Divider(),

          // Privacy Section
          ListTile(
            leading: const Icon(Icons.lock, color: Colors.blue),
            title: const Text('Privasi dan Keamanan'),
            subtitle: const Text('Kelola pengaturan privasi dan keamanan'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Bisa diarahkan ke halaman privasi jika diperlukan
            },
          ),
          const Divider(),

          // Logout Section
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.blue),
            title: const Text('Keluar'),
            onTap: () {
              // Implementasikan logika untuk keluar dari akun
              // Misalnya, kembali ke halaman login
            },
          ),
        ],
      ),
    );
  }
}
