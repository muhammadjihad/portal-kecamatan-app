import 'dart:convert';
import 'package:http/http.dart' as http;

class KTPProvider{

  List dataPenduduk;

  Future<void> getDataPenduduk()async{
    http.Response data=await http.get('http://172.16.17.100:8000/layanan-api/ktp/list');
    var jsonData=jsonDecode(data.body);
    this.dataPenduduk = jsonData['data'];
  }

}