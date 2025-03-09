# BMI Calculator

## Deskripsi
BMI Calculator adalah aplikasi berbasis Flutter yang digunakan untuk menghitung Indeks Massa Tubuh (IMT) berdasarkan berat badan dan tinggi badan pengguna. Aplikasi ini memberikan kategori berat badan berdasarkan nilai BMI yang dihitung.

## Fitur
- Input berat badan dalam satuan kilogram (Kg)
- Input tinggi badan dalam satuan sentimeter (Cm)
- Perhitungan BMI dengan formula:
  ```
  BMI = (berat badan * 10000) / (tinggi badan * tinggi badan)
  ```
- Menampilkan hasil BMI beserta kategorinya:
  - Berat Badan Kurang (< 18.5)
  - Berat Badan Normal (18.5 - 24.9)
  - Berat Badan Berlebihan (25.0 - 29.9)
  - Obesitas Tingkat I (30.0 - 34.9)
  - Obesitas Tingkat II (35.0 - 39.9)
  - Obesitas Tingkat III (> 40.0)
- Tombol untuk membersihkan input dan hasil perhitungan

## Teknologi yang Digunakan
- Flutter
- Dart
- Material Design

## Cara Menjalankan Aplikasi
1. Pastikan telah menginstal Flutter di sistem Anda.
2. Clone atau unduh repositori ini.
3. Buka terminal atau command prompt, lalu jalankan perintah berikut:
   ```sh
   flutter pub get
   flutter run
   ```
4. Aplikasi akan berjalan di emulator atau perangkat yang terhubung.

## Struktur Kode
- `main.dart`: Berisi kode utama aplikasi yang mengatur UI dan logika perhitungan BMI.
- `MyApp`: Widget utama yang mengatur tema dan halaman utama aplikasi.
- `Homepage`: Stateful widget yang menangani input pengguna dan perhitungan BMI.

## Tampilan Aplikasi
1. Pengguna memasukkan berat dan tinggi badan.
2. Klik tombol "HITUNG" untuk mendapatkan hasil BMI.
3. Hasil ditampilkan beserta kategorinya.
4. Klik "BERSIHKAN" untuk menghapus input dan hasil.

## Lisensi
Aplikasi ini dibuat untuk tujuan edukasi dan dapat digunakan serta dikembangkan lebih lanjut sesuai kebutuhan.

