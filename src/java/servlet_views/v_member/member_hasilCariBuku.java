/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet_views.v_member;

import DAO_.x_Buku;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "member_hasilCariBuku", urlPatterns = {"/member/cariBuku"})
public class member_hasilCariBuku extends HttpServlet {

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

        String keywrd_cariBuku_dgnLogin = request.getParameter("keyword_cari");

        String namaMember = null;
        String emailnyaMember = null;
        String idMember = null;

        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("namaMember")) {
                namaMember = cookie.getValue();
            }
            if (cookie.getName().equals("emailnyaMember")) {
                emailnyaMember = cookie.getValue();
            }
            if (cookie.getName().equals("idMember")) {
                idMember = cookie.getValue();
            }
        }

        if (emailnyaMember != null) {
            request.setAttribute("keywordCaribuku", keywrd_cariBuku_dgnLogin);
            request.setAttribute("detailBuku_hasilcari", x_Buku.cariBuku_denganLogin(keywrd_cariBuku_dgnLogin));

            List hasilCari = x_Buku.cariBuku_denganLogin(keywrd_cariBuku_dgnLogin);
            if (hasilCari.isEmpty() == true) {
                HttpSession session = request.getSession(true);
                session.setAttribute("flashMessageMember", "toastr.error(\"Buku tidak ditemukan\",\"Maaf\",{showMethod:\"slideDown\",hideMethod:\"slideUp\",timeOut:3000});");
                response.sendRedirect(request.getContextPath() + "/member/home");
            } else {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/Views_/Panel_Member/screen_cariBuku_member.jsp");
                rd.forward(request, response);
            }

        } else {
            response.sendRedirect(request.getContextPath() + "/");
        }
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
