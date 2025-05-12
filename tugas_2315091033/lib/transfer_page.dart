import 'package:flutter/material.dart';

class TransferPage extends StatefulWidget {
  final int saldo;
  final Function(int) onTransfer;

  const TransferPage({Key? key, required this.saldo, required this.onTransfer}) : super(key: key);

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _jumlahController = TextEditingController();
  final TextEditingController _rekeningController = TextEditingController();

  String? selectedBank;

  final List<String> bankList = ['BRI', 'BCA', 'BNI', 'Mandiri'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background jadi putih
      appBar: AppBar(
        title: const Text(
          'Transfer Uang',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 9, 28, 122),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color.fromARGB(255, 9, 28, 122), width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Saldo Saat Ini",
                      style: TextStyle(
                        fontSize: 14,
                        color: const Color.fromARGB(255, 9, 28, 122),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Rp. ${widget.saldo}",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),


              // Nomor Rekening
              TextFormField(
                controller: _rekeningController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Nomor Rekening Tujuan',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Masukkan nomor rekening';
                  if (value.length < 6) return 'Nomor rekening tidak valid';
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Dropdown Bank
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Pilih Bank Tujuan',
                  border: OutlineInputBorder(),
                ),
                items: bankList.map((bank) {
                  return DropdownMenuItem(
                    value: bank,
                    child: Text(bank),
                  );
                }).toList(),
                value: selectedBank,
                onChanged: (value) {
                  setState(() {
                    selectedBank = value;
                  });
                },
                validator: (value) {
                  if (value == null) return 'Pilih bank tujuan';
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Jumlah Transfer
              TextFormField(
                controller: _jumlahController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Jumlah Transfer',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Masukkan jumlah';
                  final intValue = int.tryParse(value);
                  if (intValue == null || intValue <= 0) return 'Jumlah tidak valid';
                  if (intValue > widget.saldo) return 'Saldo tidak cukup';
                  return null;
                },
              ),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final jumlah = int.parse(_jumlahController.text);
                    widget.onTransfer(jumlah);
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 9, 28, 122),
                  foregroundColor: Colors.white,
                ),
                child: const Text('Kirim'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
