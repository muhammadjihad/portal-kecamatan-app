import 'package:flutter/material.dart';

import './KTP/ui.dart';

class Administrasi extends StatelessWidget {
  final List administrasiMenu=[
    {'nama':'Kartu Tanda Penduduk','components':new KTP()},
    {'nama':'Kartu Keluarga','components':new KTP()},
    {'nama':'Surat Keterangan Tak Mampu','components':new KTP()},
    {'nama':'Surat Keterangan Catatan Kepolisian','components':new KTP()},
    {'nama':'Surat Keterangan Menikah','components':new KTP()},
    {'nama':'Surat Keterangan Ahli Waris','components':new KTP()},
    {'nama':'Surat Ketarangan Hibah','components':new KTP()},
    {'nama':'Surat Keterangan Gaib','components':new KTP()},
  ];

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
          "Menu Layanan Administrasi"
        ),
      ),
      body: new GridView.builder(
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2
        ),
        itemCount: this.administrasiMenu.length,
        itemBuilder: (context,i){
          return new GestureDetector(
            onTap: (){
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (context)=>this.administrasiMenu[i]['components']
              ));
            },
            child: new Container(
              child: new Card(
                child: new Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Image.asset(
                          'asset/img/population.png',
                          width: 50,
                          height: 50,
                        ),
                        new SizedBox(
                          height: 15,
                        ),
                        new Text(
                          this.administrasiMenu[i]['nama'],
                          style: new TextStyle(
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      )
    );
  }
}