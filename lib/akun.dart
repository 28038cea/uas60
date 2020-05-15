import 'package:flutter/material.dart';

class Akun extends StatefulWidget {
  @override
  _AkunState createState() => _AkunState();
}

class _AkunState extends State<Akun> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black54,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text('Akun'),
        ]),
      ), //widget Drawer

      //seluruh body dibungkus column //Tidak terdapat perubahan pada body beranda.dart latihan 4 /tugas 4 sebelumnya
      body: new Column(
        children: <Widget>[
          new CircleAvatar(
            radius: 100.0,
            //mengambil gambar dari internet menggunakan NetworkImage
            backgroundImage: new AssetImage('assets/appimages/apotek.jpg'),
          ), //setiap bagian pada body dipisahkan container
          Container(
            height: 700.0,
            color: Colors.black54,
            padding: const EdgeInsets.all(
                10), //untuk membuat tampilan secara horisontal maka digunakan row
            child: Stack(
              children: <Widget>[
                Positioned(
                    top: 80.0,
                    left: 80.0,
                    right: 50.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              'Nama : ',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            Text('I Gede Agus Dian Yogiswara',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'Email : ',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            Text('swbswb13@gmail.com',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'Telepon : ',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            Text('085847845158',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ))
                          ],
                        )
                      ],
                    ))
              ],
            ),
          ), //setiap bagian pada body dipisahkan container
        ],
      ),
    );
  }
}
