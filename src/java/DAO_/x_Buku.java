/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO_;

import Controller_.koneksi_db;
import Model_.M_buku;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ASUS
 */
public class x_Buku {

    public static List<M_buku> cariBuku_denganLogin(String keyword) {
        ArrayList<M_buku> detail_buku = new ArrayList<M_buku>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement getHasilCari = conn.prepareStatement("SELECT id_buku, judul_buku, pengarang_buku, tahunterbit_buku, penerbit_buku FROM buku WHERE dipinjamkah='tidak' AND judul_buku LIKE '%" + keyword + "%' ");

            ResultSet rs4 = getHasilCari.executeQuery();
            while (rs4.next()) {
                M_buku bukune = new M_buku();
                bukune.setId_buku(rs4.getString("id_buku"));
                bukune.setJudul_buku(rs4.getString("judul_buku"));
                bukune.setPengarang_buku(rs4.getString("pengarang_buku"));
                bukune.setTahunterbit_buku(rs4.getString("tahunterbit_buku"));
                bukune.setPenerbit_buku(rs4.getString("penerbit_buku"));
                detail_buku.add(bukune);
            }

        } catch (Exception ex) {
            Logger.getLogger(x_Buku.class.getName()).log(Level.SEVERE, null, ex);
        }
        return detail_buku;
    }

    public static List<M_buku> cariBuku_noLogin(String keyword) {
        ArrayList<M_buku> detail_buku = new ArrayList<M_buku>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement getHasilCari = conn.prepareStatement("SELECT judul_buku, pengarang_buku, penerbit_buku, tahunterbit_buku FROM buku WHERE dipinjamkah='tidak' AND judul_buku LIKE '%" + keyword + "%' ");

            ResultSet rs4 = getHasilCari.executeQuery();
            while (rs4.next()) {
                M_buku bukune = new M_buku();
                bukune.setJudul_buku(rs4.getString("judul_buku"));
                bukune.setPengarang_buku(rs4.getString("pengarang_buku"));
                bukune.setTahunterbit_buku(rs4.getString("tahunterbit_buku"));
                bukune.setPenerbit_buku(rs4.getString("penerbit_buku"));
                detail_buku.add(bukune);
            }

        } catch (Exception ex) {
            Logger.getLogger(x_Buku.class.getName()).log(Level.SEVERE, null, ex);
        }
        return detail_buku;
    }

    public static List<M_buku> getDetailsBuku(String id_buku) {
        ArrayList<M_buku> detail_buku = new ArrayList<M_buku>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement getSemuaBuku = conn.prepareStatement("SELECT * FROM buku WHERE id_buku=?");
            getSemuaBuku.setString(1, id_buku);

            ResultSet rs4 = getSemuaBuku.executeQuery();
            while (rs4.next()) {
                M_buku bukune = new M_buku();
                bukune.setId_buku(rs4.getString("id_buku"));
                bukune.setJudul_buku(rs4.getString("judul_buku"));
                bukune.setPengarang_buku(rs4.getString("pengarang_buku"));
                bukune.setTahunterbit_buku(rs4.getString("tahunterbit_buku"));
                bukune.setPenerbit_buku(rs4.getString("penerbit_buku"));
                bukune.setIsbn_buku(rs4.getString("isbn_buku"));
                bukune.setKategori_buku(rs4.getString("kategori_buku"));
                detail_buku.add(bukune);
            }

        } catch (Exception ex) {
            Logger.getLogger(x_Buku.class.getName()).log(Level.SEVERE, null, ex);
        }
        return detail_buku;
    }

    public void updateBuku(String id_buku, String judul_buku, String pengarang_buku, String penerbit_buku, String tahunterbit_buku, String isbn_buku, String kategori_buku) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement ps = conn.prepareStatement("UPDATE buku SET judul_buku=?, pengarang_buku=?, tahunterbit_buku=?, penerbit_buku=?, isbn_buku=?, kategori_buku=? WHERE id_buku=?");

            ps.setString(1, judul_buku);
            ps.setString(2, pengarang_buku);
            ps.setString(3, tahunterbit_buku);
            ps.setString(4, penerbit_buku);
            ps.setString(5, isbn_buku);
            ps.setString(6, kategori_buku);
            ps.setString(7, id_buku);
            ps.executeUpdate();
            conn.close();

        } catch (Exception ex) {
            Logger.getLogger(x_Buku.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addBuku(M_buku buku_) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement ps = conn.prepareStatement("INSERT INTO buku VALUES (?,?,?,?,?,?,?,'tidak')");
            ps.setString(1, buku_.getId_buku());
            ps.setString(2, buku_.getJudul_buku());
            ps.setString(3, buku_.getPengarang_buku());
            ps.setString(4, buku_.getTahunterbit_buku());
            ps.setString(5, buku_.getPenerbit_buku());
            ps.setString(6, buku_.getIsbn_buku());
            ps.setString(7, buku_.getKategori_buku());
            ps.executeUpdate();
            conn.close();

        } catch (Exception ex) {
            Logger.getLogger(x_Buku.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public String getJumlahSemuaBuku() {
        int jumlah_koleksiBuku = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement psJmlKoleksiBuku = conn.prepareStatement("SELECT COUNT(*) AS jumlahKoleksiBuku FROM buku");

            ResultSet rs4 = psJmlKoleksiBuku.executeQuery();

            while (rs4.next()) {
                jumlah_koleksiBuku = rs4.getInt("jumlahKoleksiBuku");
            }

        } catch (Exception ex) {
            Logger.getLogger(x_Buku.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Integer.toString(jumlah_koleksiBuku);
    }

    public static List<M_buku> getSemuaBuku() {
        ArrayList<M_buku> List_buku = new ArrayList<M_buku>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement getSemuaBuku = conn.prepareStatement("SELECT * FROM buku");

            ResultSet rs4 = getSemuaBuku.executeQuery();
            while (rs4.next()) {
                M_buku bukune = new M_buku();
                bukune.setId_buku(rs4.getString("id_buku"));
                bukune.setJudul_buku(rs4.getString("judul_buku"));
                bukune.setPengarang_buku(rs4.getString("pengarang_buku"));
                bukune.setTahunterbit_buku(rs4.getString("tahunterbit_buku"));
                List_buku.add(bukune);
            }

        } catch (Exception ex) {
            Logger.getLogger(x_Buku.class.getName()).log(Level.SEVERE, null, ex);
        }
        return List_buku;
    }

    public void deleteBuku(String idBuku) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement hapusBuku = conn.prepareStatement("DELETE FROM buku WHERE id_buku=?");
            hapusBuku.setString(1, idBuku);
            hapusBuku.execute();

        } catch (Exception ex) {
            Logger.getLogger(x_Buku.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
