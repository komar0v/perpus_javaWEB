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
public class M_buku {
    //id_buku juga disebut KODE BUKU
    private String id_buku, judul_buku, pengarang_buku, penerbit_buku, tahunterbit_buku, isbn_buku, kategori_buku;

    public M_buku(String id_buku, String judul_buku, String pengarang_buku, String penerbit_buku, String tahunterbit_buku, String isbn_buku, String kategori_buku) {
        this.id_buku = id_buku;
        this.judul_buku = judul_buku;
        this.pengarang_buku = pengarang_buku;
        this.penerbit_buku = penerbit_buku;
        this.tahunterbit_buku = tahunterbit_buku;
        this.isbn_buku = isbn_buku;
        this.kategori_buku = kategori_buku;
    }

    public M_buku() {
        
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
    
}
