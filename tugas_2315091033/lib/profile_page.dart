import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String nama;
  final String nomorRekening;
  final int saldo;
  final String email;
  final String nomorTelepon;

  const ProfilePage({
    Key? key,
    required this.nama,
    required this.nomorRekening,
    required this.saldo,
    required this.email,
    required this.nomorTelepon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        title: const Text('Profil Nasabah'),
        backgroundColor: const Color.fromARGB(255, 9, 28, 122),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('profile.jpg'),
            ),
            const SizedBox(height: 15),
            Text(
              nama,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              "No. Rekening: $nomorRekening",
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 25),
            _buildInfoTile(Icons.account_balance_wallet, 'Saldo', 'Rp. $saldo'),
            _buildInfoTile(Icons.email, 'Email', email),
            _buildInfoTile(Icons.phone, 'No. Telepon', nomorTelepon),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back, color: Colors.white,),
              label: const Text('Kembali', style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 9, 28, 122),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: const TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String title, String subtitle) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: const Color.fromARGB(255, 9, 28, 122)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
      ),
    );
  }
}
