/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller_.Member;

import DAO_.x_Peminjaman;
import java.io.IOException;
import java.io.PrintWriter;
import Model_.M_pinjamBuku;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "doMember_pinjamBuku", urlPatterns = {"/member/doMember_pinjamBuku"})
public class doMember_pinjamBuku extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String cookienamaMember = null;
        String cookieemailnyaMember = null;
        String cookieidMember = null;

        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("namaMember")) {
                cookienamaMember = cookie.getValue();
            }
            if (cookie.getName().equals("emailnyaMember")) {
                cookieemailnyaMember = cookie.getValue();
            }
            if (cookie.getName().equals("idMember")) {
                cookieidMember = cookie.getValue();
            }
        }

        if (cookieemailnyaMember != null) {
            HttpSession session = request.getSession(true);

            String kodeBuku_string = request.getParameter("kodeBuku");
            String tanggal_ambil = request.getParameter("tanggalAmbilBuku");

            if ((tanggal_ambil == null) || (tanggal_ambil.equalsIgnoreCase(""))) {
                session.setAttribute("flashMessageMember", "toastr.error(\"Tanggal ambil tidak valid\",\"Gagal!\",{showMethod:\"slideDown\",hideMethod:\"slideUp\",timeOut:3000});");
                response.sendRedirect(request.getContextPath() + "/member/detailBuku?idBuku="+kodeBuku_string);
            } else {
                int idMember_int = Integer.parseInt(cookieidMember);

                Random rand = new Random();
                int idPinjam_8digit = 0;
                int idPinjam_fix = 0;
                for (int i = 1; i <= 10; i++) {
                    idPinjam_8digit = rand.nextInt((9999 - 1010) + 10) + 150;
                    String str_idPinjam_8digit = Integer.toString(idPinjam_8digit) + "2020";
                    idPinjam_fix = Integer.parseInt(str_idPinjam_8digit);
                }

                M_pinjamBuku pinjemBuku = new M_pinjamBuku();
                pinjemBuku.setMulai_pinjam(tanggal_ambil);
                pinjemBuku.setId_pinjam(idPinjam_fix);
                pinjemBuku.setId_buku(kodeBuku_string);
                pinjemBuku.setId_member(idMember_int);
                pinjemBuku.setSudah_diambil("belum");
                pinjemBuku.setDikonfirmasikah("belum");
                pinjemBuku.setBatalkah("tidak");
                pinjemBuku.setDikembalikan("belum");

                x_Peminjaman daoPinjam = new x_Peminjaman();
                daoPinjam.member_pinjamBuku(pinjemBuku);

                session.setAttribute("flashMessageMember", "toastr.success(\"Silahkan ambil di perpustakaan\",\"Berhasil pinjam!\",{showMethod:\"slideDown\",hideMethod:\"slideUp\",timeOut:3000});");
                response.sendRedirect(request.getContextPath() + "/member/home");
            }

        } else {
            response.sendRedirect(request.getContextPath() + "/");
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
