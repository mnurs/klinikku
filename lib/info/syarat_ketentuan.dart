import 'package:flutter/material.dart';

class SyaratKetentuanIndex extends StatefulWidget {
  @override
  _SyaratKetentuanIndexState createState() => _SyaratKetentuanIndexState();
}

class _SyaratKetentuanIndexState extends State<SyaratKetentuanIndex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Syarat & Ketentuan"),
        backgroundColor: Colors.pink[200],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Sebelum mengakses situs/platform ini Anda diwajibkan untuk membaca SYARAT & KETENTUAN di bawah ini:",
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 5,
                  ),
                  Text("1. "),
                  Expanded(
                      child: Text(
                          "Dengan mengakses dan menggunakan semua fitur layanan yang ada di situs ini, Anda dengan otomatis telah menyetujui semua bentuk syarat & ketentuan yang telah ditentukan oleh AuradermA Skin Care Clinic."))
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 5,
                  ),
                  Text("2. "),
                  Expanded(
                      child: Text(
                          "Semua akses yang menggunakan password bersifat rahasia dan dilindungi/terlindungi hanya untuk pemilik akun. Di luar pemilik akun tidak diizinkan untuk memperoleh/berusaha memperoleh akses ini secara illegal/tidak sah ke dalam situs ini, termasuk area informasi lain yang bersifat pribadi, rahasia dan dilindungi dengan cara apapun tanpa izin khusus yang telah diberikan resmi dari pihak yang berkepentingan. Segala bentuk pelanggaran akan dikenakan sanksi/hukuman sesuai dengan peraturan & undang-undang yang berlaku di Indonesia."))
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 5,
                  ),
                  Text("3. "),
                  Expanded(
                      child: Text(
                          "Situs ini dikhususkan bagi orang dewasa. Bagi Anda yang masih di bawah umur diwajibkan untuk memiliki izin/persetujuan dari orang tua/wali yang dapat bertanggungjawab atas tindakan Anda, bertanggungjawab atas biaya yang terkait dengan pembelian produk dan layanan dan penerimaan dan pemahaman mengenai Syarat & Ketentuan yang tertera. Tanpa persetujuan/perizinan tersebut, semua hal yang dilakukan oleh pihak terkait di luar tanggung jawab AuradermA Skin Care Clinic."))
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 5,
                  ),
                  Text("4. Penggunaan Situs dan Layanan:"),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Text(
                    "Anda setuju untuk mematuhi setiap ketentuan, pemberitahuan, kebijakan dan instruksi yang terkait dengan penggunaan layanan dan/atau akses ke situs ini sesuai dengan ketentuan AuradermA Skin Care Clinic, walau tanpa pemberitahuan lebih lanjut."),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 5,
                  ),
                  Text("5. Anda dilarang keras untuk:"),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("a. "),
                    Expanded(
                      child: Text(
                          "Memalsukan identitas, memberikan keterangan palsu dan mengakui sebagai orang lain, atau apapun yang bersifat pelanggaran terhadap identitas."),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("b. "),
                    Expanded(
                      child: Text(
                          "Menggunakan situs ini untuk tujuan yang illegal/melanggar hukum dan undang-undang yang berlaku di Indonesia."),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("c. "),
                    Expanded(
                      child: Text(
                          "Berusaha mendapatkan akses secara paksa termasuk mengganggu dan/atau mengacaukan sistem komputer atau jaringan yang berhubungan dengan situs/platform dan layanan ini."),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("d. "),
                    Expanded(
                      child: Text(
                          "Mem-posting, mempromosikan atau mengirimkan materi/konten terlarang melalui situs/dengan mengatasnamakan AuradermA Skin Care Clinic tanpa sepengetahuan pihak terkait."),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("e. "),
                    Expanded(
                      child: Text(
                          "Menggunakan, mengunggah, memasukkan perangkat lunak/material yang dicurigai mengandung virus, komponen yang bersifat destruktif, kode berbahaya atau apapun yang serupa yang dapat merusak data dan situs atau mengganggu akses komputer dan/atau jaringan pelanggan."),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 5,
                  ),
                  Text("6. Ketersediaan situs dan layanan:"),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Text(
                    "AuradermA Skin Care Clinic dapat meningkatkan, memodifikasi, menghentikan sementara, menghentikan penyediaan, menghapus, baik secara keseluruhan atau sebagian dari situs atau layanan, tanpa memberikan alasan & pemberitahuan sebelumnya, dan tidak bertanggungjawab jika peningkatan, modifikasi, suspensi atau penghapusan tersebut mencegah Anda mengakses situs atau bagian dari layanan."),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Text(
                        "7. Pihak AuradermA Skin Care Clinic mempunyai hak penuh atas situs ini termasuk:"),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("a. "),
                    Expanded(
                      child: Text(
                          "Memantau, menyaring atau mengontrol setiap kegiatan, isi atau materi pada situs dan/atau melalui Layanan. Hal tersebut termasuk/berarti, kami dapat menyelidiki setiap pelanggaran terhadap syarat dan ketentuan yang tercantum di sini dan dapat mengambil tindakan apapun yang dianggap sesuai atau tepat;"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("b. "),
                    Expanded(
                      child: Text(
                          "mencegah atau membatasi akses pelanggan untuk keperluan yang kami anggap melebihi kapasitas;"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("c. "),
                    Expanded(
                      child: Text(
                          "melaporkan kegiatan yang dicurigai sebagai pelanggaran terhadap hukum yang berlaku, undang-undang atau peraturan kepada pihak yang berwenang serta bekerjasama dengan pihak berwenang tersebut; dan/atau"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("d. "),
                    Expanded(
                      child: Text(
                          "meminta informasi dan data dari Anda sehubungan dengan penggunaan Layanan dan/atau akses situs setiap saat, dan sebagai pelaksanaan hak AuradermA Skin Care Clinic jika Anda menolak untuk memberikan/mengungkapkan informasi/data tersebut, atau jika Anda memberikan informasi tidak akurat, menyesatkan, penipuan data dan/atau informasi, atau jika kami memiliki alasan yang cukup mencurigai Anda telah menyediakan informasi tidak akurat, menyesatkan atau penipuan data dan/atau informasi."),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 5,
                  ),
                  Text("8. "),
                  Expanded(
                      child: Text(
                          "Dengan ini Anda telah menyetujui untuk memberikan izin untuk dapat menggunakan informasi yang telah kami terima termasuk tapi tidak terbatas pada, pertanyaan, ulasan, komentar, dan saran. Pihak AuradermA Skin Care Clinic akan mungkin, namun tidak diwajibkan untuk mempublikasikan, menghapus atau mengubah informasi yang telah Anda berikan perihal submisi."))
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 5,
                  ),
                  Text("9. "),
                  Expanded(
                      child: Text(
                          "Anda menyetujui dan mengesahkan untuk setiap informasi yang kami terima dapat dipergunakan untuk keperluan promosi dan pengiriman informasi."))
                ],
              ),
              Divider(
                height: 20,
                color: Colors.black,
              ),
              Text("Syarat & Ketentuan e-commerce", style: TextStyle(color: Colors.pink[200], fontSize: 15, fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 5,
                  ),
                  Text("1. "),
                  Expanded(
                      child: Text(
                          "Dengan ini, kami menganggap Anda telah menyetujui setiap syarat yang telah ditentukan yang berkaitan dengan pembelian produk dari AuradermA Skin Care Clinic."))
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 5,
                  ),
                  Text("2. "),
                  Expanded(
                      child: Text(
                          "Anda menyadari sepenuhnya bahwa produk yang kami jual tidak bersifat permanen, instan ataupun 100% akurat. Kami tetap menyarankan adanya konsultasi apabila ditemukan adanya ketidak-cocokan terhadap produk AuradermA Skin Care Clinic."))
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 5,
                  ),
                  Text("3. "),
                  Expanded(
                      child: Text(
                          "Anda menyetujui dan menjamin bahwa Anda tidak mengandalkan hanya pada setiap syarat, kententuan, garansi, usaha, bujukan maupun representasi yang belum disetujui oleh pihak konsultan/Dokter dan Anda."))
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 5,
                  ),
                  Text("4. "),
                  Expanded(
                      child: Text(
                          "Kami tidak memberikan jaminan 100% untuk setiap keluhan, masalah, reaksi yang dapat timbul setelah menggunakan produk kami merupakan tanggung jawab pihak kami sepenuhnya. Kami tidak bertanggungjawab atas setiap ketidaksesuaian pelanggan, kelalaian, pemakaian yang tidak wajar, penanganan atau pemakaian yang salah, perawatan yang salah, ketidakcocokkan, pengaruh kimia, kegagalan atau kelalaian Anda dalam menggunakan produk kami. Resiko bisa diminimalisir dengan mengikuti arahan dokter. Untuk memperkecil munculnya efek samping yang tidak diharapkan, maka pasien diminta mengikuti saran dan petunjuk dari Dokter."))
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 5,
                  ),
                  Text("5. "),
                  Expanded(
                      child: Text(
                          "Setiap pembelanjaan yang Anda lakukan harus dilakukan dalam keadaan sadar dan tidak dalam pengaruh apapun.AuradermA Skin Care Clinic tidak bertanggungjawab atas adanya pembelian yang telah/melalui proses terakhir atau pembayaran yang Anda lakukan."))
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text("Pihak AuradermA Skin Care Clinic dapat mengubah/merevisi semua syarat dan ketentuan yang tertera tanpa pemberitahuan terlebih dahulu. Untuk setiap pelanggaran yang dilakukan akan mendapatkan hukuman/sanksi berdasarkan hukum & Undang-undang yang berlaku di Indonesia.")
            ],
          ),
        ),
      ),
    );
  }
}
