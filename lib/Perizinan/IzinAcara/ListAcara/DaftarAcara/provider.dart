import 'package:http/http.dart' as http;

class DaftarAcaraProvider{

  Future<void> postDaftarAcara({
    namaKetuaPanitia,
    namaKegiatan,
    deskripsiKegiatan,
    tanggalKegiatan,
    waktuKegiatan,
    tempatKegiatan,
  })async{
    await http.post('http://172.16.17.155:8000/layanan-api/perizinan-acara/list/post/',
      body: {
        'nama_ketuapanitia':namaKetuaPanitia,
        'nama_kegiatan':namaKegiatan,
        'deskripsi_kegiatan':deskripsiKegiatan,
        'tanggal_kegiatan':tanggalKegiatan,
        'waktu_kegiatan':waktuKegiatan,
        'tempat_kegiatan':tempatKegiatan
      }
    );
  }

}