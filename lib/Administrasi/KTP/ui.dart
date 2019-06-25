import 'package:flutter/material.dart';

import 'provider.dart';
import 'bloc.dart';

import './DaftarKTP/ui.dart';

class KTP extends StatefulWidget {

  // Initializing Provider
  final KTPProvider ktpProvider = new KTPProvider();

  // Initalizing BLoC
  final KTPBloc ktpBloc = new KTPBloc();

  @override
  _KTPState createState() => _KTPState();
}

class _KTPState extends State<KTP> {

  @override
  void initState() {
    this.widget.ktpBloc.getPendudukData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Daftar Penduduk",
          style: new TextStyle(
            fontSize: 21
          ),
        ),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: new RefreshIndicator(
        onRefresh: this.widget.ktpBloc.getPendudukData,
        child: new StreamBuilder(
          stream: this.widget.ktpBloc.ktpStream,
          initialData: this.widget.ktpProvider.dataPenduduk,
          builder: (context,snapshot){
            if(snapshot.data == null){
              return new Container(
                child: new Center(
                  child: new CircularProgressIndicator(),
                ),
              );
            } else {
              return new ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context,i){
                  return new ListTile(
                    leading: new Icon(Icons.person),
                    title: new Text(snapshot.data[i]['nama']),
                    subtitle: new Text(snapshot.data[i]['tanggal_lahir']),
                  );
                },
              );
            }
          },
        ),
      ),
      floatingActionButton: new FloatingActionButton.extended(
        label: new Text("Buat KTP"),
        onPressed: (){
          Navigator.of(context).push(new MaterialPageRoute(
            builder: (context)=>new DaftarKTP()
          ));
        },
      ),
    );
  }
}