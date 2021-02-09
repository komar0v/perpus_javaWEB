/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model_;

/**
 *
 * @author ASUS
 */
public class M_detailBuku_Dipinjam {
    String id_buku, judul_buku, pengarang_buku, penerbit_buku, tahunterbit_buku, isbn_buku, kategori_buku;
    int id_pinjam;
    String mulai_pinjam, akhir_pinjam, pinjam_day_remaining;
    String sudah_diambil, dikonfirmasikah;

    public M_detailBuku_Dipinjam() {
    }

    public String getId_buku() {
        return id_buku;
    }

    public void setId_buku(String id_buku) {
        this.id_buku = id_buku;
    }

    public String getJudul_buku() {
        return judul_buku;
    }

    public void setJudul_buku(String judul_buku) {
        this.judul_buku = judul_buku;
    }

    public String getPengarang_buku() {
        return pengarang_buku;
    }

    public void setPengarang_buku(String pengarang_buku) {
        this.pengarang_buku = pengarang_buku;
    }

    public String getPenerbit_buku() {
        return penerbit_buku;
    }

    public void setPenerbit_buku(String penerbit_buku) {
        this.penerbit_buku = penerbit_buku;
    }

    public String getTahunterbit_buku() {
        return tahunterbit_buku;
    }

    public void setTahunterbit_buku(String tahunterbit_buku) {
        this.tahunterbit_buku = tahunterbit_buku;
    }

    public String getIsbn_buku() {
        return isbn_buku;
    }

    public void setIsbn_buku(String isbn_buku) {
        this.isbn_buku = isbn_buku;
    }

    public String getKategori_buku() {
        return kategori_buku;
    }

    public void setKategori_buku(String kategori_buku) {
        this.kategori_buku = kategori_buku;
    }

    public int getId_pinjam() {
        return id_pinjam;
    }

    public void setId_pinjam(int id_pinjam) {
        this.id_pinjam = id_pinjam;
    }

    public String getMulai_pinjam() {
        return mulai_pinjam;
    }

    public void setMulai_pinjam(String mulai_pinjam) {
        this.mulai_pinjam = mulai_pinjam;
    }

    public String getAkhir_pinjam() {
        return akhir_pinjam;
    }

    public void setAkhir_pinjam(String akhir_pinjam) {
        this.akhir_pinjam = akhir_pinjam;
    }

    public String getPinjam_day_remaining() {
        return pinjam_day_remaining;
    }

    public void setPinjam_day_remaining(String pinjam_day_remaining) {
        this.pinjam_day_remaining = pinjam_day_remaining;
    }

    public String getSudah_diambil() {
        return sudah_diambil;
    }

    public void setSudah_diambil(String sudah_diambil) {
        this.sudah_diambil = sudah_diambil;
    }

    public String getDikonfirmasikah() {
        return dikonfirmasikah;
    }

    public void setDikonfirmasikah(String dikonfirmasikah) {
        this.dikonfirmasikah = dikonfirmasikah;
    }
}
