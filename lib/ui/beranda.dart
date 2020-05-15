import 'package:uas/ui/berandaadmin.dart';
import 'package:uas/ui/login.dart';
import 'package:uas/akun.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Beranda extends StatefulWidget {
  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //update AppBar
      appBar: new AppBar(
        backgroundColor: Colors.black54,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text('Beranda'),
        ]),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('Click search');
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications_active),
            onPressed: () {
              print('Click start');
            },
          ),
        ],
      ), //widget Drawer

      drawer: new Drawer(
        //menggunakan listView agar drawer dapat melebihi width devices
        child: new ListView(
          children: <Widget>[
            //Drawer Header diisi dengan informasi akun
            new UserAccountsDrawerHeader(
              accountName: new Text("Agus Dian"),
              accountEmail: new Text("agus.dian@undiksha.ac.id"),
              currentAccountPicture: new GestureDetector(
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => Akun(),
                  ));
                },
                child: new CircleAvatar(
                  //mengambil gambar dari internet menggunakan NetworkImage
                  backgroundImage:
                      new AssetImage('assets/appimages/bg_profile.jpg'),
                ),
              ), //memberi background pada Drawer Header
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/appimages/apotek.jpg'),
                    fit: BoxFit.cover),
              ),
            ), //Menu Drawer
            new ListTile(
              title: new Text('Notifications'),
              trailing: new Icon(Icons.notifications_none),
            ),
            new ListTile(
              title: new Text('Wishlist'),
              trailing: new Icon(Icons.bookmark_border),
            ),
            new ListTile(
              title: new Text('Akun'),
              trailing: new Icon(Icons.verified_user),
            ), //Divider Menu
            Divider(
              height: 2,
            ),
            new ListTile(
              title: new Text('setting'),
              trailing: new Icon(Icons.settings),
            ),
          ],
        ),
      ),
      //seluruh body dibungkus column //Tidak terdapat perubahan pada body beranda.dart latihan 4 /tugas 4 sebelumnya
      body: new Column(
        children: <Widget>[
          Image.asset(
              "assets/appimages/apotek.jpg"), //setiap bagian pada body dipisahkan container
          Container(
            color: Colors.black54,
            padding: const EdgeInsets.all(
                10), //untuk membuat tampilan secara horisontal maka digunakan row
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Apotek Bersahabat',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'Menyediakan obat-obatan',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ), //setiap bagian pada body dipisahkan container
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Theme.of(context).dividerColor)),
            ), //untuk membuat tampilan secara horisontal maka digunakan row
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //untuk membuat tampilan secara vertikal maka digunakan column
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.phone, color: Colors.black54),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        "Costumer Service",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.near_me, color: Colors.black54),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        "Go to App Store",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.share, color: Colors.black54),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        "SHARE",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'Apotek ini menyediakan obat-obatan dan sarana medis lainnya '
              ''
              ' ',
              softWrap: true,
            ),
          )
        ],
      ),
    );
  }
}
