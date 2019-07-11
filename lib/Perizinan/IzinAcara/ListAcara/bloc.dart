import 'dart:async';

import 'provider.dart';

class ListAcaraBloc{

  // Initializing Provider
  final ListAcaraProvider listAcaraProvider = new ListAcaraProvider();

  // Initializing StreamController
  final StreamController listAcaraController = new StreamController.broadcast();

  // Initializing Streamer
  Stream get listAcaraStream => listAcaraController.stream;

  Future<void> getListAcara() async{
    await this.listAcaraProvider.getListAcaraData();
    this.listAcaraController.sink.add(this.listAcaraProvider.listAcara);
  }

  Future<void> getListAcaraFilter()async{
    await this.listAcaraProvider.getListAcaraDataFilter();
    this.listAcaraController.sink.add(this.listAcaraProvider.listAcara);
  }

  void dispose(){
    listAcaraController.close();
  }

}