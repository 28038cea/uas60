import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uas/ui/berandaadmin.dart';
import 'package:uas/ui/beranda.dart';
import 'package:uas/member.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  TextEditingController usr = new TextEditingController();
  TextEditingController psw = new TextEditingController();

  String msg = '';
//Future<list> login() async{}
  Future<String> _login() async {
    final response =
        await http.post("http://192.168.43.219/apotek/login/login_api", body: {
      "username": usr.text,
      "password": psw.text,
    });

    var datauser = json.decode(response.body);
    //print data user
    if (datauser.length == 0) {
      setState(() {
        msg = datauser['msg'];
      });
    } else {
      if (datauser['level'] == "1") {
        //print("welcome admin");
        Navigator.pushReplacementNamed(context, '/BerandaAdmin');
      } else if (datauser['level'] == "2") {
        //print("welcome user");
        Navigator.pushReplacementNamed(context, '/Member');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.easeOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/uwu.jpg"),
            fit: BoxFit.cover,
            color: Colors.black54,
            colorBlendMode: BlendMode.darken,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size: 100.0,
              ),
              new Form(
                child: new Theme(
                  data: new ThemeData(
                      brightness: Brightness.dark,
                      primarySwatch: Colors.teal,
                      inputDecorationTheme: new InputDecorationTheme(
                          labelStyle: new TextStyle(
                              color: Colors.teal, fontSize: 15.0))),
                  child: new Container(
                    padding: const EdgeInsets.all(60.0),
                    child: new Column(
                      children: <Widget>[
                        new TextFormField(
                          controller: usr,
                          decoration: new InputDecoration(
                              labelText: "Enter Username",
                              hintText: "Username"),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        new TextFormField(
                          controller: psw,
                          decoration: new InputDecoration(
                            labelText: "Enter Password",
                            hintText: "Password",
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                        ),
                        new MaterialButton(
                          height: 40.0,
                          minWidth: 100.0,
                          onPressed: () {
                            _login();
                          },
                          color: Colors.teal,
                          textColor: Colors.white,
                          child: new Text("Login"),
                          splashColor: Colors.redAccent,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
