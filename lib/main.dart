import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import './Perizinan/ui.dart';
import './Administrasi/ui.dart';
import './DataKecamatan/ui.dart';

import './Perizinan/IzinAcara/ListAcara/ui.dart';
import './Perizinan/IzinAcara/ListAcara/DetailAcara/ui.dart';
import './Perizinan/IzinUsaha/ui.dart';

import './DataKecamatan/ProfilKecamatan/ui.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new HomePage(),
      theme: new ThemeData(
          buttonColor: Colors.blue,
          textTheme: new TextTheme(button: new TextStyle(color: Colors.white))),
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
      body: new Container(child: new Text("DETAIL PAGE")),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List mainMenu = [
    {
      'nama': 'Administrasi Kependudukan',
      'gambar': 'asset/img/population.png',
      'widget': new Administrasi()
    },
    {
      'nama': 'Perizinan',
      'gambar': 'asset/img/permission.png',
      'widget': new PerizinanIndex()
    },
    {
      'nama': 'Data Kecamatan',
      'gambar': 'asset/img/planning.png',
      'widget': new DataKecamatanIndex()
    },
    {
      'nama': 'Jadwal Kegiatan',
      'gambar': 'asset/img/group.png',
      'widget': new ListIzinAcara()
    },
    {
      'nama': 'Daftar Usaha',
      'gambar': 'asset/img/money.png',
      'widget': new IzinUsaha()
    },
    {
      'nama': 'Profil Kecamatan',
      'gambar': 'asset/img/enterprise.png',
      'widget': new ProfilKecamatan()
    },
  ];

  List berita;

  Future<void> getBerita() async {
    http.Response data = await http
        .get('http://172.16.17.155:8000/layanan-api/perizinan-acara/list/?page=5');
    var jsonData = jsonDecode(data.body);
    setState(() {
      this.berita = jsonData['data'];
    });
  }

  @override
  void initState() {
    this.getBerita();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new Drawer(
        elevation: 8,
        child: new Container(
          child: Column(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountEmail: new Text("abbdurahmanj@gmail.com"),
                accountName: new Text("Muhammad Jihad"),
                currentAccountPicture:
                    new Image.asset('asset/img/population.png'),
              ),
            ],
          ),
        ),
      ),
      appBar: new AppBar(
        title: new Text("Main Menu"),
      ),
      body: Container(
        color: Colors.white70,
        child: new ListView(
          children: <Widget>[
            // Banner
            new Container(
                height: 200,
                padding: new EdgeInsets.symmetric(vertical: 9),
                child: new FutureBuilder(
                  initialData: this.berita,
                  builder: (context, snapshot) {
                    if (this.berita == null) {
                      return new Container(
                        child: new Center(
                          child: new CircularProgressIndicator(),
                        ),
                      );
                    } else {
                      return PageView.builder(
                        controller: new PageController(
                          viewportFraction: .9,
                          initialPage: 3
                        ),
                        itemCount: this.berita.length,
                        itemBuilder: (context, i) {
                          return new Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: new GestureDetector(
                              onTap:(){
                                Navigator.of(context).push(new MaterialPageRoute(
                                  builder: (BuildContext context)=>new DetailAcara(
                                    namaKegiatan: this.berita[i]['nama_kegiatan'],
                                    deskripsiKegiatan: this.berita[i]['deskripsi_kegiatan'],
                                    waktuKegiatan: this.berita[i]['waktu_kegiatan'],
                                    tanggalKegiatan: this.berita[i]['tanggal_kegiatan'],
                                    tempatKegiatan: this.berita[i]['tempat_kegiatan'],
                                    approveKecamatan: this.berita[i]['approve_kecamatan'],
                                    namaKetuaPanitia: this.berita[i]['nama_ketuapanitia'],
                                  )
                                ));
                              },
                                                          child: new Container(
                                decoration: new BoxDecoration(
                                    image: new DecorationImage(
                                      image: new AssetImage(
                                          'asset/img/rangkaianacara.jpg'),
                                      colorFilter: new ColorFilter.mode(
                                          Colors.black.withOpacity(.4),
                                          BlendMode.darken),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: new BorderRadius.circular(5),
                                ),
                                padding: new EdgeInsets.all(9),
                                child: Container(
                                  alignment: Alignment(0, 0),
                                  padding:
                                      new EdgeInsets.symmetric(horizontal: 5),
                                  child: new Text(
                                    this.berita[i]['nama_kegiatan'],
                                    textAlign: TextAlign.center,
                                    style: new TextStyle(
                                        color: Colors.white, fontSize: 17.5),
                                  ),
                                ),
                                height: 40,
                                width: 40,
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                )),
            new Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: new Divider(),
            ),

            new Stack(
              alignment: Alignment.center,
              children: <Widget>[
                new Material(
                  elevation: 7,
                  borderRadius: new BorderRadius.circular(4),
                  child: new Container(
                    decoration: new BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: new BorderRadius.circular(4)),
                    child: new Text(
                      "Layanan Kecamatan",
                      style: new TextStyle(color: Colors.white),
                    ),
                    padding: new EdgeInsets.all(8),
                  ),
                )
              ],
            ),

            // Menu Layanan
            Container(
              padding: new EdgeInsets.symmetric(horizontal: 9),
              child: new GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: this.mainMenu.length,
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, i) {
                  return new GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => this.mainMenu[i]['widget']));
                    },
                    child: new Container(
                      padding: new EdgeInsets.all(1),
                      child: new Card(
                        elevation: 4,
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Image.asset(
                              this.mainMenu[i]['gambar'],
                              height: 45,
                              width: 45,
                            ),
                            new SizedBox(
                              height: 15,
                            ),
                            new Text(this.mainMenu[i]['nama'],
                                textAlign: TextAlign.center)
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            new Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: new Divider(),
            ),

            new Stack(
              alignment: Alignment.center,
              children: <Widget>[
                new Material(
                  elevation: 7,
                  borderRadius: new BorderRadius.circular(4),
                  child: new Container(
                    decoration: new BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: new BorderRadius.circular(4)),
                    child: new Text(
                      "Eksplor Kecamatan",
                      style: new TextStyle(color: Colors.white),
                    ),
                    padding: new EdgeInsets.all(8),
                  ),
                )
              ],
            ),

            // Menu Info Info Kecamatan
            new Container(
                padding: new EdgeInsets.symmetric(horizontal: 9),
                child: new ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new Container(
                        child: new Column(
                          children: <Widget>[
                            new Card(
                              elevation: 6,
                              child: new Column(
                                children: <Widget>[
                                  new Container(
                                    height: 75,
                                    decoration: new BoxDecoration(
                                        image: new DecorationImage(
                                          image: new AssetImage(
                                              'asset/img/kantorkecamatan.jpg'),
                                          fit: BoxFit.fitWidth,
                                        ),
                                        borderRadius: new BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4))),
                                    padding: new EdgeInsets.all(4),
                                  ),
                                  Container(
                                    padding: new EdgeInsets.only(top: 5),
                                    child: new SizedBox(
                                      width: 50,
                                      height: 2,
                                      child: new Container(
                                          color: Colors.lightBlue),
                                    ),
                                  ),
                                  new Container(
                                      padding: new EdgeInsets.all(2),
                                      child: new Text(
                                        "Kecamatan Sumur Bandung adalah salah satu kecamatan tertua di Kota Bandung ...",
                                        style: new TextStyle(fontSize: 12),
                                      )),
                                ],
                              ),
                            ),
                            new Divider()
                          ],
                        ),
                      ),
                    ),
                    new Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new Container(
                        child: new Column(
                          children: <Widget>[
                            new Card(
                              elevation: 6,
                              child: new Column(
                                children: <Widget>[
                                  new Container(
                                    height: 75,
                                    decoration: new BoxDecoration(
                                        image: new DecorationImage(
                                          image: new AssetImage(
                                              'asset/img/tamanlalulintas.jpg'),
                                          fit: BoxFit.fitWidth,
                                        ),
                                        borderRadius: new BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4))),
                                    padding: new EdgeInsets.all(4),
                                  ),
                                  Container(
                                    padding: new EdgeInsets.only(top: 5),
                                    child: new SizedBox(
                                      width: 50,
                                      height: 2,
                                      child: new Container(
                                          color: Colors.lightBlue),
                                    ),
                                  ),
                                  new Container(
                                      padding: new EdgeInsets.all(2),
                                      child: new Text(
                                          "Kecamatan Sumur Bandung adalah salah satu kecamatan tertua di Kota Bandung ...")),
                                ],
                              ),
                            ),
                            new Divider()
                          ],
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
