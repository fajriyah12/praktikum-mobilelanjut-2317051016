import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  static String route = '/dashboard';

  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data transaksi
    final List<Map<String, dynamic>> transactions = [
      {"title": "Pembelian Pulsa", "amount": -50000, "date": "2025-09-28"},
      {"title": "Gaji Bulanan", "amount": 2000000, "date": "2025-09-27"},
      {"title": "Top Up E-Wallet", "amount": -150000, "date": "2025-09-26"},
    ];

    return Scaffold(
      backgroundColor: Colors.grey[200], // Latar belakang abu-abu muda
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Biar ada jarak dari tepi layar
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Ratakan konten ke kiri
          children: [
            // Teks Sapaan
            const Text(
              'Selamat Datang,',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const Text(
              'RIRI',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24), // Spasi antar elemen
            // --- Kartu Informasi Utama ---
            Container(
              width: double.infinity, // Lebar kartu memenuhi layar
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Baris: Menyajarkan ikon dan teks "Saldo"
                  Row(
                    children: [
                      Icon(
                        Icons.account_balance_wallet_outlined,
                        color: Colors.grey[500],
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Saldo Saat Ini',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Rp 20.000.000',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),

                  // Tombol Aksi di dalam kartu
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1B8FFF),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Lihat Detail Transaksi',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // === Tambahan: Daftar Transaksi Dummy ===
                  const Text(
                    "Transaksi Terakhir",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 12),

                  Column(
                    children: transactions.map((trx) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        child: ListTile(
                          leading: const Icon(
                            Icons.receipt_long,
                            color: Colors.blue,
                          ),
                          title: Text(trx['title']),
                          subtitle: Text(trx['date']),
                          trailing: Text(
                            "Rp ${trx['amount']}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: (trx['amount'] as int) < 0
                                  ? Colors.red
                                  : Colors.green,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
