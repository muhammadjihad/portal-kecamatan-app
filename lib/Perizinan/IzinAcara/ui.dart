import 'package:flutter/material.dart';

import './ListAcara/ui.dart';
import './ListAcara/DaftarAcara/ui.dart';

class IzinAcara extends StatelessWidget {

  final List menuIzinAcara=[
    {'nama':'Pengajuan Izin Acara','component':new DaftarAcara(),'icon':Icons.description},
    {'nama':'Lihat Jadwal Acara','component':new ListIzinAcara(),'icon':Icons.calendar_today}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Layanan Kegiatan daerah Kecamatan",
          style:new TextStyle(
            fontSize: 15
          )
        ),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        )
      ),
      body: new GridView.builder(
        itemCount: this.menuIzinAcara.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2
        ),
        itemBuilder: (context,i){
          return new GestureDetector(
            onTap: (){
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (context)=>this.menuIzinAcara[i]['component']
              ));
            },
            child: new Container(
              child: new Card(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Icon(
                      this.menuIzinAcara[i]['icon'],
                      color: Colors.blue,
                    ),
                    new SizedBox(
                      height: 15,
                    ),
                    new Text(this.menuIzinAcara[i]['nama']),
                  ],
                ),
              ),
            ),
          );
        },
      )
    );
  }
}