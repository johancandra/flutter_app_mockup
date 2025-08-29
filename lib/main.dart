import 'package:flutter/material.dart';
import 'halaman_kedua.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: HalamanUtama(),
    );
  }
}

class User {
  final String title;
  final String description;

  User({required this.title, required this.description});
}

class HalamanUtama extends StatefulWidget {
  @override
  _HalamanUtama createState() => _HalamanUtama();
}

class _HalamanUtama extends State<HalamanUtama> {
  @override
  List<User> daftarUser = [
    User(title: 'User 1', description: 'User 1 description'),
    User(title: 'User 2', description: 'User 2 description'),
  ];
  final _title = TextEditingController();
  final _description = TextEditingController();
  bool isVisible = false;
  bool isVisible2 = false;
  int _index = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Daftar User:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            ElevatedButton(
              child: Text('Add User'),
              onPressed: () {
                _title.text = '';
                _description.text = '';
                setState(() {
                  isVisible2 = !isVisible2;
                });
                print('Add User');
              },
            ),
            SizedBox(height: 12),
            if(isVisible2) TextField(
              controller: _title,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            if(isVisible2) SizedBox(height: 12),
            if(isVisible2) TextField(
              controller: _description,
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
                    daftarUser.add(User(title: _title.text, description: _description.text));
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
              itemCount: daftarUser.length,
              itemBuilder: (context, index) {
                User u = daftarUser[index];
                String title = u.title;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('$title', style: TextStyle(fontSize: 16)),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        ElevatedButton(
                          child: Text('Detail'),
                          onPressed: () {
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => DetailPage(item: u)));
                          },
                        ),
                        ElevatedButton(
                          child: Text('Edit'),
                          onPressed: () {
                            _title.text = u.title;
                            _description.text = u.description;
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
                              daftarUser.removeAt(index);
                            });
                            print('Delete');
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    if(isVisible && (index == _index)) TextField(
                      controller: _title,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    if(isVisible && (index == _index)) SizedBox(height: 12),
                    if(isVisible && (index == _index)) TextField(
                      controller: _description,
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
                            daftarUser[index] = User(title: _title.text, description: _description.text);
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
                  child: Text('Halaman Siswa'),
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HalamanKedua()));
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
  User item;
  DetailPage({required this.item});
  String title = '';
  String description = '';
  @override
  Widget build(BuildContext context) {
    title = this.item.title;
    description = this.item.description;
    return Scaffold(
      appBar: AppBar(title: Text('Detail')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$title', style: TextStyle(fontSize: 16)),
            SizedBox(height: 12),
            Text('$description', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
