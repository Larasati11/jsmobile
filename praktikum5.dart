void main() {
  var record = (1, 2);
  record = tukar(record);
  print(record);

  (String, int) mahasiswa = ('Larasati Puspita Candra Dewi', 2241720104);
  print(mahasiswa);

  var mahasiswa2 = ('Larasati Puspita Candra Dewi', a: 2, b: true, '2241720104');

  print(mahasiswa2.$1); // Prints 'first'
  print(mahasiswa2.a); // Prints 2
  print(mahasiswa2.b); // Prints true
  print(mahasiswa2.$2); // Prints 'last'
}

(int, int) tukar((int, int) record) {
  var (a, b) = record;
  return (b, a);
}