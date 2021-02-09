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
public class M_denda {
    int id_denda, id_member, id_pinjam;
    String besar_denda, dibayarkah, nama_member, dikembalikan;
    String judul_buku;

    public M_denda() {
    }

    public String getDikembalikan() {
        return dikembalikan;
    }

    public void setDikembalikan(String dikembalikan) {
        this.dikembalikan = dikembalikan;
    }

    public String getJudul_buku() {
        return judul_buku;
    }

    public void setJudul_buku(String judul_buku) {
        this.judul_buku = judul_buku;
    }
    

    public String getNama_member() {
        return nama_member;
    }

    public void setNama_member(String nama_member) {
        this.nama_member = nama_member;
    }

    public int getId_denda() {
        return id_denda;
    }

    public void setId_denda(int id_denda) {
        this.id_denda = id_denda;
    }

    public int getId_member() {
        return id_member;
    }

    public void setId_member(int id_member) {
        this.id_member = id_member;
    }

    public int getId_pinjam() {
        return id_pinjam;
    }

    public void setId_pinjam(int id_pinjam) {
        this.id_pinjam = id_pinjam;
    }

    public String getBesar_denda() {
        return besar_denda;
    }

    public void setBesar_denda(String besar_denda) {
        this.besar_denda = besar_denda;
    }

    public String getDibayarkah() {
        return dibayarkah;
    }

    public void setDibayarkah(String dibayarkah) {
        this.dibayarkah = dibayarkah;
    }
    
    
}
