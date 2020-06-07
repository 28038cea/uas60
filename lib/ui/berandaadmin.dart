// import 'package:flutter/material.dart';
// import 'package:uas/ui/login.dart';

// class BerandaAdmin extends StatelessWidget {
//   BerandaAdmin({this.username, this.photo});
//   final String username;
//   final String photo;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Welcome Admin"),
//       ),
//       body: Column(
//         children: <Widget>[
//           Text(
//             'Hallo $username',
//             style: TextStyle(fontSize: 20.0),
//           ),
//           RaisedButton(
//             child: Text("Logout"),
//             onPressed: () {
//               Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(
//                       builder: (BuildContext context) => Login()));
//             },
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import 'beranda.dart' as beranda;
import 'listproduk.dart' as listproduk;
import 'detailpenjualan.dart' as detail;

class BerandaAdmin extends StatefulWidget {
  @override
  _BerandaAdminState createState() => _BerandaAdminState();
}

class _BerandaAdminState extends State<BerandaAdmin>
    with SingleTickerProviderStateMixin {
  //ini variabel controller untuk mengatur tabbar
  TabController controller;
  //jangan lupa tambahkan initState untuk inisialisasi dan mengaktifkan tab
  @override
  void initState() {
    controller = new TabController(vsync: this, length: 3);
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
          new detail.DetailPenjualan(),
        ],
      ),
      bottomNavigationBar: new Material(
        color: Colors.black54,
        child: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.home)),
            new Tab(icon: new Icon(Icons.list)),
            new Tab(icon: new Icon(Icons.shopping_basket)),
          ],
        ),
      ),
    );
  }
}
