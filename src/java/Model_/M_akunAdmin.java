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
public class M_akunAdmin {
    private String id_admin, username, password, nama_admin;

    public M_akunAdmin(String id_admin, String username, String password, String nama_admin) {
        this.id_admin = id_admin;
        this.username = username;
        this.password = password;
        this.nama_admin = nama_admin;
    }

    public M_akunAdmin() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public String getId_admin() {
        return id_admin;
    }

    public void setId_admin(String id_admin) {
        this.id_admin = id_admin;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNama_admin() {
        return nama_admin;
    }

    public void setNama_admin(String nama_admin) {
        this.nama_admin = nama_admin;
    }
    
}
