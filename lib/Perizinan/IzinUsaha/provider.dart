import 'dart:convert';

import 'package:http/http.dart' as http;

class IzinUsahaProvider{
  List dataIzinUsaha = new List();

  Future<void> getIzinUsahaData() async{
    http.Response data=await http.get('http://172.16.17.155:8000/layanan-api/list');
    var jsonData=jsonDecode(data.body);
    this.dataIzinUsaha = jsonData['data'];
  }

  Future<void> deleteDaftarIzin({idPemohon}) async{
    await http.post('http://172.16.17.155:8000/layanan-api/delete/$idPemohon/');
  }
  
}