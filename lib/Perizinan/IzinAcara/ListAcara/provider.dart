import 'dart:convert';

import 'package:http/http.dart' as http;

class ListAcaraProvider{
  List listAcara;

  Future<void> getListAcaraData()async{
    http.Response data=await http.get('http://172.16.17.155:8000/layanan-api/perizinan-acara/list/');
    var jsonData=jsonDecode(data.body);
    this.listAcara = jsonData['data'];
  }

  Future<void> getListAcaraDataFilter()async{
    http.Response data=await http.get('http://172.16.17.155:8000/layanan-api/perizinan-acara/list?approvekecamatan=1');
    var jsonData=jsonDecode(data.body);
    this.listAcara=jsonData['data'];
  }

}