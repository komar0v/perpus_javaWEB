/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet_views.v_admin;

import DAO_.x_Buku;
import DAO_.x_Member;
import DAO_.x_Peminjaman;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "admin_home", urlPatterns = {"/admin/home"})
public class admin_home extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        String user_Admin = null;

        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("usernameAdmin")) {
                user_Admin = cookie.getValue();
            }
        }
        if (user_Admin != null) {
            x_Buku daoBuku = new x_Buku();
            x_Member daoMember = new x_Member();
            x_Peminjaman daoPinjam = new x_Peminjaman();
            
            String jmlBuku = daoBuku.getJumlahSemuaBuku();
            request.setAttribute("jumlahKoleksiBuku", jmlBuku);
            
            String jmlMember = daoMember.getJumlahMember();
            request.setAttribute("jumlahMember", jmlMember);
            
            String jmlMemberMintaBatal = daoPinjam.getBanyaknyaMemberMengajukanBatal();
            request.setAttribute("jumlahMemberMintaBatal", jmlMemberMintaBatal);
            
            String memberMintaKonfirmPinjam = daoPinjam.getJmlMemberMintaKonfirm();
            request.setAttribute("jumlahMemberMintaKonfirmPinjam", memberMintaKonfirmPinjam);
            
            String memberMauAmbilBuku = daoPinjam.getJmlMauAmbilBuku();
            request.setAttribute("jumlahMemberMauAmbilBuku", memberMauAmbilBuku);
            
            String memberKenaDenda = daoPinjam.getMemberBlmBayarDenda();
            request.setAttribute("jumlahMemberBelumBayarDenda", memberKenaDenda);
            
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/Views_/Panel_Admin/screen_home_admin.jsp");
            rd.forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/login");
        }

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
