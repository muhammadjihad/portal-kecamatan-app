import 'package:flutter/material.dart';

import 'provider.dart';
import 'bloc.dart';

import './DetailAcara/ui.dart';

class ListIzinAcara extends StatefulWidget {
  // Initializing Provider
  final ListAcaraProvider listAcaraProvider = new ListAcaraProvider();

  // Initializing BLoC
  final ListAcaraBloc listAcaraBloc = new ListAcaraBloc();

  @override
  _ListIzinAcaraState createState() => _ListIzinAcaraState();
}

class _ListIzinAcaraState extends State<ListIzinAcara> {
  String dropdownValue = 'Semua';

  @override
  void initState() {
    this.widget.listAcaraBloc.getListAcara();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Jadwal Acara Kecamatan Sumur Bandung",
          style: new TextStyle(fontSize: 15),
        ),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          new DropdownButton(
            value: this.dropdownValue,
            items: <String>['Semua', 'Terverifikasi']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem(
                value: value,
                child: new Container(
                  child: new Text(value,
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        color: Colors.lime,
                      )),
                ),
              );
            }).toList(),
            onChanged: (value) {
              if (value == 'Semua') {
                this.widget.listAcaraBloc.getListAcara();
                this.setState(() {
                  this.dropdownValue = value;
                });
              } else {
                this.widget.listAcaraBloc.getListAcaraFilter();
                this.setState(() {
                  this.dropdownValue = value;
                });
              }
            },
          ),
        ],
      ),
      body: new RefreshIndicator(
        onRefresh: this.widget.listAcaraBloc.getListAcara,
        child: new StreamBuilder(
          initialData: this.widget.listAcaraProvider.listAcara,
          stream: this.widget.listAcaraBloc.listAcaraStream,
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return new Container(
                child: new Center(child: new CircularProgressIndicator()),
              );
            } else {
              return new GridView.builder(
                itemCount: snapshot.data.length,
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, i) {
                  return new GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => new DetailAcara(
                                namaKegiatan: snapshot.data[i]['nama_kegiatan'],
                                deskripsiKegiatan: snapshot.data[i]
                                    ['deskripsi_kegiatan'],
                                waktuKegiatan: snapshot.data[i]
                                    ['waktu_kegiatan'],
                                tanggalKegiatan: snapshot.data[i]
                                    ['tanggal_kegiatan'],
                                tempatKegiatan: snapshot.data[i]
                                    ['tempat_kegiatan'],
                                approveKecamatan: snapshot.data[i]
                                    ['approve_kecamatan'],
                                namaKetuaPanitia: snapshot.data[i]
                                    ['nama_ketuapanitia'],
                              )));
                    },
                    child: new Container(
                      padding: new EdgeInsets.all(2),
                      child: new Card(
                          elevation: 9,
                          child: new Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: new Center(
                              child: new ListView(
                                shrinkWrap: true,
                                children: <Widget>[
                                  new Icon(
                                    Icons.calendar_today,
                                    color: snapshot.data[i]['approve_kecamatan']
                                        ? Colors.green
                                        : Colors.red,
                                    size: 20,
                                  ),
                                  new SizedBox(height: 10),
                                  new Text(
                                    snapshot.data[i]['nama_kegiatan'],
                                    textAlign: TextAlign.center,
                                    style: new TextStyle(fontSize: 15),
                                  ),
                                  new SizedBox(height: 15),
                                  new Text(
                                      snapshot.data[i]['tanggal_kegiatan']),
                                  new SizedBox(height: 10),
                                  new Text(
                                      "${snapshot.data[i]['waktu_kegiatan']} -  Selesai"),
                                  new SizedBox(height: 10),
                                  new Text(
                                    snapshot.data[i]['tempat_kegiatan'],
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
