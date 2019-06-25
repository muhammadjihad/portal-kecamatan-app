import 'dart:async';
import 'provider.dart';

class DaftarKTPBloc{

  // Initializing Provider
  final DaftarKTPProvider daftarKTPProvider = new DaftarKTPProvider();

  // Initializing Stream Controller
  final StreamController daftarKTPStreamController = new StreamController();

  // Initializing Stream
  Stream get daftarKTPStream => daftarKTPStreamController.stream;

  void postDaftarKTP({nama,nik,alamat,kotaLahir,tanggalLahir,agama,statusKawin,pekerjaan,statusWargaNegara})async{
    await this.daftarKTPProvider.postDataKTP(
      nama: nama,
      nik: nik,
      alamat: alamat,
      kotaLahir: kotaLahir,
      tanggalLahir: tanggalLahir,
      agama: agama,
      statusKawin: statusKawin,
      pekerjaan: pekerjaan,
      statusWargaNegara: statusWargaNegara
    );
  }

  void dispose(){
    daftarKTPStreamController.close();
  }

}