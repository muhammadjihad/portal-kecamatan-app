import 'package:http/http.dart' as http;

class DaftarKTPProvider{

  Future<void> postDataKTP({nama,nik,alamat,kotaLahir,tanggalLahir,agama,statusKawin,pekerjaan,statusWargaNegara}) async{
    await http.post('http://172.16.17.100:8000/layanan-api/ktp/list/',
    body: {
      'nama':nama,
      'nik':nik,
      'alamat':alamat,
      'kota_lahir':kotaLahir,
      'tanggal_lahir':tanggalLahir,
      'agama':agama,
      'status_perkawinan':statusKawin,
      'pekerjaan':pekerjaan,
      'status_warga':statusWargaNegara,
    });
  }

}