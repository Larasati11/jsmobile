# Laporan Praktikum Manajemen Plugin
Nama    : Larasati Puspita Candra Dewi
NIM     : 2241720104
Kelas   : TI-2B
Absen   : 16

## Tugas Praktikum 1
1. Selesaikan langkah-langkah praktikum tersebut, lalu dokumentasikan berupa GIF hasil akhir praktikum beserta penjelasannya di file README.md! Jika Anda menemukan ada yang error atau tidak berjalan dengan baik, silakan diperbaiki.
2. Jelaskan maksud dari langkah 4 pada praktikum tersebut! Mengapa dilakukan demikian?

Jawab : Pada langkah 4 membuat data_layer.dart yang berisi import2 model berfungi untuk menyederhanakan proses impor (import) model-model data dalam aplikasi Flutter.

3. Mengapa perlu variabel plan di langkah 6 pada praktikum tersebut? Mengapa dibuat konstanta ?

Jawab : Variabel plan mewakili objek dari kelas Plan (diimpor dari data_layer.dart), yang kemungkinan besar adalah model data yang berisi informasi mengenai rencana atau daftar tugas (tasks) yang akan ditampilkan atau dikelola pada layar PlanScreen. Di kode ini, plan dibuat sebagai konstanta dengan deklarasi const, yang artinya objek Plan tersebut memiliki nilai tetap, dan tidak akan dimodifikasi setelah dibuat.Dengan menjadikan plan sebagai konstanta, kita mendapatkan objek yang efisien dan aman dari modifikasi yang tidak disengaja.

4. Lakukan capture hasil dari Langkah 9 berupa GIF, kemudian jelaskan apa yang telah Anda buat!
Jawab :![alt text](image.png)
Pada langkah ini, kita membuat sebuah widget bernama _buildTaskTile yang akan membantu menampilkan setiap tugas (task) dari plan.tasks secara dinamis menggunakan ListTile. Tujuan dari widget ini adalah untuk membuat tampilan yang bisa mengakomodasi perubahan pada data task saat pengguna melakukan interaksi, seperti mengubah status complete atau mengedit deskripsi tugas.

5. Apa kegunaan method pada Langkah 11 dan 13 dalam lifecyle state ?

Jawab : Metode `initState` digunakan untuk menginisialisasi `ScrollController` saat widget dibuat dan menambahkan *listener* untuk mengelola fokus input, sehingga keyboard otomatis tertutup saat pengguna menggulir layar. Di sisi lain, metode `dispose` berfungsi untuk membersihkan `ScrollController` ketika widget sudah tidak digunakan lagi, sehingga mencegah kebocoran memori dan menjaga efisiensi aplikasi. Keduanya penting dalam *lifecycle* widget untuk memastikan sumber daya dikelola dengan baik.

6. Kumpulkan laporan praktikum Anda berupa link commit atau repository GitHub ke spreadsheet yang telah disediakan!

## Tugas Praktikum 2
1. Selesaikan langkah-langkah praktikum tersebut, lalu dokumentasikan berupa GIF hasil akhir praktikum beserta penjelasannya di file README.md! Jika Anda menemukan ada yang error atau tidak berjalan dengan baik, silakan diperbaiki sesuai dengan tujuan aplikasi tersebut dibuat.
2. Jelaskan mana yang dimaksud InheritedWidget pada langkah 1 tersebut! Mengapa yang digunakan InheritedNotifier?

Jawab : Pada langkah ini, `PlanProvider` adalah kelas yang menggunakan `InheritedNotifier`, yang memungkinkan widget turunan mengakses data tanpa harus meneruskan data secara manual. `InheritedNotifier` lebih unggul dibandingkan `InheritedWidget` karena dapat mendengarkan perubahan pada `ValueNotifier<Plan>` dan memperbarui UI secara otomatis ketika nilai tersebut berubah. Dengan cara ini, widget yang membutuhkan data dari `PlanProvider` dapat mengakses dan memperbarui diri secara efisien saat data berubah, membuat manajemen state dalam aplikasi menjadi lebih mudah.

3. Jelaskan maksud dari method di langkah 3 pada praktikum tersebut! Mengapa dilakukan demikian?

Jawab : Menambahkan metode completedCount dan completenessMessage di kelas Plan bertujuan untuk menyederhanakan logika penghitungan dan penyajian data terkait status tugas. Ini meningkatkan keterbacaan dan efisiensi kode, serta memudahkan dalam melakukan pembaruan data ketika ada perubahan pada daftar tugas. Dengan cara ini, kita bisa mendapatkan informasi yang dibutuhkan secara langsung dan lebih terstruktur.

4. Lakukan capture hasil dari Langkah 9 berupa GIF, kemudian jelaskan apa yang telah Anda buat!
Jawab : 
![alt text](image-1.png)
Dengan menambahkan widget SafeArea yang berisi completenessMessage, kita memastikan bahwa informasi tentang kelengkapan tugas ditampilkan dengan jelas dan aman dari gangguan elemen sistem. Ini meningkatkan pengalaman pengguna dengan memastikan tampilan yang konsisten di berbagai perangkat. Integrasi ini bekerja dengan baik dengan ValueListenableBuilder, sehingga pesan kelengkapan tugas akan diperbarui secara otomatis ketika ada perubahan pada daftar tugas dalam Plan.

5. Kumpulkan laporan praktikum Anda berupa link commit atau repository GitHub ke spreadsheet yang telah disediakan!

## Tugas Praktikum 3
1. Selesaikan langkah-langkah praktikum tersebut, lalu dokumentasikan berupa GIF hasil akhir praktikum beserta penjelasannya di file README.md! Jika Anda menemukan ada yang error atau tidak berjalan dengan baik, silakan diperbaiki sesuai dengan tujuan aplikasi tersebut dibuat.
![alt text](image-2.png)
![alt text](image-3.png)
2. Berdasarkan Praktikum 3 yang telah Anda lakukan, jelaskan maksud dari gambar diagram berikut ini!
3. Lakukan capture hasil dari Langkah 14 berupa GIF, kemudian jelaskan apa yang telah Anda buat!
5. Kumpulkan laporan praktikum Anda berupa link commit atau repository GitHub ke spreadsheet yang telah disediakan!