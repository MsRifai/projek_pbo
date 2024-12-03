import 'mahasiswa.dart';
import 'mata_kuliah.dart';

class KRS {
  Mahasiswa mahasiswa;
  List<MataKuliah> daftarMataKuliah = [];

  KRS({required this.mahasiswa});

  void tambahMataKuliah(MataKuliah mataKuliah) {
    daftarMataKuliah.add(mataKuliah);
    print('Mata kuliah ${mataKuliah.nama} berhasil ditambahkan ke KRS.');
  }

  void cetakKRS() {
    print('--- KRS Mahasiswa ---');
    print('NIM: ${mahasiswa.nim}, Nama: ${mahasiswa.nama}, Semester: ${mahasiswa.semester}');
    print('Mata Kuliah yang diambil:');
    for (var mk in daftarMataKuliah) {
      print('- ${mk.nama} (${mk.kode}), SKS: ${mk.sks}');
    }
  }
}
