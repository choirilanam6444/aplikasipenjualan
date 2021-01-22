import 'dart:io';

import 'package:flutter/material.dart';

class ReadData extends StatelessWidget {
  final String rproduk;
  final String rqty;
  final String rKategori;
  final File gambar;

  const ReadData(
      {Key key, this.rproduk, this.rqty, this.rKategori, this.gambar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Data Suplai"),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('nama produk : ' +
                rproduk +
                ' jumlah produk  : ' +
                rqty +
                ' Kategori : ' +
                rKategori),
          ],
        ),
      ),
    );
  }
}
