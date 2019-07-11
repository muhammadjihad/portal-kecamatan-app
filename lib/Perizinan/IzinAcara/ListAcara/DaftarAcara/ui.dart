import 'package:flutter/material.dart';

import 'provider.dart';
import 'bloc.dart';

class DaftarAcara extends StatefulWidget {

  // Initializing Provider
  final DaftarAcaraProvider daftarAcaraProvider = new DaftarAcaraProvider();

  // Initializing BLoC
  final DaftarAcaraBloc daftarAcaraBloc = new DaftarAcaraBloc();

  @override
  _DaftarAcaraState createState() => _DaftarAcaraState();
}

class _DaftarAcaraState extends State<DaftarAcara> {

  DateTime date;
  TimeOfDay time;
  final TextEditingController namaKegiatanController = new TextEditingController();
  final TextEditingController deskripsiKegiatanController = new TextEditingController();
  final TextEditingController tempatKegiatanController =new TextEditingController();
  final TextEditingController namaKetuaPanitiaController = new TextEditingController();

  Future<void> getDate() async{
    final dateResult=await showDatePicker(
      context: context,
      initialDate:DateTime.now(),
      firstDate:DateTime(1965),
      lastDate:DateTime.now().add( Duration(days: 30)),
    );
    setState(() {
     this.date=dateResult; 
    });
  }

  Future<void> getTime() async{
    final timeResult=await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 5,minute: 20)
    );
    setState(() {
     this.time=timeResult; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon:new Icon(Icons.arrow_back),
          onPressed: ()=>Navigator.pop(context),
        ),
        title: new Text(
          "Pendaftaran Izin Acara"
        ),
      ),
      body: new Container(
        child: new Center(
          child: new Padding(
            padding: new EdgeInsets.all(8),
            child: new ListView(
              children: <Widget>[
                new TextField(
                  controller: this.namaKegiatanController,
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(
                        color: Colors.blue
                      )
                    ),
                    enabledBorder: new OutlineInputBorder(
                      borderSide: new BorderSide(
                        color: Colors.blue
                      )
                    ),
                    labelText: "Nama Kegiatan",
                    labelStyle: new TextStyle(
                      color: Colors.blue
                    ),
                    prefixIcon: new Icon(
                      Icons.accessibility_new,
                      color: Colors.orange,
                    ),
                    helperText: "Masukkan Nama Kegiatan yang akan dilakukan"
                  ),
                ),
                new SizedBox(
                  height: 20,
                ),

                new TextField(
                  controller: this.deskripsiKegiatanController,
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(
                        color: Colors.blue
                      )
                    ),
                    enabledBorder: new OutlineInputBorder(
                      borderSide: new BorderSide(
                        color: Colors.blue
                      )
                    ),
                    labelText: "Deskripsi Kegiatan",
                    labelStyle: new TextStyle(
                      color: Colors.blue
                    ),
                    prefixIcon: new Icon(
                      Icons.explore,
                      color: Colors.orange,
                    ),
                    helperText: "Jelaskan mengenai kegiatan yang akan dilakukan"
                  ),
                ),
                new SizedBox(
                  height: 20,
                ),

                new IntrinsicHeight(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Expanded(
                        child: new Container(
                          child: Column(
                            children: <Widget>[
                              new Icon(
                                Icons.calendar_today,
                                color: Colors.orange,
                              ),
                              new Text(
                                "Tanggal Pelaksanaan",
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),

                      new Expanded(
                        child: new Container(
                          child: Column(
                            children: <Widget>[
                              new RaisedButton(
                                shape: new RoundedRectangleBorder(),
                                color: Colors.lightBlue,
                                child: new Text(
                                  "Pilih Tanggal",
                                  style: new TextStyle(
                                    color:Colors.white,
                                  ),
                                ),
                                onPressed: (){
                                  this.getDate();
                                },
                              ),
                              new Text(
                                this.date == null
                                ? "Belum memilih tanggal"
                                : "${this.date.day.toString()} - ${this.date.month.toString()} - ${this.date.year.toString()}"
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                new SizedBox(
                  height: 15,
                ),

                new IntrinsicHeight(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Expanded(
                        child: new Container(
                          child: Column(
                            children: <Widget>[
                              new Icon(
                                Icons.access_time,
                                color: Colors.orange,
                              ),
                              new Text(
                                "Waktu Pelaksanaan",
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),

                      new Expanded(
                        child: new Container(
                          child: Column(
                            children: <Widget>[
                              new RaisedButton(
                                shape: new RoundedRectangleBorder(),
                                color: Colors.lightBlue,
                                child: new Text(
                                  "Pilih Waktu",
                                  style: new TextStyle(
                                    color:Colors.white,
                                  ),
                                ),
                                onPressed: (){
                                  this.getTime();
                                },
                              ),
                              new Text(
                                this.time == null
                                ? "Belum memilih waktu"
                                : "${this.time.hour.toString()}:${this.time.minute.toString()}"
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                new SizedBox(
                  height: 15,
                ),

                new TextField(
                  controller: this.tempatKegiatanController,
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(
                        color: Colors.blue
                      )
                    ),
                    enabledBorder: new OutlineInputBorder(
                      borderSide: new BorderSide(
                        color: Colors.blue
                      )
                    ),
                    labelText: "Tempat Kegiatan",
                    labelStyle: new TextStyle(
                      color: Colors.blue
                    ),
                    prefixIcon: new Icon(
                      Icons.location_on,
                      color: Colors.orange,
                    ),
                    helperText: "Masukkan nama tempat berlangsungnya kegiatan"
                  ),
                ),
                new SizedBox(
                  height: 20,
                ),

                new TextField(
                  controller: this.namaKetuaPanitiaController,
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(
                        color: Colors.blue
                      )
                    ),
                    enabledBorder: new OutlineInputBorder(
                      borderSide: new BorderSide(
                        color: Colors.blue
                      )
                    ),
                    labelText: "Nama Penanggung Jawab Kegiatan",
                    labelStyle: new TextStyle(
                      color: Colors.blue
                    ),
                    prefixIcon: new Icon(
                      Icons.person,
                      color: Colors.orange,
                    ),
                    helperText: "Masukkan nama lengkap penanggung jawab kegiatan"
                  ),
                ),
                new SizedBox(
                  height: 20,
                ),

                new RaisedButton(
                  child: new Text(
                    "Kirim",
                    style:new TextStyle(
                      color: Colors.white
                    )
                  ),
                  onPressed: (){
                    showDialog(
                      context: context,
                      builder: (context){
                        return new Dialog(
                          child: new Container(
                            padding: new EdgeInsets.all(8),
                            height: 80,
                            child: new Column(
                              children: <Widget>[
                                new Text("Yakin?"),
                                new RaisedButton(
                                  child: new Text("Kirim"),
                                  onPressed: (){
                                    this.widget.daftarAcaraBloc.postDaftarAcara(
                                      namaKegiatan: this.namaKegiatanController.text,
                                      deskripsiKegiatan: this.deskripsiKegiatanController.text,
                                      tanggalKegiatan: this.date.toString(),
                                      waktuKegiatan:this.time.hour.toString().length == 1
                                      ? "0${this.time.hour.toString()}:${this.time.minute.toString()}"
                                      :"${this.time.hour.toString()}:${this.time.minute.toString()}",
                                      tempatKegiatan: this.tempatKegiatanController.text,
                                      namaKetuaPanitia: this.namaKetuaPanitiaController.text
                                    );
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            ),
                          ),
                        );
                      }
                    );
                  },
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}