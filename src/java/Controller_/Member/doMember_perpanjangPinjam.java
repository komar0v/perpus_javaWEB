/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller_.Member;

import DAO_.x_Peminjaman;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "doMember_perpanjangPinjam", urlPatterns = {"/member/doMember_perpanjangPinjam"})
public class doMember_perpanjangPinjam extends HttpServlet {

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

            String idPinjam_string = request.getParameter("idPinjam_");
            int iidPinjam_int = Integer.parseInt(idPinjam_string);

            x_Peminjaman daoMember = new x_Peminjaman();
            daoMember.member_perpanjangPinjam(iidPinjam_int);

            session.setAttribute("flashMessageMember", "toastr.success(\"\",\"Perpanjang Berhasil!\",{showMethod:\"slideDown\",hideMethod:\"slideUp\",timeOut:3000});");
            response.sendRedirect(request.getContextPath() + "/member/home");
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
