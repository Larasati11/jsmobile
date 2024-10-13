void main() {
  String nama = "Larasati Puspita Candra Dewi";
  String nim = "2241720104";

  bool isPrima(int bil) {
    if (bil <= 1) return false;
    for (int i = 2; i * i <= bil; i++) {
      if (bil % i == 0) return false;
    }
    return true;
  }

  for (int i = 0; i <= 201; i++) {
    if (isPrima(i)) {
      print('$i adalah bilangan prima. Nama: $nama, NIM: $nim');
    }
  }
  
}
