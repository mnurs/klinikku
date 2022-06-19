class Config{
  static int TotalProduk = 0;
  //Status_History
  static String StatusBelumBayar = "BelumBayar";
  static String StatusDikemas = "Dikemas";
  static String StatusDikirim = "Dikirim";
  static String StatusSelesai = "Selesai";
  static String StatusDibatalkan = "Dibatalkan";

  static String KeteranganBelumBayar(
      String waktuBayar, String namaBank, String waktuPesanan) {
    return "Mohon melakukan pembayaran sebelum " +
        waktuBayar +
        " melalui " +
        namaBank +
        ". Bila tidak pesanan ini akan di batalkan secara otomatis, waktu Pemesanan " +
        waktuPesanan;
  }

  static String KeteranganDikemas(String waktuKirim, String waktuPembayaran) {
    return "Produk sedang dikemas oleh penjual. Pesanan akan dikirim sebelum " +
        waktuKirim +
        " atau pesanan akan dibatalkan otomatis dalam 2-3 hari setelah lewat tanggal yang telah ditentukan. waktu pembayaran " +
        waktuPembayaran;
  }

  static String KeteranganDikirim(String waktuSampai, String waktuPengiriman) {
    return "Penjual telah mengirim pesanan. Produk diperkirakan akan sampai pada " +
        waktuSampai +
        ". waktu pengiriman " +
        waktuPengiriman;
  }

  static String KeteranganDibatalkan(String waktu_batal) {
    return "Anda telah membatalkan pesanan ini. Waktu Dibatalkan: " +
        waktu_batal;
  }

  static String KeteranganSelesai =
      "Pesanan anda telah selesai. Waktu pesanan Selesai 29-12-2021 20:28";

}