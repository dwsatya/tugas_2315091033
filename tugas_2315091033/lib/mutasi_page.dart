import 'package:flutter/material.dart';
import 'mutasi_model.dart';

class MutasiPage extends StatelessWidget {
  final List<Mutasi> daftarMutasi;

  const MutasiPage({Key? key, required this.daftarMutasi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Riwayat Mutasi',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 9, 28, 122),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: daftarMutasi.isEmpty
          ? const Center(
              child: Text(
                'Belum ada transaksi.',
                style: TextStyle(color: Colors.black),
              ),
            )
          : ListView.separated(
              itemCount: daftarMutasi.length,
              separatorBuilder: (context, index) => const Divider(
                color: Colors.grey,
                height: 1,
              ),
              itemBuilder: (context, index) {
                final mutasi = daftarMutasi[index];
                return Container(
                  color: Colors.white, 
                  child: ListTile(
                    leading: Icon(
                      mutasi.jenis == 'Pinjaman'
                          ? Icons.arrow_downward
                          : Icons.arrow_upward,
                      color:
                          mutasi.jenis == 'Pinjaman' ? Colors.green : Colors.red,
                    ),
                    title: Text(mutasi.jenis),
                    subtitle: Text(
                      '${mutasi.tanggal.day}/${mutasi.tanggal.month}/${mutasi.tanggal.year}',
                    ),
                    trailing: Text(
                      'Rp. ${mutasi.jumlah}',
                      style: TextStyle(
                        color: mutasi.jenis == 'Pinjaman'
                            ? Colors.green
                            : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
