import 'package:flutter/material.dart';

import 'provider.dart';
import 'bloc.dart';

// Daftar izin Usaha
class DaftarIzinUsaha extends StatefulWidget {

  // Initializing Provider (Event Handler)
  final DaftarIzinUsahaProvider izinUsahaProvider = new DaftarIzinUsahaProvider();

  // Initializing BLoC
  final DaftarIzinUsahaBloc izinUsahaBloc = new DaftarIzinUsahaBloc();

  @override
  _DaftarIzinUsahaState createState() => _DaftarIzinUsahaState();
}

class _DaftarIzinUsahaState extends State<DaftarIzinUsaha> {

  final TextEditingController namaController = new TextEditingController();
  final TextEditingController nikController = new TextEditingController();
  final TextEditingController namaUsahaController = new TextEditingController();
  final TextEditingController deskripsiUsahaController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed:(){
            Navigator.pop(context);
          },
        ),
        title: new Text(
          "Layanan",
          style: new TextStyle(
            fontSize: 15
          ),
        ),
      ),
      body: new Container(
        child: new Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: new ListView(
              children: <Widget>[

                new Text(
                  "Daftar Izin Usaha",
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 25.0
                  ),
                ),

                new Padding(padding: new EdgeInsets.only(top:15),),
                
                // Untuk Nama
                new TextField(
                  controller: this.namaController,
                  decoration: new InputDecoration(
                    labelText: "Nama",
                    enabledBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(7),
                      borderSide: new BorderSide(color: Colors.lightBlue)
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(7),
                      borderSide: new BorderSide(color: Colors.lightBlue)
                    ),
                    suffix: new Icon(
                      Icons.person,
                      color: Colors.lightBlue,
                    )
                  ),
                ),

                new Padding(padding: new EdgeInsets.only(top:15),),
                // Untuk NIK
                new TextField(
                  controller: this.nikController,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    labelText: "NIK",
                    enabledBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(7),
                      borderSide: new BorderSide(color: Colors.lightBlue)
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(7),
                      borderSide: new BorderSide(color: Colors.lightBlue)
                    ),
                    suffix: new Icon(
                      Icons.looks_one,
                      color: Colors.lightBlue,
                    )
                  ),
                ),

                new Padding(padding: new EdgeInsets.only(top:15),),
                // Untuk Nama Usaha
                new TextField(
                  controller: this.namaUsahaController,
                  decoration: new InputDecoration(
                    labelText: "Nama Usaha",
                    enabledBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(7),
                      borderSide: new BorderSide(color: Colors.lightBlue)
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(7),
                      borderSide: new BorderSide(color: Colors.lightBlue)
                    ),
                    suffix: new Icon(
                      Icons.location_city,
                      color: Colors.lightBlue,
                    )
                  ),
                ),

                new Padding(padding: new EdgeInsets.only(top:15),),

                // Untuk Deskripsi Usaha
                new TextField(
                  controller: this.deskripsiUsahaController,
                  decoration: new InputDecoration(
                    labelText: "Deskripsi Usaha",
                    enabledBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(7),
                      borderSide: new BorderSide(color: Colors.lightBlue)
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(7),
                      borderSide: new BorderSide(color: Colors.lightBlue)
                    ),
                    suffix: new Icon(
                      Icons.bubble_chart,
                      color: Colors.lightBlue,
                    )
                  ),
                ),

                new Padding(padding: new EdgeInsets.only(top:15),),

                new RaisedButton(
                  color: Colors.lightBlue,
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25)),
                  splashColor: Colors.white,
                  child: new Text(
                    "Kirim",
                    style: new TextStyle(
                      color: Colors.white
                    ),
                    ),
                  onPressed:(){
                    if(this.namaController.text == '' || this.nikController.text == '' || this.namaUsahaController.text == '' || this.deskripsiUsahaController.text == ''){
                        return showDialog(
                          context: context,
                          barrierDismissible:true,
                          builder: (context){
                            return new AlertDialog(
                              title: new Text("Form Tidak Valid"),
                              content: new Container(
                                child: new Text("Form harus terisi"),
                              )
                            );
                          }
                        );
                    } else {
                      this.widget.izinUsahaBloc.postIzinUsaha(
                        namaPemohon: this.namaController.text,
                        nomorInduk: this.nikController.text,
                        namaUsaha: this.namaUsahaController.text,
                        deskripsiUsaha: this.deskripsiUsahaController.text
                      );
                      return showDialog(
                          context: context,
                          barrierDismissible:true,
                          builder: (context){
                            return new AlertDialog(
                              title: new Text("Berhasil dibuat"),
                              content: new Container(
                                child: new Text(
                                  "Nama : ${this.namaController.text}\nNIK : ${this.nikController.text}"
                                ),
                              )
                            );
                          }
                        );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CostumDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20)),
      child: new Column(
        children: <Widget>[
          new Text("OKE MANTAP"),
          new RaisedButton(
            child: new Text("Back"),
            onPressed: (){
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}