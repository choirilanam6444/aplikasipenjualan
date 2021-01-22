import 'package:flutter/material.dart';

class EditList extends StatefulWidget {
  final String oldproduk;
  final String oldjumlah;
  final String oldkategori;

  const EditList({Key key, this.oldproduk, this.oldjumlah, this.oldkategori})
      : super(key: key);

  @override
  _EditListState createState() => _EditListState();
}

class _EditListState extends State<EditList> {
  TextEditingController txtproduk;
  TextEditingController txtjumlah;

  String _minuman;
  String odl;
  void oldData() {
    txtproduk = TextEditingController(text: widget.oldproduk);
    txtjumlah = TextEditingController(text: widget.oldjumlah);

    odl = widget.oldkategori;
  }

  List _kategori = ["Botol", "Cup", "Galon"];

  void simpanData() {
    Navigator.pop(context, {
      'produk': txtproduk.text,
      'qty': txtjumlah.text,
      'kategori': _minuman == null ? odl : _minuman
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    oldData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Suplai"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
          Radius.circular(15),
        )),
        child: Column(
          children: [
            TextField(
              controller: txtjumlah,
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                  hintText: "produk",
                  labelText: "judul produk",
                  border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(8.0))),
            ),
            new Padding(padding: new EdgeInsets.only(top: 15.0)),
            TextField(
              controller: txtproduk,
              decoration: new InputDecoration(
                  hintText: "produk",
                  labelText: "judul produk",
                  border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(8.0))),
            ),
            new Padding(padding: new EdgeInsets.only(top: 15.0)),
            Row(
              children: <Widget>[
                new Text(
                  "Kategori   : ",
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
                  hint: Text((odl == null) ? 'Pilih' : '$odl'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () {
                    simpanData();
                  },
                  child: Text('Simpan'),
                ),
                RaisedButton(
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
