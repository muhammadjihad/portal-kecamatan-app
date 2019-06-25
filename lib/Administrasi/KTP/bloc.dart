import 'dart:async';

import 'provider.dart';

class KTPBloc{

  // Initializing Provider
  KTPProvider ktpProvider = new KTPProvider();

  // Initalizing StreamController
  StreamController ktpStreamController = new StreamController.broadcast();

  // Initializing Stream
  Stream get ktpStream => ktpStreamController.stream;

  Future<void> getPendudukData() async{
    await this.ktpProvider.getDataPenduduk();
    this.ktpStreamController.sink.add(this.ktpProvider.dataPenduduk);
  }

  void dispose(){
    ktpStreamController.close();
  }

}