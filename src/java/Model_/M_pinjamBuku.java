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
public class M_pinjamBuku {

    int id_pinjam, id_member;
    String id_buku, nama_member;
    String batalkah;
    String mulai_pinjam, akhir_pinjam, pinjam_day_remaining;
    String judul_buku;
    String sudah_diambil, dikonfirmasikah, dikembalikan;

    public String getDikembalikan() {
        return dikembalikan;
    }

    public void setDikembalikan(String dikembalikan) {
        this.dikembalikan = dikembalikan;
    }
  
    public String getBatalkah() {
        return batalkah;
    }

    public void setBatalkah(String batalkah) {
        this.batalkah = batalkah;
    }

    public String getNama_member() {
        return nama_member;
    }

    public void setNama_member(String nama_member) {
        this.nama_member = nama_member;
    }

    public String getDikonfirmasikah() {
        return dikonfirmasikah;
    }

    public void setDikonfirmasikah(String dikonfirmasikah) {
        this.dikonfirmasikah = dikonfirmasikah;
    }

    public String getSudah_diambil() {
        return sudah_diambil;
    }

    public void setSudah_diambil(String sudah_diambil) {
        this.sudah_diambil = sudah_diambil;
    }

    public M_pinjamBuku() {
    }

    public String getPinjam_day_remaining() {
        return pinjam_day_remaining;
    }

    public void setPinjam_day_remaining(String pinjam_day_remaining) {
        this.pinjam_day_remaining = pinjam_day_remaining;
    }

    public String getJudul_buku() {
        return judul_buku;
    }

    public void setJudul_buku(String judul_buku) {
        this.judul_buku = judul_buku;
    }

    public int getId_pinjam() {
        return id_pinjam;
    }

    public void setId_pinjam(int id_pinjam) {
        this.id_pinjam = id_pinjam;
    }

    public int getId_member() {
        return id_member;
    }

    public void setId_member(int id_member) {
        this.id_member = id_member;
    }

    public String getId_buku() {
        return id_buku;
    }

    public void setId_buku(String id_buku) {
        this.id_buku = id_buku;
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

}
