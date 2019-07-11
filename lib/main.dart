import 'package:flutter/material.dart';

import './IzinUsaha/ui.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List daftarPelayanan=[
    {'nama':'Administrasi Kependudukan','gambar':'asset/img/planning.png','widget':new Layanan()},
    {'nama':'Permohonan SKCK','gambar':'asset/img/population.png','widget':new Layanan()},
    {'nama':'Permohonan SKTM','gambar':'asset/img/permission.png','widget':new Layanan()},
    {'nama':'Perizinan Usaha','gambar':'asset/img/money.png','widget':new IzinUsaha()},
    {'nama':'Pembayaran PBB','gambar':'asset/img/group.png','widget':new Layanan()},
    {'nama':'Perizinan Acara','gambar':'asset/img/permission.png','widget':new Layanan()},
    {'nama':'Izin Mendirikan Bangunan','gambar':'asset/img/planning.png','widget':new Layanan()},
    {'nama':'Perizinan Pemerintah','gambar':'asset/img/money.png','widget':new Layanan()},
    {'nama':'Perizinan Sosial Masyarakat','gambar':'asset/img/population.png','widget':new Layanan()},
    {'nama':'Perizinan Sosial Masyarakat','gambar':'asset/img/group.png','widget':new Layanan()},
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        leading: new Icon(Icons.backspace),
        title: new Text(
          "Layanan Kecamatan Sumur Bandung",
          style: new TextStyle(
            fontSize: 11
          ),
        ),
      ),
      body: new GridView.builder(
        itemCount: this.daftarPelayanan.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2
        ),
        itemBuilder: (context,i){
          return new Container(
            child: new GestureDetector(
              onTap: (){
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context)=>this.daftarPelayanan[i]['widget']
                ));
              },
              child: new Card(
                elevation: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Image.asset(
                      this.daftarPelayanan[i]['gambar'].toString(),
                      width: 50,
                      height: 50,
                      ),
                    new Text(
                      this.daftarPelayanan[i]['nama'],
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Layanan extends StatefulWidget {
  @override
  _LayananState createState() => _LayananState();
}

class _LayananState extends State<Layanan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        leading: new Icon(Icons.home),
      ),
      body: new Container(
        child:new Text("DETAIL PAGE")
      ),
    );
  }
}