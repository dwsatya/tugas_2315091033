import 'package:flutter/material.dart';
import 'qr_scanner_page.dart'; 


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
  String? _errorMessage;
  String? _hasilScan; // <--- Tambahkan ini

  void _cekToken() {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });

      String inputToken = _tokenController.text.trim();

      if (inputToken == tokenValid) {
        int depositAmount = 500000;
        widget.onDeposit(depositAmount);
        Navigator.pop(context);
      } else {
        setState(() {
          _errorMessage = "Token yang Anda masukkan tidak valid.";
        });
      }
    });
  }

  Future<void> _bukaScanner() async {
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (context) => const QRScannerPage()),
    );

    if (result != null) {
      setState(() {
        _tokenController.text = result;
        _hasilScan = result; // <-- Simpan hasil scan di sini
      });
      _cekToken(); // langsung verifikasi jika hasil QR masuk
    }
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
              'Masukkan token deposito atau scan QR Code.',
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
            if (_hasilScan != null) ...[
              const SizedBox(height: 10),
              Text(
                'Hasil Scan: $_hasilScan',
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
            if (_errorMessage != null) ...[
              const SizedBox(height: 10),
              Text(
                _errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            ],
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _cekToken,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 9, 28, 122),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 12,
                    ),
                  ),
                  child: const Text(
                    'Kirim',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: _bukaScanner,
                  icon: const Icon(Icons.qr_code_scanner, color: Colors.white,),
                  label: const Text('Scan', style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
