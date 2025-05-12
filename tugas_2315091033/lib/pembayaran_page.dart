import 'package:flutter/material.dart';

class PembayaranPage extends StatefulWidget {
  final int saldo;
  final Function(int) onBayar;

  const PembayaranPage({
    Key? key,
    required this.saldo,
    required this.onBayar,
  }) : super(key: key);

  @override
  State<PembayaranPage> createState() => _PembayaranPageState();
}

class _PembayaranPageState extends State<PembayaranPage> {
  final _formKey = GlobalKey<FormState>();
  String _jenisPembayaran = 'Pulsa';
  int _jumlah = 0;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_jumlah > widget.saldo) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Saldo tidak mencukupi')),
        );
      } else {
        widget.onBayar(_jumlah);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Pembayaran berhasil')),
        );
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      appBar: AppBar(
        title: const Text(
          'Pembayaran',
          style: TextStyle(color: Colors.white), 
        ),
        backgroundColor: const Color.fromARGB(255, 9, 28, 122),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                value: _jenisPembayaran,
                decoration: const InputDecoration(
                  labelText: 'Jenis Pembayaran',
                  labelStyle: TextStyle(color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
                dropdownColor: Colors.white,
                iconEnabledColor: Colors.black,
                style: const TextStyle(color: Colors.black),
                items: const [
                  DropdownMenuItem(value: 'Pulsa', child: Text('Pulsa')),
                  DropdownMenuItem(value: 'Listrik', child: Text('Listrik')),
                  DropdownMenuItem(value: 'Air', child: Text('Air')),
                  DropdownMenuItem(value: 'Internet', child: Text('Internet')),
                ],
                onChanged: (value) {
                  setState(() {
                    _jenisPembayaran = value!;
                  });
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  labelText: 'Jumlah Pembayaran',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  _jumlah = int.tryParse(value!) ?? 0;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan jumlah pembayaran';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Harus berupa angka';
                  }
                  if (int.parse(value) <= 0) {
                    return 'Jumlah harus lebih dari 0';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 9, 28, 122),
                  foregroundColor: Colors.white, 
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text(
                  'Bayar',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
