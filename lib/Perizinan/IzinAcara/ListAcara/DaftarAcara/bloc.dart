import 'dart:async';

import 'provider.dart';

class DaftarAcaraBloc{

  // Initializing Provider
  final DaftarAcaraProvider daftarAcaraProvider = new DaftarAcaraProvider();

  // Initializing StreamController
  final StreamController daftarAcaraController = new StreamController();

  // Initializing Streamer
  Stream get daftarAcaraStream => daftarAcaraController.stream;

  Future<void> postDaftarAcara({
    namaKetuaPanitia,
    namaKegiatan,
    deskripsiKegiatan,
    tanggalKegiatan,
    waktuKegiatan,
    tempatKegiatan,
    
  })async{
    await this.daftarAcaraProvider.postDaftarAcara(
      namaKetuaPanitia: namaKetuaPanitia,
      namaKegiatan: namaKegiatan,
      deskripsiKegiatan: deskripsiKegiatan,
      tanggalKegiatan: tanggalKegiatan,
      waktuKegiatan: waktuKegiatan,
      tempatKegiatan: tempatKegiatan
    );
  }

  // dispose
  void dispose(){
    daftarAcaraController.close();
  }

}