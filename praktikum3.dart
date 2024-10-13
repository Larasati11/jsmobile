void main(){
  var gifts = {
  // Key:    Value
  'first': 'partridge',
  'second': 'turtledoves',
  'fifth': 1,
  'third': 'Larasati Puspita',
  'fourth': 2241720104
};

var nobleGases = {
  2: 'helium',
  10: 'neon',
  18: 2,
  11: 'Larasati Puspita',
  12: 2241720104
};

var mhs1 = Map<String, String>();
gifts['first'] = 'partridge';
gifts['second'] = 'turtledoves';
gifts['fifth'] = 'golden rings';
mhs1['nama'] = 'Larasati Puspita';
mhs1['nim'] = '2241720104';

var mhs2 = Map<int, String>();
nobleGases[2] = 'helium';
nobleGases[10] = 'neon';
nobleGases[18] = 'argon';
mhs2[1] = 'Larasati Puspita';
mhs2[2] = '2241720104';

print(gifts);
print(nobleGases);
print(mhs1);
print(nobleGases);

}