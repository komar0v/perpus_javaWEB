/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO_;

import Controller_.koneksi_db;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ASUS
 */
public class x_Denda {
    public void admin_konfirmasiBayar_denda(int id_denda, int id_pinjam) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement ps_1 = conn.prepareStatement("UPDATE denda SET dibayarkah='sudah' WHERE id_denda=?");
            ps_1.setInt(1, id_denda);
            ps_1.executeUpdate();
            
            PreparedStatement ps_2 = conn.prepareStatement("UPDATE pinjam_buku SET dendakah='tidak' WHERE id_pinjam=?");
            ps_2.setInt(1, id_pinjam);
            ps_2.executeUpdate();

            conn.close();

        } catch (Exception ex) {
            Logger.getLogger(x_Peminjaman.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
