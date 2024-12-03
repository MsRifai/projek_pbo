import 'mata_kuliah.dart';

class Nilai {
  Map<MataKuliah, double> daftarNilai = {};

  void tambahNilai(MataKuliah mataKuliah, double nilai) {
    daftarNilai[mataKuliah] = nilai;
    print('Nilai untuk mata kuliah ${mataKuliah.nama} berhasil ditambahkan.');
  }

  void cetakTranskrip() {
    print('--- Transkrip Nilai ---');
    for (var entry in daftarNilai.entries) {
      print('${entry.key.nama} (${entry.key.kode}), SKS: ${entry.key.sks}, Nilai: ${entry.value}');
    }
  }

  double hitungIPK() {
    double totalNilai = 0;
    int totalSKS = 0;

    for (var entry in daftarNilai.entries) {
      totalNilai += entry.value * entry.key.sks;
      totalSKS += entry.key.sks;
    }

    return totalSKS > 0 ? totalNilai / totalSKS : 0.0;
  }
}
