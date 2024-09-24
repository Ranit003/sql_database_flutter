import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class view_data extends StatefulWidget {
  const view_data({super.key});

  @override
  State<view_data> createState() => _view_dataState();
}

class _view_dataState extends State<view_data> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Data")),
      body: ListView(),
    );
  }
}
