/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO_;

import Controller_.koneksi_db;
import Model_.M_buku;
import Model_.M_denda;
import Model_.M_detailBuku_Dipinjam;
import Model_.M_pinjamBuku;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ASUS
 */
public class x_Peminjaman {

    public String getDayRemaining(int id_pinjam) {
        String day_remain = "";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement detail_buku_dipinjam = conn.prepareStatement("SELECT DATEDIFF(akhir_pinjam,CURRENT_DATE() ) AS pinjam_day_remaining FROM buku INNER JOIN pinjam_buku USING (id_buku) WHERE id_pinjam=? AND dikembalikan='belum'");
            detail_buku_dipinjam.setInt(1, id_pinjam);

            ResultSet rs4 = detail_buku_dipinjam.executeQuery();
            while (rs4.next()) {
                day_remain = rs4.getString("pinjam_day_remaining");
            }

        } catch (Exception ex) {
            Logger.getLogger(x_Peminjaman.class.getName()).log(Level.SEVERE, null, ex);
        }
        return day_remain;
    }

    public void admin_konfirmasiPengembalian_WITH_DENDA(int id_denda, int id_pinjam, int id_member, int besar_denda, String idBuku_) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement ps_1 = conn.prepareStatement("UPDATE pinjam_buku SET dikembalikan='sudah', dendakah='ya', akhir_pinjam=CURRENT_DATE() WHERE id_pinjam=?");
            ps_1.setInt(1, id_pinjam);
            ps_1.executeUpdate();

            PreparedStatement ps_2x = conn.prepareStatement("INSERT INTO denda VALUES (?,?,?,?,'belum')");
            ps_2x.setInt(1, id_denda);
            ps_2x.setInt(2, id_member);
            ps_2x.setInt(3, id_pinjam);
            ps_2x.setInt(4, besar_denda);
            ps_2x.executeUpdate();
            
            PreparedStatement ps_3x = conn.prepareStatement("UPDATE buku SET dipinjamkah='tidak' WHERE id_buku=?");
            ps_3x.setString(1, idBuku_);
            ps_3x.executeUpdate();

            conn.close();

        } catch (Exception ex) {
            Logger.getLogger(x_Peminjaman.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void admin_konfirmasiPengembalian_TANPA_DENDA(int id_pinjam, String idBuku_) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement ps_1 = conn.prepareStatement("UPDATE pinjam_buku SET akhir_pinjam=CURRENT_DATE(), dendakah='tidak', dikembalikan='sudah' WHERE id_pinjam=?");
            ps_1.setInt(1, id_pinjam);
            ps_1.executeUpdate();
            
            PreparedStatement ps_2 = conn.prepareStatement("UPDATE buku SET dipinjamkah='tidak' WHERE id_buku=?");
            ps_2.setString(1, idBuku_);
            ps_2.executeUpdate();
            
            conn.close();

        } catch (Exception ex) {
            Logger.getLogger(x_Peminjaman.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void member_pinjamBuku(M_pinjamBuku pinjem) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement ps = conn.prepareStatement("INSERT INTO pinjam_buku VALUES (?,?,?,?,(mulai_pinjam + INTERVAL 14 DAY),?,?,?,?,'tidak')");
            ps.setInt(1, pinjem.getId_pinjam());
            ps.setInt(2, pinjem.getId_member());
            ps.setString(3, pinjem.getId_buku());
            ps.setString(4, pinjem.getMulai_pinjam());
            ps.setString(5, pinjem.getSudah_diambil());
            ps.setString(6, pinjem.getDikonfirmasikah());
            ps.setString(7, pinjem.getBatalkah());
            ps.setString(8, pinjem.getDikembalikan());
            ps.executeUpdate();
            
            PreparedStatement ps_2 = conn.prepareStatement("UPDATE buku SET dipinjamkah='ya' WHERE id_buku=?");
            ps_2.setString(1, pinjem.getId_buku());
            ps_2.executeUpdate();
            
            conn.close();

        } catch (Exception ex) {
            Logger.getLogger(x_Peminjaman.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static List<M_denda> getSemuaDenda() {
        ArrayList<M_denda> list_semuaDenda = new ArrayList<M_denda>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement semua_denda = conn.prepareStatement("SELECT * FROM denda INNER JOIN member USING (id_member) WHERE dibayarkah='belum'");

            ResultSet rs4 = semua_denda.executeQuery();
            while (rs4.next()) {
                M_denda detailDenda = new M_denda();
                detailDenda.setId_pinjam(rs4.getInt("id_pinjam"));
                detailDenda.setId_denda(rs4.getInt("id_denda"));
                detailDenda.setBesar_denda(rs4.getString("besar_denda"));
                detailDenda.setNama_member(rs4.getString("nama_member"));
                list_semuaDenda.add(detailDenda);
            }

        } catch (Exception ex) {
            Logger.getLogger(x_Peminjaman.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list_semuaDenda;
    }
    
    public static List<M_denda> getDendaMember(int id_member) {
        ArrayList<M_denda> list_semuaDenda = new ArrayList<M_denda>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement member_denda = conn.prepareStatement("SELECT * FROM denda INNER JOIN pinjam_buku USING (id_pinjam) JOIN buku ON buku.id_buku=pinjam_buku.id_buku WHERE dendakah='ya' AND dibayarkah='belum' AND pinjam_buku.id_member=?");
            member_denda.setInt(1, id_member);
            
            ResultSet rs4 = member_denda.executeQuery();
            while (rs4.next()) {
                M_denda detailDenda = new M_denda();
                detailDenda.setId_pinjam(rs4.getInt("id_pinjam"));
                detailDenda.setId_denda(rs4.getInt("id_denda"));
                detailDenda.setBesar_denda(rs4.getString("besar_denda"));
                detailDenda.setJudul_buku(rs4.getString("judul_buku"));
                detailDenda.setDikembalikan(rs4.getString("dikembalikan"));
                detailDenda.setDibayarkah(rs4.getString("dibayarkah"));
                list_semuaDenda.add(detailDenda);
            }

        } catch (Exception ex) {
            Logger.getLogger(x_Peminjaman.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list_semuaDenda;
    }

    public static List<M_pinjamBuku> getBuku_yang_dipinjam(int id_member) {
        ArrayList<M_pinjamBuku> detail_buku_yang_dipinjam = new ArrayList<M_pinjamBuku>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement detail_buku_dipinjam = conn.prepareStatement("SELECT *, DATEDIFF(akhir_pinjam,CURRENT_DATE() ) AS pinjam_day_remaining FROM buku INNER JOIN pinjam_buku USING (id_buku) WHERE id_member=? AND batalkah='tidak' AND dikembalikan='belum'");
            detail_buku_dipinjam.setInt(1, id_member);

            ResultSet rs4 = detail_buku_dipinjam.executeQuery();
            while (rs4.next()) {
                M_pinjamBuku buku_dipinjam = new M_pinjamBuku();
                buku_dipinjam.setId_pinjam(rs4.getInt("id_pinjam"));
                buku_dipinjam.setId_buku(rs4.getString("id_buku"));
                buku_dipinjam.setJudul_buku(rs4.getString("judul_buku"));
                buku_dipinjam.setAkhir_pinjam(rs4.getString("akhir_pinjam"));
                buku_dipinjam.setSudah_diambil(rs4.getString("diambilkah"));
                buku_dipinjam.setDikonfirmasikah(rs4.getString("dikonfirmasikah"));
                buku_dipinjam.setPinjam_day_remaining(rs4.getString("pinjam_day_remaining"));
                detail_buku_yang_dipinjam.add(buku_dipinjam);
            }

        } catch (Exception ex) {
            Logger.getLogger(x_Peminjaman.class.getName()).log(Level.SEVERE, null, ex);
        }
        return detail_buku_yang_dipinjam;
    }

    public static List<M_pinjamBuku> getBuku_yang_mauDiperpanjang(int id_member) {
        ArrayList<M_pinjamBuku> detail_buku_yang_dipinjam = new ArrayList<M_pinjamBuku>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement detail_buku_dipinjam = conn.prepareStatement("SELECT *, DATEDIFF(akhir_pinjam,CURRENT_DATE() ) AS pinjam_day_remaining FROM buku INNER JOIN pinjam_buku USING (id_buku) WHERE id_member=? AND diambilkah='sudah' AND (DATEDIFF(akhir_pinjam,CURRENT_DATE() ) >=1)");
            detail_buku_dipinjam.setInt(1, id_member);

            ResultSet rs4 = detail_buku_dipinjam.executeQuery();
            while (rs4.next()) {
                M_pinjamBuku buku_dipinjam = new M_pinjamBuku();
                buku_dipinjam.setId_pinjam(rs4.getInt("id_pinjam"));
                buku_dipinjam.setId_buku(rs4.getString("id_buku"));
                buku_dipinjam.setJudul_buku(rs4.getString("judul_buku"));
                buku_dipinjam.setAkhir_pinjam(rs4.getString("akhir_pinjam"));
                buku_dipinjam.setSudah_diambil(rs4.getString("diambilkah"));
                buku_dipinjam.setDikonfirmasikah(rs4.getString("dikonfirmasikah"));
                buku_dipinjam.setPinjam_day_remaining(rs4.getString("pinjam_day_remaining"));
                detail_buku_yang_dipinjam.add(buku_dipinjam);
            }

        } catch (Exception ex) {
            Logger.getLogger(x_Peminjaman.class.getName()).log(Level.SEVERE, null, ex);
        }
        return detail_buku_yang_dipinjam;
    }

    public static List<M_pinjamBuku> getSemuaPeminjaman() {
        ArrayList<M_pinjamBuku> detail_buku_yang_dipinjam = new ArrayList<M_pinjamBuku>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement detail_buku_dipinjam = conn.prepareStatement("SELECT judul_buku, nama_member, id_pinjam, mulai_pinjam, akhir_pinjam FROM pinjam_buku JOIN buku ON pinjam_buku.id_buku=buku.id_buku JOIN member ON pinjam_buku.id_member=member.id_member WHERE batalkah='tidak' AND dikonfirmasikah='belum'");

            ResultSet rs4 = detail_buku_dipinjam.executeQuery();
            while (rs4.next()) {
                M_pinjamBuku buku_dipinjam = new M_pinjamBuku();
                buku_dipinjam.setId_pinjam(rs4.getInt("id_pinjam"));
                buku_dipinjam.setNama_member(rs4.getString("nama_member"));
                buku_dipinjam.setJudul_buku(rs4.getString("judul_buku"));
                buku_dipinjam.setMulai_pinjam(rs4.getString("mulai_pinjam"));
                detail_buku_yang_dipinjam.add(buku_dipinjam);
            }

        } catch (Exception ex) {
            Logger.getLogger(x_Peminjaman.class.getName()).log(Level.SEVERE, null, ex);
        }
        return detail_buku_yang_dipinjam;
    }

    public static List<M_pinjamBuku> getSemuaPeminjaman_yangsudah_dikonfirmasi() {
        ArrayList<M_pinjamBuku> detail_buku_yang_dipinjam = new ArrayList<M_pinjamBuku>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement detail_buku_dipinjam = conn.prepareStatement("SELECT judul_buku, nama_member, id_pinjam, mulai_pinjam, akhir_pinjam FROM pinjam_buku JOIN buku ON pinjam_buku.id_buku=buku.id_buku JOIN member ON pinjam_buku.id_member=member.id_member WHERE dikonfirmasikah='sudah' AND diambilkah='belum'");

            ResultSet rs4 = detail_buku_dipinjam.executeQuery();
            while (rs4.next()) {
                M_pinjamBuku buku_dipinjam = new M_pinjamBuku();
                buku_dipinjam.setId_pinjam(rs4.getInt("id_pinjam"));
                buku_dipinjam.setNama_member(rs4.getString("nama_member"));
                buku_dipinjam.setJudul_buku(rs4.getString("judul_buku"));
                buku_dipinjam.setMulai_pinjam(rs4.getString("mulai_pinjam"));
                detail_buku_yang_dipinjam.add(buku_dipinjam);
            }

        } catch (Exception ex) {
            Logger.getLogger(x_Peminjaman.class.getName()).log(Level.SEVERE, null, ex);
        }
        return detail_buku_yang_dipinjam;
    }

    public void admin_konfirmasiAmbil_SUDAH_DIAMBIL(int id_pinjam) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement ps = conn.prepareStatement("UPDATE pinjam_buku SET diambilkah='sudah' WHERE id_pinjam=?");
            ps.setInt(1, id_pinjam);
            ps.executeUpdate();
            conn.close();

        } catch (Exception ex) {
            Logger.getLogger(x_Peminjaman.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void admin_konfirmasiAmbil_BATAL_DIAMBIL(int id_pinjam) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement ps = conn.prepareStatement("UPDATE pinjam_buku SET diambilkah='batal', dendakah='tidak' WHERE id_pinjam=?");
            ps.setInt(1, id_pinjam);
            ps.executeUpdate();
            conn.close();

        } catch (Exception ex) {
            Logger.getLogger(x_Peminjaman.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void admin_konfirmasiPinjam(int id_pinjam) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement ps = conn.prepareStatement("UPDATE pinjam_buku SET dikonfirmasikah='sudah', batalkah='tidak' WHERE id_pinjam=?");
            ps.setInt(1, id_pinjam);
            ps.executeUpdate();
            conn.close();

        } catch (Exception ex) {
            Logger.getLogger(x_Peminjaman.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void admin_konfirmasiPembatalanPinjam(int id_pinjam, String idBuku_) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement ps = conn.prepareStatement("UPDATE pinjam_buku SET dendakah='tidak', batalkah='ya' WHERE batalkah='onProccess' AND id_pinjam=?");
            ps.setInt(1, id_pinjam);
            ps.executeUpdate();
            
            PreparedStatement ps_2 = conn.prepareStatement("UPDATE buku SET dipinjamkah='tidak' WHERE id_buku=?");
            ps_2.setString(1, idBuku_);
            ps_2.executeUpdate();
            
            conn.close();

        } catch (Exception ex) {
            Logger.getLogger(x_Peminjaman.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static List<M_pinjamBuku> admin_getSemuaPermintaanPembatalan() {
        ArrayList<M_pinjamBuku> detail_buku_yang_dipinjam = new ArrayList<M_pinjamBuku>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement detail_buku_dipinjam = conn.prepareStatement("SELECT buku.id_buku, judul_buku, nama_member, id_pinjam, mulai_pinjam, akhir_pinjam FROM pinjam_buku JOIN buku ON pinjam_buku.id_buku=buku.id_buku JOIN member ON pinjam_buku.id_member=member.id_member WHERE batalkah='onProccess' ORDER BY mulai_pinjam DESC");

            ResultSet rs4 = detail_buku_dipinjam.executeQuery();
            while (rs4.next()) {
                M_pinjamBuku buku_dipinjam = new M_pinjamBuku();
                buku_dipinjam.setId_pinjam(rs4.getInt("id_pinjam"));
                buku_dipinjam.setNama_member(rs4.getString("nama_member"));
                buku_dipinjam.setJudul_buku(rs4.getString("judul_buku"));
                buku_dipinjam.setMulai_pinjam(rs4.getString("mulai_pinjam"));
                buku_dipinjam.setAkhir_pinjam(rs4.getString("akhir_pinjam"));
                buku_dipinjam.setId_buku(rs4.getString("id_buku"));
                detail_buku_yang_dipinjam.add(buku_dipinjam);
            }

        } catch (Exception ex) {
            Logger.getLogger(x_Peminjaman.class.getName()).log(Level.SEVERE, null, ex);
        }
        return detail_buku_yang_dipinjam;
    }

    public static List<M_pinjamBuku> getHistoryPeminjaman() {
        ArrayList<M_pinjamBuku> detail_buku_yang_dipinjam = new ArrayList<M_pinjamBuku>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement detail_buku_dipinjam = conn.prepareStatement("SELECT judul_buku, nama_member, id_pinjam, mulai_pinjam, akhir_pinjam FROM pinjam_buku JOIN buku ON pinjam_buku.id_buku=buku.id_buku JOIN member ON pinjam_buku.id_member=member.id_member WHERE diambilkah='sudah' ORDER BY mulai_pinjam DESC");

            ResultSet rs4 = detail_buku_dipinjam.executeQuery();
            while (rs4.next()) {
                M_pinjamBuku buku_dipinjam = new M_pinjamBuku();
                buku_dipinjam.setId_pinjam(rs4.getInt("id_pinjam"));
                buku_dipinjam.setNama_member(rs4.getString("nama_member"));
                buku_dipinjam.setJudul_buku(rs4.getString("judul_buku"));
                buku_dipinjam.setMulai_pinjam(rs4.getString("mulai_pinjam"));
                buku_dipinjam.setAkhir_pinjam(rs4.getString("akhir_pinjam"));
                detail_buku_yang_dipinjam.add(buku_dipinjam);
            }

        } catch (Exception ex) {
            Logger.getLogger(x_Peminjaman.class.getName()).log(Level.SEVERE, null, ex);
        }
        return detail_buku_yang_dipinjam;
    }

    public static List<M_pinjamBuku> getHistoryPeminjaman_yangMauDikembalikan() {
        ArrayList<M_pinjamBuku> detail_buku_yang_dipinjam = new ArrayList<M_pinjamBuku>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement detail_buku_dipinjam = conn.prepareStatement("SELECT judul_buku, buku.id_buku, member.id_member, nama_member, id_pinjam, mulai_pinjam, akhir_pinjam FROM pinjam_buku JOIN buku ON pinjam_buku.id_buku=buku.id_buku JOIN member ON pinjam_buku.id_member=member.id_member WHERE diambilkah='sudah' AND dikembalikan='belum' ORDER BY mulai_pinjam DESC");

            ResultSet rs4 = detail_buku_dipinjam.executeQuery();
            while (rs4.next()) {
                M_pinjamBuku buku_dipinjam = new M_pinjamBuku();
                buku_dipinjam.setId_pinjam(rs4.getInt("id_pinjam"));
                buku_dipinjam.setId_buku(rs4.getString("id_buku"));
                buku_dipinjam.setId_member(rs4.getInt("id_member"));
                buku_dipinjam.setNama_member(rs4.getString("nama_member"));
                buku_dipinjam.setJudul_buku(rs4.getString("judul_buku"));
                buku_dipinjam.setMulai_pinjam(rs4.getString("mulai_pinjam"));
                buku_dipinjam.setAkhir_pinjam(rs4.getString("akhir_pinjam"));
                detail_buku_yang_dipinjam.add(buku_dipinjam);
            }

        } catch (Exception ex) {
            Logger.getLogger(x_Peminjaman.class.getName()).log(Level.SEVERE, null, ex);
        }
        return detail_buku_yang_dipinjam;
    }

    public static List<M_pinjamBuku> member_getBuku_yang_mauDIBATALKAN(int id_member) {
        ArrayList<M_pinjamBuku> detail_buku_yang_dipinjam = new ArrayList<M_pinjamBuku>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement detail_buku_dipinjam = conn.prepareStatement("SELECT dikonfirmasikah, batalkah, judul_buku, nama_member, id_pinjam, mulai_pinjam, akhir_pinjam FROM pinjam_buku JOIN buku ON pinjam_buku.id_buku=buku.id_buku JOIN member ON pinjam_buku.id_member=member.id_member WHERE dikonfirmasikah='belum' AND pinjam_buku.id_member=?");
            detail_buku_dipinjam.setInt(1, id_member);

            ResultSet rs4 = detail_buku_dipinjam.executeQuery();
            while (rs4.next()) {
                M_pinjamBuku buku_dipinjam = new M_pinjamBuku();
                buku_dipinjam.setId_pinjam(rs4.getInt("id_pinjam"));
                buku_dipinjam.setJudul_buku(rs4.getString("judul_buku"));
                buku_dipinjam.setAkhir_pinjam(rs4.getString("akhir_pinjam"));
                buku_dipinjam.setDikonfirmasikah(rs4.getString("dikonfirmasikah"));
                buku_dipinjam.setBatalkah(rs4.getString("batalkah"));
                detail_buku_yang_dipinjam.add(buku_dipinjam);
            }

        } catch (Exception ex) {
            Logger.getLogger(x_Peminjaman.class.getName()).log(Level.SEVERE, null, ex);
        }
        return detail_buku_yang_dipinjam;
    }

    public void member_mengajukanPembatalan(int idPinjam_) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement ps = conn.prepareStatement("UPDATE pinjam_buku SET batalkah='onProccess' WHERE id_pinjam=?");
            ps.setInt(1, idPinjam_);
            ps.executeUpdate();
            conn.close();

        } catch (Exception ex) {
            Logger.getLogger(x_Peminjaman.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void member_perpanjangPinjam(int idPinjam_) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement ps = conn.prepareStatement("UPDATE pinjam_buku SET akhir_pinjam=(akhir_pinjam + INTERVAL 7 DAY) WHERE id_pinjam=?");
            ps.setInt(1, idPinjam_);
            ps.executeUpdate();
            conn.close();

        } catch (Exception ex) {
            Logger.getLogger(x_Peminjaman.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static List<M_detailBuku_Dipinjam> getDetailBuku_yangDipinjam(int id_peminjaman) {
        ArrayList<M_detailBuku_Dipinjam> detail_buku_yang_dipinjam = new ArrayList<M_detailBuku_Dipinjam>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement detail_buku_dipinjam = conn.prepareStatement("SELECT *, DATEDIFF(akhir_pinjam,CURRENT_DATE() ) AS pinjam_day_remaining FROM buku INNER JOIN pinjam_buku USING (id_buku) WHERE id_pinjam=?");
            detail_buku_dipinjam.setInt(1, id_peminjaman);

            ResultSet rs4 = detail_buku_dipinjam.executeQuery();
            while (rs4.next()) {
                M_detailBuku_Dipinjam buku_dipinjam = new M_detailBuku_Dipinjam();
                buku_dipinjam.setId_pinjam(rs4.getInt("id_pinjam"));

                buku_dipinjam.setJudul_buku(rs4.getString("judul_buku"));
                buku_dipinjam.setIsbn_buku(rs4.getString("isbn_buku"));
                buku_dipinjam.setPenerbit_buku(rs4.getString("penerbit_buku"));
                buku_dipinjam.setPengarang_buku(rs4.getString("pengarang_buku"));
                buku_dipinjam.setKategori_buku(rs4.getString("kategori_buku"));
                buku_dipinjam.setTahunterbit_buku(rs4.getString("tahunterbit_buku"));

                buku_dipinjam.setMulai_pinjam(rs4.getString("mulai_pinjam"));
                buku_dipinjam.setAkhir_pinjam(rs4.getString("akhir_pinjam"));
                buku_dipinjam.setPinjam_day_remaining(rs4.getString("pinjam_day_remaining"));
                buku_dipinjam.setDikonfirmasikah(rs4.getString("dikonfirmasikah"));
                buku_dipinjam.setSudah_diambil(rs4.getString("diambilkah"));
                detail_buku_yang_dipinjam.add(buku_dipinjam);
            }

        } catch (Exception ex) {
            Logger.getLogger(x_Peminjaman.class.getName()).log(Level.SEVERE, null, ex);
        }
        return detail_buku_yang_dipinjam;
    }
    
    //--------------------------------------------------------------------------------------------------------------
    
    public String getJumlahBuku_dipinjamMember(int id_member) {
        int jumlah_buku_dipinjam = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement psJml_bukuDipinjam = conn.prepareStatement("SELECT COUNT(*) AS jumlah_buku_dipinjam FROM pinjam_buku WHERE id_member=? AND diambilkah='sudah' AND dikembalikan='belum'");
            psJml_bukuDipinjam.setInt(1, id_member);
            ResultSet rs4 = psJml_bukuDipinjam.executeQuery();

            while (rs4.next()) {
                jumlah_buku_dipinjam = rs4.getInt("jumlah_buku_dipinjam");
            }

        } catch (Exception ex) {
            Logger.getLogger(x_Member.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Integer.toString(jumlah_buku_dipinjam);
    }
    
    public String getBanyaknyaDendaMember(int id_member) {
        int jumlah_DendaMember = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement psJmlDenda = conn.prepareStatement("SELECT COUNT(*) AS banyaknyaDendaMember FROM denda INNER JOIN pinjam_buku USING (id_pinjam) JOIN buku ON buku.id_buku=pinjam_buku.id_buku WHERE dendakah='ya' AND dibayarkah='belum' AND pinjam_buku.id_member=?");
            psJmlDenda.setInt(1, id_member);
            
            ResultSet rs4 = psJmlDenda.executeQuery();

            while (rs4.next()) {
                jumlah_DendaMember = rs4.getInt("banyaknyaDendaMember");
            }

        } catch (Exception ex) {
            Logger.getLogger(x_Buku.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Integer.toString(jumlah_DendaMember);
    }
    
    //--------------------------------------------------------------------------------------
    public String getBanyaknyaMemberMengajukanBatal() {
        int jumlah = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement psJmlDenda = conn.prepareStatement("SELECT COUNT(*) AS memberMengajukanPembatalan  FROM pinjam_buku JOIN buku ON pinjam_buku.id_buku=buku.id_buku JOIN member ON pinjam_buku.id_member=member.id_member WHERE batalkah='onProccess' ORDER BY mulai_pinjam DESC");
            
            
            ResultSet rs4 = psJmlDenda.executeQuery();

            while (rs4.next()) {
                jumlah = rs4.getInt("memberMengajukanPembatalan");
            }

        } catch (Exception ex) {
            Logger.getLogger(x_Buku.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Integer.toString(jumlah);
    }
    
    public String getJmlMemberMintaKonfirm() {
        int jumlah = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement psJmlDenda = conn.prepareStatement("SELECT COUNT(*) AS membermintaKonfirmPinjam FROM pinjam_buku JOIN buku ON pinjam_buku.id_buku=buku.id_buku JOIN member ON pinjam_buku.id_member=member.id_member WHERE batalkah='tidak' AND dikonfirmasikah='belum'");
            
            
            ResultSet rs4 = psJmlDenda.executeQuery();

            while (rs4.next()) {
                jumlah = rs4.getInt("membermintaKonfirmPinjam");
            }

        } catch (Exception ex) {
            Logger.getLogger(x_Buku.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Integer.toString(jumlah);
    }
    
    public String getJmlMauAmbilBuku() {
        int jumlah = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement psJmlDenda = conn.prepareStatement("SELECT COUNT(*) AS memberAmbilBuku FROM pinjam_buku JOIN buku ON pinjam_buku.id_buku=buku.id_buku JOIN member ON pinjam_buku.id_member=member.id_member WHERE dikonfirmasikah='sudah' AND diambilkah='belum'");
            
            
            ResultSet rs4 = psJmlDenda.executeQuery();

            while (rs4.next()) {
                jumlah = rs4.getInt("memberAmbilBuku");
            }

        } catch (Exception ex) {
            Logger.getLogger(x_Buku.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Integer.toString(jumlah);
    }
    
    public String getMemberBlmBayarDenda() {
        int jumlah = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement psJmlDenda = conn.prepareStatement("SELECT COUNT(*) AS memberKenaDenda FROM denda INNER JOIN member USING (id_member) WHERE dibayarkah='belum'");
            
            
            ResultSet rs4 = psJmlDenda.executeQuery();

            while (rs4.next()) {
                jumlah = rs4.getInt("memberKenaDenda");
            }

        } catch (Exception ex) {
            Logger.getLogger(x_Buku.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Integer.toString(jumlah);
    }

}
