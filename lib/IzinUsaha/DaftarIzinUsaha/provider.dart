import 'dart:convert';

import 'package:http/http.dart' as http;

class DaftarIzinUsahaProvider{

  Future<Map> postIzinUsaha({namaPemohon,nomorInduk,namaUsaha,deskripsiUsaha}) async{
    http.Response data=await http.post('http://172.16.17.100:8000/layanan-api/list/',body:{
      'nama_pemohon':namaPemohon,
      'nomor_induk':nomorInduk,
      'nama_usaha':namaUsaha,
      'deskripsi_usaha':deskripsiUsaha
    });
    var jsonData=jsonDecode(data.body);
    return jsonData;
  }
}