import 'dart:io';

import '../lib/mahasiswa.dart';
import '../lib/mata_kuliah.dart';
import '../lib/krs.dart';
import '../lib/nilai.dart';

void main() {
  // Data Mahasiswa dan Mata Kuliah (statis)
  Mahasiswa mahasiswa = Mahasiswa(nim: '230103085', nama: 'Ahmad Dwi R', semester: 3);
  KRS krs = KRS(mahasiswa: mahasiswa);
  Nilai nilai = Nilai();

  // Tambahkan daftar mata kuliah ke KRS
  krs.tambahMataKuliah(MataKuliah(kode: 'MK001', nama: 'Matematika', sks: 3));
  krs.tambahMataKuliah(MataKuliah(kode: 'MK002', nama: 'Pemrograman', sks: 4));
  krs.tambahMataKuliah(MataKuliah(kode: 'MK003', nama: 'Sistem Operasi', sks: 3));

  print('Mahasiswa: ${mahasiswa.nama} (NIM: ${mahasiswa.nim}, Semester: ${mahasiswa.semester})');
  print('Mata Kuliah yang diambil:');
  krs.daftarMataKuliah.forEach((mk) {
    print('- ${mk.nama} (${mk.kode}, SKS: ${mk.sks})');
  });

  // Menu interaktif
  while (true) {
    print('\n--- Sistem Akademik ---');
    print('1. Input Nilai Mahasiswa');
    print('2. Hitung IPK');
    print('3. Cetak KRS');
    print('4. Transkrip Nilai');
    print('5. Keluar');
    stdout.write('Pilih menu (1-5): ');
    String? pilihan = stdin.readLineSync();

    switch (pilihan) {
      case '1':
        inputNilai(krs, nilai);
        break;

      case '2':
        if (nilai.daftarNilai.isEmpty) {
          print('Nilai belum diinput. Silakan input nilai terlebih dahulu.');
        } else {
          print('IPK: ${nilai.hitungIPK()}');
        }
        break;

      case '3':
        krs.cetakKRS();
        break;

      case '4':
        if (nilai.daftarNilai.isEmpty) {
          print('Nilai belum diinput. Silakan input nilai terlebih dahulu.');
        } else {
          nilai.cetakTranskrip();
        }
        break;

      case '5':
        print('Keluar dari program.');
        exit(0);

      default:
        print('Pilihan tidak valid. Coba lagi.');
    }
  }
}

void inputNilai(KRS krs, Nilai nilai) {
  print('Mata kuliah yang diambil:');
  for (int i = 0; i < krs.daftarMataKuliah.length; i++) {
    print('${i + 1}. ${krs.daftarMataKuliah[i].nama}');
  }
  stdout.write('Pilih nomor mata kuliah: ');
  int pilihan = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;

  if (pilihan > 0 && pilihan <= krs.daftarMataKuliah.length) {
    MataKuliah mataKuliah = krs.daftarMataKuliah[pilihan - 1];
    stdout.write('Masukkan nilai untuk ${mataKuliah.nama}: ');
    double nilaiMahasiswa = double.tryParse(stdin.readLineSync() ?? '0.0') ?? 0.0;
    nilai.tambahNilai(mataKuliah, nilaiMahasiswa);
  } else {
    print('Pilihan tidak valid.');
  }
}
