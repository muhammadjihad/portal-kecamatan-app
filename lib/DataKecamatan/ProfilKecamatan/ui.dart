import 'package:flutter/material.dart';

class ProfilKecamatan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: new Text(
          "Kecamatan Sumur Bandung",
          style: new TextStyle(
            fontSize: 16
          ),
        ),
      ),
      body: new Container(
        child: new Center(
          child: new ListView(
            children: <Widget>[
              new Container(
                child: new Image.asset('asset/img/kantorkecamatan.jpg'),
              ),

              new SizedBox(
                height: 20,
              ),

              new Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  new Container(
                    decoration: new BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: new BorderRadius.circular(4)
                    ),
                    padding: new EdgeInsets.all(4),
                    child: new Text(
                      "Selamat Datang",
                      style: new TextStyle(
                        color:Colors.white
                      ),
                    ),
                  )
                ],
              ),

              new SizedBox(
                height: 15,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Container(
                  color: Colors.lightBlue,
                  padding: new EdgeInsets.all(15),
                  child: new Text("Kecamatan Sumur Bandung adalah salah satu kecamatan tertua di Kota Bandung. Batas wilayah dan jumlah kelurahan di Kecamatan Sumur Bandung pada awalnya ditetapkan berdasarkan pada PP Nomor 16 Tahun 1987 tentang perubahan Batas Wilayah Kotamadya Daerah Tingkat Bandung dan Kabupaten Daerah Tingkat II Bandung dan kemudian diperbaharui melalui penetapan berdasarkan pada Peraturan Daerah Nomor 6 Tahun 2006 tentang Pemekaran dan Pembentukan wilayah Kerja Kecamatan dan Kelurahan di Lingkungan Kota Bandung.",textAlign: TextAlign.justify,),
                ),
              )

            ],
          ),
        )
      ),
    );
  }
}