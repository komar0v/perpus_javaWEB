/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO_;

import Controller_.koneksi_db;
import Model_.M_akunMember;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ASUS
 */
public class x_Member {

    public static List<M_akunMember> getProfileDetails(int id_member) {
        ArrayList<M_akunMember> detail_member = new ArrayList<M_akunMember>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement getSemuaBuku = conn.prepareStatement("SELECT * FROM member WHERE id_member=?");
            getSemuaBuku.setInt(1, id_member);

            ResultSet rs4 = getSemuaBuku.executeQuery();
            while (rs4.next()) {
                M_akunMember membere = new M_akunMember();
                membere.setId_member(rs4.getInt("id_member"));
                membere.setNama_member(rs4.getString("nama_member"));
                membere.setNotel_member(rs4.getString("notel_member"));
                membere.setAlamat_member(rs4.getString("alamat_member"));
                membere.setEmail_member(rs4.getString("email_member"));
                membere.setJeniskel_member(rs4.getString("jeniskel_member"));
                detail_member.add(membere);
            }

        } catch (Exception ex) {
            Logger.getLogger(x_Member.class.getName()).log(Level.SEVERE, null, ex);
        }
        return detail_member;
    }

    public void updateProfileMember(int id_member, String nama_member, String alamat_member, String email_member, String jeniskel_member, String notel_member) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement ps = conn.prepareStatement("UPDATE member SET nama_member=?, notel_member=?, alamat_member=?, email_member=?, jeniskel_member=? WHERE id_member=?");

            ps.setString(1, nama_member);
            ps.setString(2, notel_member);
            ps.setString(3, alamat_member);
            ps.setString(4, email_member);
            ps.setString(5, jeniskel_member);
            ps.setInt(6, id_member);
            
            ps.executeUpdate();
            conn.close();

        } catch (Exception ex) {
            Logger.getLogger(x_Member.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void register_member_baru(M_akunMember member) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement ps = conn.prepareStatement("INSERT INTO member VALUES (?,?,?,?,?,?,?)");
            ps.setInt(1, member.getId_member());
            ps.setString(2, member.getNama_member());
            ps.setString(3, member.getNotel_member());
            ps.setString(4, member.getAlamat_member());
            ps.setString(5, member.getEmail_member());
            ps.setString(6, member.getPassword_member());
            ps.setString(7, member.getJeniskel_member());
            ps.executeUpdate();
            conn.close();

        } catch (Exception ex) {
            Logger.getLogger(x_Member.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static List<M_akunMember> getSemuaMember() {
        ArrayList<M_akunMember> List_member = new ArrayList<M_akunMember>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement getSemuaBuku = conn.prepareStatement("SELECT * FROM member");

            ResultSet rs4 = getSemuaBuku.executeQuery();
            while (rs4.next()) {
                M_akunMember membere = new M_akunMember();
                membere.setId_member(rs4.getInt("id_member"));
                membere.setNama_member(rs4.getString("nama_member"));
                List_member.add(membere);
            }

        } catch (Exception ex) {
            Logger.getLogger(x_Member.class.getName()).log(Level.SEVERE, null, ex);
        }
        return List_member;
    }

    public String getJumlahMember() {
        int jumlah_Member = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement psJmlMember = conn.prepareStatement("SELECT COUNT(*) AS jumlahMember FROM member");

            ResultSet rs4 = psJmlMember.executeQuery();

            while (rs4.next()) {
                jumlah_Member = rs4.getInt("jumlahMember");
            }

        } catch (Exception ex) {
            Logger.getLogger(x_Member.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Integer.toString(jumlah_Member);
    }

    public void deleteMember(int idMember) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement hapusBuku = conn.prepareStatement("DELETE FROM member WHERE id_member=?");
            hapusBuku.setInt(1, idMember);
            hapusBuku.execute();

        } catch (Exception ex) {
            Logger.getLogger(x_Member.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updatePasswordMember(int id_member, String pass_baru) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement ps = conn.prepareStatement("UPDATE member SET password_member =? WHERE id_member=?");

            ps.setString(1, pass_baru);
            ps.setInt(2, id_member);
            
            ps.executeUpdate();
            conn.close();

        } catch (Exception ex) {
            Logger.getLogger(x_Member.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
