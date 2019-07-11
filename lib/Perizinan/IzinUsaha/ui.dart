import 'package:flutter/material.dart';

import './provider.dart';
import './bloc.dart';

import './DaftarIzinUsaha/DetailTerdaftar/ui.dart';
import './DaftarIzinUsaha/ui.dart';

class IzinUsaha extends StatefulWidget {

  // Initializing Provider (Event Handler)
  final IzinUsahaProvider izinUsahaProvider = new IzinUsahaProvider();

  // Initializing BLoC
  final IzinUsahaBloc izinUsahaBloc = new IzinUsahaBloc();

  
  @override
  _IzinUsahaState createState() => _IzinUsahaState();
}

class _IzinUsahaState extends State<IzinUsaha> {

  @override
  void initState() {
    this.widget.izinUsahaBloc.getIzinUsahaData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.home),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: new Text(
          "Daftar Pemilik Usaha",
          style: new TextStyle(
            fontSize: 14
          ),
        ),
      ),
      body: new StreamBuilder(
        initialData: this.widget.izinUsahaProvider.dataIzinUsaha,
        stream: this.widget.izinUsahaBloc.izinUsahaStream,
        builder: (context,snapshot){
          var items=snapshot.data.reversed.toList();
          if(snapshot.data.length == 0){
            return new Container(
              child: new Center(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new CircularProgressIndicator(),
                  ],
                ),
              ),
            );
          } else {
            return new RefreshIndicator(
              onRefresh: this.widget.izinUsahaBloc.getIzinUsahaData,
              child: new ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context,i){
                  return new ListTile(
                    leading: new CircleAvatar(
                      backgroundImage: new NetworkImage('http://172.16.17.155:8000${items[i]['foto']}'),
                    ),
                    title: new Text("Nama : "+items[i]['nama_pemohon']),
                    subtitle: new Text("NIK : "+items[i]['nomor_induk'].toString()),
                    trailing: new IconButton(
                      icon: new Icon(Icons.delete),
                      onPressed: (){
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (context){
                            return new Dialog(
                              child: new Container(
                                width: 65,
                                height: 100,
                                padding: new EdgeInsets.all(8),
                                child: new Center(
                                  child: new Column(
                                    children: <Widget>[
                                      new Text("Yakin di hapus?"),
                                      new RaisedButton(
                                        color: Colors.red,
                                        child: new Text("Ya"),
                                        onPressed: (){
                                          this.widget.izinUsahaBloc.deleteIzinUsaha(
                                            idPemohon: items[i]['id']
                                          );
                                          Navigator.pop(context);
                                          this.widget.izinUsahaBloc.getIzinUsahaData();
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                        );
                      },
                      color: Colors.red,
                      splashColor: Colors.lightBlueAccent
                    ),
                    onTap: (){
                      Navigator.of(context).push(new MaterialPageRoute(
                        builder: (context)=>new DetailTerdaftar(
                          namaPemohon: items[i]['nama_pemohon'],
                          namaUsaha: items[i]['nama_usaha'],
                          deskripsiUsaha: items[i]['deskripsi_usaha'],
                          nomorInduk: items[i]['nomor_induk'],
                          verifikasi: items[i]['verifikasi'],
                          foto: 'http://172.16.17.155:8000${items[i]['foto']}',
                        )
                      ));
                    },
                  );
                },
              ),
            );
          }
        },
      ),
      floatingActionButton: new FloatingActionButton.extended(
        label: new Text("daftar"),
        onPressed: (){
          Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context)=>new DaftarIzinUsaha()
          ));
        },
        elevation: 8,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

