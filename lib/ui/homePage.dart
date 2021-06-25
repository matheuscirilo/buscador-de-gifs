import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _search;
  int _offset = 0;

  Future<Map> _getGifs() async {
    http.Response response;

    if (_search == null) {
      response = await http.get(
          "https://api.giphy.com/v1/gifs/trending?api_key=5UUgUlP0EBLQa31ps3TJ8vs2Bx9qSm2C&limit=24&rating=g");
    } else {
      response = await http.get(
          "https://api.giphy.com/v1/gifs/search?api_key=5UUgUlP0EBLQa31ps3TJ8vs2Bx9qSm2C&q=$_search&limit=24&offset=$_offset&rating=g&lang=en");
    }
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
    _getGifs().then((map) => print(map));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.network("https://s2.glbimg.com/Qsd53jEagAEBkjml9OgaEpAH8H4=/696x390/top/smart/s2.glbimg.com/z2PAq6BiyWDJ7hNdPx0QgH5G_Yo=/0x96:695x579/695x483/s.glbimg.com/po/tt2/f/original/2015/05/31/nyan2.gif"),
        centerTitle: true,
      ),
    );
  }
}
