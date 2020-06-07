import 'package:flutter/material.dart';

import 'beranda.dart' as beranda;
import 'listproduk.dart' as listproduk;

class BerandaUser extends StatefulWidget {
  @override
  _BerandaUserState createState() => _BerandaUserState();
}

class _BerandaUserState extends State<BerandaUser>
    with SingleTickerProviderStateMixin {
  //ini variabel controller untuk mengatur tabbar
  TabController controller;
  //jangan lupa tambahkan initState untuk inisialisasi dan mengaktifkan tab
  @override
  void initState() {
    controller = new TabController(vsync: this, length: 2);
    super.initState();
  }

  //jangan lupa tambahkan dispose untuk berpindah halaman
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new beranda.Beranda(),
          new listproduk.Listproduk(),
        ],
      ),
      bottomNavigationBar: new Material(
        color: Colors.black54,
        child: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.home)),
            new Tab(icon: new Icon(Icons.list)),
          ],
        ),
      ),
    );
  }
}
