import 'package:flutter/material.dart';

class DetailAcara extends StatelessWidget {

  final String namaKegiatan;
  final String deskripsiKegiatan;
  final String waktuKegiatan;
  final String tanggalKegiatan;
  final String tempatKegiatan;
  final bool approveKecamatan;
  final String namaKetuaPanitia;

  DetailAcara({
    this.namaKegiatan,
    this.deskripsiKegiatan,
    this.waktuKegiatan,
    this.tanggalKegiatan,
    this.tempatKegiatan,
    this.approveKecamatan,
    this.namaKetuaPanitia
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Detail Kegiatan"),
        elevation: 0,
        leading: new IconButton(
          icon:new Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: new Container(
        padding: new EdgeInsets.symmetric(horizontal: 15),
        color: Colors.lightBlue,
        child: new ListView(
          children: <Widget>[
            new SizedBox(
              height: 15,
            ),
            new Card(
              elevation: 10,
              child: new Container(
                padding: new EdgeInsets.all(15),
                color: Colors.white,
                child: new Text(
                  this.namaKegiatan,
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    fontSize: 25
                  ),
                ),
              ),
            ),

            new SizedBox(
              height: 15,
            ),
            new Card(
              elevation: 10,
              child: new Container(
                padding: new EdgeInsets.all(15),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[

                    // Kolom 1
                    Container(
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Icon(
                            Icons.calendar_today,
                            size: 35,
                            color: Colors.red,
                          ),
                          new Text(this.tanggalKegiatan)
                        ],
                      ),
                    ),

                    // Kolom 2
                    Container(
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Icon(
                            Icons.timelapse,
                            size: 35,
                            color: Colors.red,
                          ),
                          new Text("${this.waktuKegiatan} - Selesai")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            new SizedBox(
              height: .6,
            ),
            new Card(
              elevation: 10,
              child: new Container(
                padding: new EdgeInsets.all(15),
                color: Colors.white,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 50,
                    ),
                    new SizedBox(
                      height: 5,
                    ),
                    new Text(
                      this.tempatKegiatan,
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        fontSize: 17
                      ),
                    ),
                  ],
                )
              ),
            ),

            new SizedBox(
              height: 15,
            ),
            new Card(
              elevation: 10,
              child: new Container(
                padding: new EdgeInsets.all(15),
                color: Colors.white,
                child: new Text(
                  this.deskripsiKegiatan,
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    fontSize: 15
                  ),
                ),
              ),
            ),

            new SizedBox(
              height: 15,
            ),
            new Card(
              elevation: 10,
              child: new Container(
                padding: new EdgeInsets.all(15),
                color: Colors.white,
                child: new IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Expanded(
                        child: new Text(
                          "Nama Ketua Acara:\n${this.namaKetuaPanitia}",
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                            fontSize: 15
                          ),
                        ),
                      ),
                      new Expanded(
                        child: Column(
                          children: <Widget>[
                            new Text(
                              "Sudah Diketahui Kecamatan",
                              textAlign: TextAlign.center,
                            ),
                            this.approveKecamatan
                            ? new Icon(
                              Icons.check,
                              color: Colors.green,
                            )
                            : new Icon(
                              Icons.not_interested,
                              color: Colors.red,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}