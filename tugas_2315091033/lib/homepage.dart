import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'login.dart';
import 'transfer_page.dart';
import 'pembayaran_page.dart';
import 'pinjaman_page.dart';
import 'cek_saldo_page.dart';
import 'deposito_page.dart';
import 'setting_page.dart';
import 'mutasi_page.dart';
import 'mutasi_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int saldo = 1200000;
   List<Mutasi> daftarMutasi = [];

  void updateSaldo(int jumlah, String jenis) {
    setState(() {
      saldo -= jumlah;
      daftarMutasi.add(Mutasi(
        jenis: jenis,
        jumlah: jumlah,
        tanggal: DateTime.now(),
      ));
    });
  }

  void addPinjaman(int jumlahPinjam) {
    setState(() {
      saldo += jumlahPinjam;
      daftarMutasi.add(Mutasi(
        jenis: 'Pinjaman',
        jumlah: jumlahPinjam,
        tanggal: DateTime.now(),
      ));
    });
  }

  void tambahSaldoDariDeposito(int jumlahDeposit) {
    setState(() {
      saldo += jumlahDeposit;
      daftarMutasi.add(Mutasi(
        jenis: 'Deposito',
        jumlah: jumlahDeposit,
        tanggal: DateTime.now(),
      ));
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Tes Undiksha",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 9, 28, 122),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(15),
              height: 140,
              width: 320,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 9, 28, 122),
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'profile.jpg',
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Nasabah',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const Text(
                        'Dewa Md Satya Pratama Putra',
                        style: TextStyle(fontSize: 13),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Total Saldo Anda',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Text(
                        'Rp. $saldo',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              children: [
                MenuIcon(
                  icon: Icons.account_balance_wallet,
                  label: 'Cek Saldo',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CekSaldoPage(saldo: saldo),
                      ),
                    );
                  },
                ),
                MenuIcon(
                  icon: Icons.send,
                  label: 'Transfer',
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TransferPage(
                          saldo: saldo,
                          onTransfer: (jumlah) =>
                              updateSaldo(jumlah, 'Transfer'),
                        ),
                      ),
                    );
                  },
                ),
                MenuIcon(
                  icon: Icons.savings,
                  label: 'Deposito',
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DepositoPage(
                          saldo: saldo,
                          onDeposit: tambahSaldoDariDeposito,
                        ),
                      ),
                    );
                  },
                ),
                MenuIcon(
                  icon: Icons.payment,
                  label: 'Pembayaran',
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PembayaranPage(
                          saldo: saldo,
                          onBayar: (jumlah) =>
                              updateSaldo(jumlah, 'Pembayaran'),
                        ),
                      ),
                    );
                  },
                ),
                MenuIcon(
                  icon: Icons.monetization_on,
                  label: 'Pinjaman',
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PinjamanPage(
                          saldo: saldo,
                          addPinjaman: addPinjaman,
                        ),
                      ),
                    );
                  },
                ),
                MenuIcon(
                  icon: Icons.history,
                  label: 'Mutasi',
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MutasiPage(
                          daftarMutasi: daftarMutasi,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(15),
              color: const Color.fromARGB(255, 9, 28, 122),
              child: Column(
                children: const [
                  Text(
                    'Butuh Bantuan?',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                  Text(
                    '0878-1234-1024',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BottomIcon(
                  icon: Icons.settings, 
                  label: 'Setting',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SettingPage()),
                    );
                  },
                ),
                BottomIcon(icon: 
                  Icons.person,
                  label: 'Profile',
                   onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(
                          nama: "Dewa Md Satya Pratama Putra",
                          nomorRekening: "1234567890",
                          saldo: saldo,
                          email: "dewa@example.com",
                          nomorTelepon: "087812341024",
                        ),
                      ),
                    );
                  },
                  ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class MenuIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const MenuIcon({Key? key, required this.icon, required this.label, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: const Color.fromARGB(255, 9, 28, 122)),
          const SizedBox(height: 5),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

class BottomIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const BottomIcon({Key? key, required this.icon, required this.label, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, size: 30, color: const Color.fromARGB(255, 9, 28, 122)),
          const SizedBox(height: 5),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
