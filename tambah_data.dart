import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TambahData extends StatefulWidget {
  @override
  _TambahDataState createState() => _TambahDataState();
}

class _TambahDataState extends State<TambahData> {
  TextEditingController namaproduk = TextEditingController();
  TextEditingController jumlahproduk = TextEditingController();
  String _minuman;
  List _kategori = ["Botol", "Cup", "Galon"];

  void simpanData() {
    Navigator.pop(context, {
      'produk': namaproduk.text,
      'qty': jumlahproduk.text,
      'kategori': _minuman != null ? _minuman : 'kategori Kosong'
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Suplier Minuman"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
          Radius.circular(15),
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Padding(padding: new EdgeInsets.only(top: 15.0)),
            TextField(
              controller: jumlahproduk,
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                  hintText: "jumlah produk",
                  labelText: "jumlah",
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(8.0),
                  )),
            ),
            new Padding(padding: new EdgeInsets.only(top: 15.0)),
            TextField(
              controller: namaproduk,
              decoration: new InputDecoration(
                  hintText: "nama produk",
                  labelText: "nama",
                  border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(8.0))),
            ),
            new Padding(padding: new EdgeInsets.only(top: 15.0)),
            Row(
              children: <Widget>[
                new Text(
                  "kategori   : ",
                  style: new TextStyle(fontSize: 20.0, color: Colors.grey),
                ),
                DropdownButton(
                  items: _kategori.map((value) {
                    return DropdownMenuItem(
                      child: Text(value),
                      value: value,
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _minuman = value;
                    });
                  },
                  value: _minuman,
                  hint: Text('Pilih'),
                ),
              ],
            ),
            new Padding(padding: new EdgeInsets.only(top: 35.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  color: Colors.greenAccent,
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                  child: Text("Simpan"),
                  onPressed: () {
                    simpanData();
                  },
                ),
                RaisedButton(
                  color: Colors.redAccent,
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Batal'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
