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
public class M_akunMember {
    private String nama_member, alamat_member, email_member, password_member, jeniskel_member,notel_member;
    private int id_member;

    public M_akunMember(String nama_member, String alamat_member, String email_member, String password_member, String jeniskel_member, int id_member, String notel_member) {
        this.nama_member = nama_member;
        this.alamat_member = alamat_member;
        this.email_member = email_member;
        this.password_member = password_member;
        this.jeniskel_member = jeniskel_member;
        this.id_member = id_member;
        this.notel_member = notel_member;
    }

    public M_akunMember() {
        
    }

    public String getNama_member() {
        return nama_member;
    }

    public void setNama_member(String nama_member) {
        this.nama_member = nama_member;
    }

    public String getAlamat_member() {
        return alamat_member;
    }

    public void setAlamat_member(String alamat_member) {
        this.alamat_member = alamat_member;
    }

    public String getEmail_member() {
        return email_member;
    }

    public void setEmail_member(String email_member) {
        this.email_member = email_member;
    }

    public String getPassword_member() {
        return password_member;
    }

    public void setPassword_member(String password_member) {
        this.password_member = password_member;
    }

    public String getJeniskel_member() {
        return jeniskel_member;
    }

    public void setJeniskel_member(String jeniskel_member) {
        this.jeniskel_member = jeniskel_member;
    }

    public int getId_member() {
        return id_member;
    }

    public void setId_member(int id_member) {
        this.id_member = id_member;
    }

    public String getNotel_member() {
        return notel_member;
    }

    public void setNotel_member(String notel_member) {
        this.notel_member = notel_member;
    }
    
    
}
