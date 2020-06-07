import 'package:flutter/material.dart';
import './detailproduk.dart';

class Listproduk extends StatefulWidget {
  @override
  _ListprodukState createState() => _ListprodukState();
}

class _ListprodukState extends State<Listproduk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black54,
        appBar:
            AppBar(backgroundColor: Colors.black54, title: Text("LIST PRODUK")),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
          children: <Widget>[
            new GestureDetector(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => DetailProduk(
                    name: "pure hand sanitizer",
                    description:
                        "Ini adalah produk pembersih tanganyang sangat ampuh , menghilangkan 99% bakteri",
                    price: 15000,
                    image: "purehand.jpg",
                    star: 5,
                  ),
                ));
              },
              child: ProductBox(
                name: "pure hand sanitizer",
                description: "Ini adalah hand sanitizer",
                price: 15000,
                image: "purehand.jpg",
              ),
            ),
            new GestureDetector(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => DetailProduk(
                    name: "Manorm hand sanitizer ",
                    description:
                        "Ini adalah laptop Manorm hand sanitizer yang terbukti membersihkan 98% kuman",
                    price: 15000,
                    image: "manormhand.jpg",
                    star: 5,
                  ),
                ));
              },
              child: ProductBox(
                name: "Manorm hand sanitizer ",
                description: "Ini adalah Hand Sanitizer",
                price: 15000,
                image: "manormhand.jpg",
                star: 5,
              ),
            ),
          ],
        ));
  }
}

class ProductBox extends StatelessWidget {
  ProductBox(
      {Key key, this.name, this.description, this.price, this.image, this.star})
      : super(key: key);

  final String name;
  final String description;
  final int price;
  final String image;
  final int star;

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      height: 120,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(
              "assets/appimages/" + image,
              width: 50,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      this.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(this.description),
                    Text(
                      "Price: " + this.price.toString(),
                      style: TextStyle(color: Colors.red),
                    ),
                    Row(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(Icons.star,
                                size: 10, color: Colors.deepOrange),
                            Icon(Icons.star,
                                size: 10, color: Colors.deepOrange),
                            Icon(Icons.star,
                                size: 10, color: Colors.deepOrange),
                            Icon(Icons.star, size: 10, color: Colors.orange),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
