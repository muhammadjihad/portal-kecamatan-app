import 'package:flutter/material.dart';

class DetailTerdaftar extends StatelessWidget {

  DetailTerdaftar({
    this.namaPemohon,
    this.nomorInduk,
    this.namaUsaha,
    this.deskripsiUsaha,
    this.verifikasi,
    this.foto,
  });

  final String namaPemohon;
  final int nomorInduk;
  final String namaUsaha;
  final String deskripsiUsaha;
  final bool verifikasi;
  final String foto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios),
          onPressed: ()=>Navigator.pop(context),
        ),
      ),
      body: Container(
        color: Colors.blue,
        child: new ListView(
          children: <Widget>[
            new SizedBox(
              height: 15,
            ),
            new Center(
              child: new Material(
                color: Colors.transparent,
                elevation: 15,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(50)
                ),
                child: new CircleAvatar(
                  maxRadius: 50,
                  backgroundImage: new NetworkImage(this.foto),
                ),
              ),
            ),
            new SizedBox(
              height: 35,
            ),

            new Padding(
              padding: new EdgeInsets.all(15),
              child: new Card(
                elevation: 9,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:<Widget>[
                      new Column(children: <Widget>[
                      new Text(
                        "Nama : ${this.namaPemohon}",
                        style: new TextStyle(
                          fontSize: 25
                        ),
                      ),
                      new Container(
                        height:2,
                        width:250,
                        color: Colors.lightBlue,
                      ),
                      new SizedBox(
                        height: 5,
                      ),
                      new Text("NIK : ${this.nomorInduk.toString()}")
                      ],),
                      this.verifikasi
                      ? new Icon(
                        Icons.check,
                        color: Colors.green,
                      )
                      : new Icon(
                        Icons.not_interested,
                        color: Colors.red,
                      )
                    ]
                  ),
                ),
              ),
            ),
            new SizedBox(
              height: 35,
            ),
            new Padding(
              padding: new EdgeInsets.all(15),
              child: new Card(
                elevation: 9,
                child: new Padding(
                  padding: new EdgeInsets.all(8),
                  child: new Column(
                    children: <Widget>[
                      new Text("Nama Perusahaan"),
                      new Text(
                        this.namaUsaha,
                        style: new TextStyle(
                          fontSize: 35
                        ),
                      ),
                      new Container(
                        height:2,
                        width:250,
                        color: Colors.lightBlue,
                      ),
                      new Text(this.deskripsiUsaha)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}