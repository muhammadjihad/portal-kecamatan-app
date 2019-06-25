import 'package:flutter/material.dart';

import 'provider.dart';
import 'bloc.dart';

class DaftarKTP extends StatefulWidget {

  // Initializing Provider
  final DaftarKTPProvider daftarKTPProvider = new DaftarKTPProvider();

  // Initializing BLoC
  final DaftarKTPBloc daftarKTPBloc = new DaftarKTPBloc();

  @override
  _DaftarKTPState createState() => _DaftarKTPState();
}

class _DaftarKTPState extends State<DaftarKTP> {

  final TextEditingController namaController = new TextEditingController();
  final TextEditingController nikController = new TextEditingController();
  final TextEditingController alamatController = new TextEditingController();
  final TextEditingController kotaKelahiranController = new TextEditingController();
  final TextEditingController pekerjaanController = new TextEditingController();

  var date;
  var agama = 'Islam';
  var statusKawin='Belum Menikah';
  var wargaNegara='WNI';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        leading:new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: ()=>Navigator.pop(context),
        )
      ),
      body: new Container(
        child: new Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: new ListView(
              children: <Widget>[

                // Input Nama
                new TextField(
                  controller: this.namaController,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                    labelText: "Nama Lengkap",
                    labelStyle: new TextStyle(
                      color: Colors.lightBlue
                    ),
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

                new SizedBox(
                  height: 15,
                ),

                // Input NIK
                new TextField(
                  controller: this.nikController,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    labelText: "NIK",
                    labelStyle: new TextStyle(
                      color: Colors.lightBlue
                    ),
                    enabledBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(7),
                      borderSide: new BorderSide(color: Colors.lightBlue)
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(7),
                      borderSide: new BorderSide(color: Colors.lightBlue)
                    ),
                    suffix: new Icon(
                      Icons.format_list_numbered_rtl,
                      color: Colors.lightBlue,
                    )
                  ),
                ),

                new SizedBox(
                  height: 15,
                ),

                // Input Alamat
                new TextField(
                  controller: this.alamatController,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                    labelText: "Alamat",
                    labelStyle: new TextStyle(
                      color: Colors.lightBlue
                    ),
                    enabledBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(7),
                      borderSide: new BorderSide(color: Colors.lightBlue)
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(7),
                      borderSide: new BorderSide(color: Colors.lightBlue)
                    ),
                    suffix: new Icon(
                      Icons.location_on,
                      color: Colors.lightBlue,
                    )
                  ),
                ),

                new SizedBox(
                  height: 15,
                ),

                // Input Kota Kelahiran
                new TextField(
                  controller: this.kotaKelahiranController,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                    labelText: "Kota Kelahiran",
                    labelStyle: new TextStyle(
                      color: Colors.lightBlue
                    ),
                    enabledBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(7),
                      borderSide: new BorderSide(color: Colors.lightBlue)
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(7),
                      borderSide: new BorderSide(color: Colors.lightBlue)
                    ),
                    suffix: new Icon(
                      Icons.location_on,
                      color: Colors.lightBlue,
                    )
                  ),
                ),

                new SizedBox(
                  height: 15,
                ),

                // Form untuk pengambilan tanggal lahir
                new RaisedButton(
                  shape: new RoundedRectangleBorder(),
                  color: Colors.lightBlue,
                  child: new Text(
                    "Pilih Tanggal Lahir",
                    style: new TextStyle(
                      color:Colors.white,
                    ),
                  ),
                  onPressed: (){
                    this.getDate();
                  },
                ),

                new SizedBox(
                  height: 15,
                ),
                
                // Form Choice Untuk agama
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Text(
                      "Agama :",
                      style: new TextStyle(
                        fontSize: 20
                      ),
                    ), 
                    new DropdownButton(
                      iconEnabledColor: Colors.lightBlue,
                      items: <String>[
                        'Islam',
                        'Kristen Protestan',
                        'Kristen Katolik',
                        'Budha',
                        'Hindu',
                        'Kong Hu Cu'
                      ]
                      .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,textAlign: TextAlign.center,),
                        );
                      })
                      .toList(),
                      value: this.agama,
                      onChanged:(params){
                        setState(() {
                         this.agama = params; 
                        });
                      },
                    ),
                  ],
                ),

                new SizedBox(
                  height: 15,
                ),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Text(
                      "Status :",
                      style: new TextStyle(
                        fontSize: 20
                      ),
                    ), 
                    new DropdownButton(
                      iconEnabledColor: Colors.lightBlue,
                      items: <String>[
                        'Belum Menikah',
                        'Menikah',
                        'Cerai'
                      ]
                      .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,textAlign: TextAlign.center,),
                        );
                      })
                      .toList(),
                      value: this.statusKawin,
                      onChanged:(params){
                        setState(() {
                         this.statusKawin = params; 
                        });
                      },
                    ),
                  ],
                ),

                new SizedBox(
                  height: 15,
                ),

                new TextField(
                  controller: this.pekerjaanController,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                    labelText: "Pekerjaan",
                    labelStyle: new TextStyle(
                      color: Colors.lightBlue
                    ),
                    enabledBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(7),
                      borderSide: new BorderSide(color: Colors.lightBlue)
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(7),
                      borderSide: new BorderSide(color: Colors.lightBlue)
                    ),
                    suffix: new Icon(
                      Icons.location_on,
                      color: Colors.lightBlue,
                    )
                  ),
                ),

                new SizedBox(
                  height: 15,
                ),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Text(
                      "Warga Negara :",
                      style: new TextStyle(
                        fontSize: 20
                      ),
                    ), 
                    new DropdownButton(
                      iconEnabledColor: Colors.lightBlue,
                      items: <String>[
                        'WNI',
                        'WNA'
                      ]
                      .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,textAlign: TextAlign.center,),
                        );
                      })
                      .toList(),
                      value: this.wargaNegara,
                      onChanged:(params){
                        setState(() {
                         this.wargaNegara = params; 
                        });
                      },
                    ),
                  ],
                ),

                new SizedBox(
                  height: 15,
                ),

                new RaisedButton(
                  child: new Text("Kirim"),
                  onPressed: (){
                    showDialog(
                      context: context,
                      builder: (context){
                        return new Dialog(
                          child: new Container(
                            height: 125,
                            padding:new EdgeInsets.all(15),
                            child: new Center(
                              child: new Column(
                                children: <Widget>[
                                  new Text(
                                    "Anda Yakin Data yang diisikan sudah benar ?",
                                    textAlign: TextAlign.center,
                                  ),
                                  new SizedBox(
                                    height: 15,
                                  ),
                                  new Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      new RaisedButton(
                                        child: new Text(
                                          "Kirim",
                                          style:new TextStyle(
                                            color:Colors.white
                                          )
                                        ),
                                        color: Colors.blue,
                                        onPressed: (){
                                          print("kirim");
                                          this.widget.daftarKTPBloc.postDaftarKTP(
                                            nama: this.namaController.text,
                                            nik: this.nikController.text,
                                            alamat: this.alamatController.text,
                                            kotaLahir: this.kotaKelahiranController.text,
                                            tanggalLahir: this.date.toString(),
                                            agama: this.agama,
                                            statusKawin: this.statusKawin,
                                            pekerjaan: this.pekerjaanController.text,
                                            statusWargaNegara: this.wargaNegara
                                          );
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                      ),
                                      new RaisedButton(
                                        child: new Text(
                                          "Cek lagi",
                                          style:new TextStyle(
                                            color:Colors.white
                                          )
                                        ),
                                        color: Colors.red,
                                        onPressed: (){
                                          print("BATAL");
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    );
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