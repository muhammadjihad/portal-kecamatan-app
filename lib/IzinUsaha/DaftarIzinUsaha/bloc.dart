import 'dart:async';

import 'provider.dart';

class DaftarIzinUsahaBloc{

  // Initializing Provider
  final DaftarIzinUsahaProvider daftarIzinUsahaProvider = new DaftarIzinUsahaProvider();

  final StreamController daftarIzinUsahaController = new StreamController.broadcast();

  Stream get daftarIzinUsahaStream => daftarIzinUsahaController.stream;

  void postIzinUsaha({namaPemohon,nomorInduk,namaUsaha,deskripsiUsaha}) async{
    await this.daftarIzinUsahaProvider.postIzinUsaha(
      namaPemohon: namaPemohon,
      nomorInduk: nomorInduk,
      namaUsaha: namaUsaha,
      deskripsiUsaha: deskripsiUsaha
    );
  }

  void dispose(){
    daftarIzinUsahaController.close();
  }

}