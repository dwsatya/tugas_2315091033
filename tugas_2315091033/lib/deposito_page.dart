import 'package:flutter/material.dart';

class DepositoPage extends StatefulWidget {
  final int saldo;
  final Function(int) onDeposit;

  const DepositoPage({
    Key? key,
    required this.saldo,
    required this.onDeposit,
  }) : super(key: key);

  @override
  State<DepositoPage> createState() => _DepositoPageState();
}

class _DepositoPageState extends State<DepositoPage> {
  final TextEditingController _tokenController = TextEditingController();
  final String tokenValid = "2315091033";
  bool _isLoading = false;

  void _cekToken() {
    setState(() {
      _isLoading = true;
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });

      String inputToken = _tokenController.text.trim();

      if (inputToken == tokenValid) {
        int depositAmount = 500000; // Contoh nominal deposito
        widget.onDeposit(depositAmount);

        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("Berhasil"),
            content: Text("Deposito berhasil. Saldo bertambah Rp. $depositAmount."),
            actions: [
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.pop(context); // Tutup dialog
                  Navigator.pop(context); // Kembali ke HomePage
                },
              ),
            ],
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("Token Salah"),
            content: const Text("Token yang Anda masukkan tidak valid."),
            actions: [
              TextButton(
                child: const Text("Coba Lagi"),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deposito'),
        backgroundColor: const Color.fromARGB(255, 9, 28, 122),
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Masukkan token deposito untuk menambahkan saldo Anda.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            TextField(
              controller: _tokenController,
              decoration: const InputDecoration(
                labelText: 'Token',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _cekToken,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 9, 28, 122),
                      padding:
                          const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    ),
                    child: const Text(
                      'Kirim',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
