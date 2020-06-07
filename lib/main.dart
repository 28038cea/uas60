import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uas/ui/berandaadmin.dart';

import 'package:uas/member.dart';

void main() => runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Apotek',
      home: Member(),
    ));
