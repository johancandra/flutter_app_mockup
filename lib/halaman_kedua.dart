import 'package:flutter/material.dart';

class Siswa {
  final String nama;
  final String alamat;

  Siswa({required this.nama, required this.alamat});
}

class HalamanKedua extends StatefulWidget {
  @override
  _HalamanKedua createState() => _HalamanKedua();
}

class _HalamanKedua extends State<HalamanKedua> {
  @override
  List<Siswa> daftarSiswa = [
    Siswa(nama: 'Siswa 1', alamat: 'Alamat 1'), 
    Siswa(nama: 'Siswa 2', alamat: 'Alamat 2'),
  ];
  final _nama = TextEditingController();
  final _alamat = TextEditingController();
  bool isVisible = false;
  bool isVisible2 = false;
  int _index = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Siswa')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Daftar Siswa:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            ElevatedButton(
              child: Text('Add Siswa'),
              onPressed: () {
                _nama.text = '';
                _alamat.text = '';
                setState(() {
                  isVisible2 = !isVisible2;
                });
                print('Add Siswa');
              },
            ),
            SizedBox(height: 12),
            if(isVisible2) TextField(
              controller: _nama,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            if(isVisible2) SizedBox(height: 12),
            if(isVisible2) TextField(
              controller: _alamat,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            if(isVisible2) SizedBox(height: 12),
            if(isVisible2) Row(
              children: [
                ElevatedButton(
                  child: Text('Ok'),
                  onPressed: () {
                    daftarSiswa.add(Siswa(nama: _nama.text, alamat: _alamat.text));
                    setState(() {
                      isVisible2 = !isVisible2;
                    });
                    print('Ok');
                  },
                ),
                ElevatedButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    setState(() {
                      isVisible2 = !isVisible2;
                    });
                    print('Cancel');
                  },
                ),
              ],
            ),
            if(isVisible2) SizedBox(height: 12),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: daftarSiswa.length,
              itemBuilder: (context, index) {
                Siswa s = daftarSiswa[index];
                String nama = s.nama;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('$nama', style: TextStyle(fontSize: 16)),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        ElevatedButton(
                          child: Text('Detail'),
                          onPressed: () {
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => DetailPage(item: s)));
                          },
                        ),
                        ElevatedButton(
                          child: Text('Edit'),
                          onPressed: () {
                            _nama.text = s.nama;
                            _alamat.text = s.alamat;
                            setState(() {
                              isVisible = !isVisible;
                              _index = index;
                            });
                            print('Edit');
                          },
                        ),
                        ElevatedButton(
                          child: Text('Delete'),
                          onPressed: () {
                            setState(() {
                              daftarSiswa.removeAt(index);
                            });
                            print('Delete');
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    if(isVisible && (index == _index)) TextField(
                      controller: _nama,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    if(isVisible && (index == _index)) SizedBox(height: 12),
                    if(isVisible && (index == _index)) TextField(
                      controller: _alamat,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    if(isVisible && (index == _index)) SizedBox(height: 12),
                    if(isVisible && (index == _index)) Row(
                      children: [
                        ElevatedButton(
                          child: Text('Ok'),
                          onPressed: () {
                            daftarSiswa[index] = Siswa(nama: _nama.text, alamat: _alamat.text);
                            setState(() {
                              isVisible = !isVisible;
                            });
                            print('Ok');
                          },
                        ),
                        ElevatedButton(
                          child: Text('Cancel'),
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                            print('Cancel');
                          },
                        ),
                      ],
                    ),
                    if(isVisible && (index == _index)) SizedBox(height: 12),
                  ],
                );
              },
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  child: Text('Kembali'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  Siswa item;
  DetailPage({required this.item});
  String nama = '';
  String alamat = '';
  @override
  Widget build(BuildContext context) {
    nama = this.item.nama;
    alamat = this.item.alamat;
    return Scaffold(
      appBar: AppBar(title: Text('Detail')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$nama', style: TextStyle(fontSize: 16)),
            SizedBox(height: 12),
            Text('$alamat', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

