import 'package:flutter/material.dart';

class PinjamanPage extends StatefulWidget {
  final int saldo;
  final Function(int) addPinjaman;

  const PinjamanPage({Key? key, required this.saldo, required this.addPinjaman}) : super(key: key);

  @override
  _PinjamanPageState createState() => _PinjamanPageState();
}

class _PinjamanPageState extends State<PinjamanPage> {
  final TextEditingController _amountController = TextEditingController();

  void _pinjam() {
    final int amount = int.tryParse(_amountController.text) ?? 0;
    if (amount > 0) {
      widget.addPinjaman(amount);
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Masukkan jumlah pinjaman yang valid")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Pinjaman', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 9, 28, 122),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.monetization_on, size: 60, color: Colors.green),
              const SizedBox(height: 20),
              Text(
                'Saldo Anda: Rp. ${widget.saldo}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Jumlah Pinjaman',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _pinjam,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 9, 28, 122),
                ),
                child: const Text('Ajukan Pinjaman',
                style: TextStyle(
                  color: Colors.white
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
