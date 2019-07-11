import 'package:flutter/material.dart';

import './IzinAcara/ui.dart';
import './IzinUsaha/ui.dart';

class PerizinanIndex extends StatelessWidget {
  final List menuPerizinan = [
    {
      'nama': 'Perizinan Usaha',
      'gambar': 'asset/img/money.png',
      'widget': new IzinUsaha()
    },
    {
      'nama': 'Perizinan Acara',
      'gambar': 'asset/img/permission.png',
      'widget': new IzinAcara()
    },
    {
      'nama': 'Pembayaran PBB',
      'gambar': 'asset/img/group.png',
      'widget': new Layanan()
    },
    {
      'nama': 'Izin Mendirikan Bangunan',
      'gambar': 'asset/img/planning.png',
      'widget': new Layanan()
    },
    {
      'nama': 'Perizinan Pemerintah',
      'gambar': 'asset/img/money.png',
      'widget': new Layanan()
    },
    {
      'nama': 'Perizinan Sosial Masyarakat',
      'gambar': 'asset/img/population.png',
      'widget': new Layanan()
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: new Text("Layanan Perizinan Online"),
      ),
      body: new GridView.builder(
        itemCount: this.menuPerizinan.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, i) {
          return new GestureDetector(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => this.menuPerizinan[i]['widget']));
            },
            child: new Container(
              child: new Card(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Image.asset(
                      this.menuPerizinan[i]['gambar'],
                      height: 35,
                      width: 35,
                    ),
                    new Text(
                      this.menuPerizinan[i]['nama'],
                      textAlign: TextAlign.center,
                    )
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

class Layanan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        leading: new Icon(Icons.home),
      ),
    );
  }
}
