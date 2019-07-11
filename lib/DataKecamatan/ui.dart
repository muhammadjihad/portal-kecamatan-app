import 'package:flutter/material.dart';

class DataKecamatanIndex extends StatelessWidget {

  final List menuData=[
    {'nama':'Jumlah Kepala Keluarga','icon':'asset/img/group.png'},
    {'nama':'Pegawai Kecamatan','icon':'asset/img/enterprise.png'},
    {'nama':'Jumlah Perumahan','icon':'asset/img/population.png'},
    {'nama':'Jumlah UKM/Perusahaan','icon':'asset/img/money.png'},
    {'nama':'Data Fasilitas Umum','icon':'asset/img/group.png'},
    {'nama':'Jumlah Laki Laki','icon':'asset/img/enterprise.png'},
    {'nama':'Jumlah Perempuan','icon':'asset/img/population.png'},
    {'nama':'Jumlah Anak Usia dibawah 17 Tahun','icon':'asset/img/money.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(
            Icons.arrow_back
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: new Text("Data Kecamatan"),
      ),
      body: new Container(
        child: new GridView.builder(
          itemCount: this.menuData.length,
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2
          ),
          itemBuilder: (context,i){
            return new Container(
              child: new Card(
                child: new Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Image.asset(
                        this.menuData[i]['icon'],
                        height: 40,
                        width: 40,
                      ),
                      new Text(
                        this.menuData[i]['nama'],
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}