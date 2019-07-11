import 'dart:async';

import 'provider.dart';

class IzinUsahaBloc{

  // Initializing Provider (Event Handler)
  final IzinUsahaProvider izinUsahaProvider = new IzinUsahaProvider();
  final StreamController izinUsahaController = new StreamController.broadcast();

  Stream get izinUsahaStream => izinUsahaController.stream;

  Future<void> getIzinUsahaData() async{
    await this.izinUsahaProvider.getIzinUsahaData();
    izinUsahaController.sink.add(this.izinUsahaProvider.dataIzinUsaha);
  }

  Future<void> deleteIzinUsaha({idPemohon}) async{
    await this.izinUsahaProvider.deleteDaftarIzin(idPemohon: idPemohon);
    izinUsahaController.sink.add(this.izinUsahaProvider.dataIzinUsaha);
  }

  void dispose(){
    izinUsahaController.close();
  }
  
}