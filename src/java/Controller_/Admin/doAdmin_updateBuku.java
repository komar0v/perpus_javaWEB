/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller_.Admin;

import DAO_.x_Buku;
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
@WebServlet(name = "doAdmin_updateBuku", urlPatterns = {"/admin/doAdmin_updateBuku"})
public class doAdmin_updateBuku extends HttpServlet {

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
        String user_Admin = null;

        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("usernameAdmin")) {
                user_Admin = cookie.getValue();
            }
        }
        if (user_Admin != null) {
            String idBuku = request.getParameter("kodeBuku");
            String judulBuku = request.getParameter("judulBuku");
            String pengarangBuku = request.getParameter("pengarangBuku");
            String isbnBuku = request.getParameter("isbnBuku");
            String kategoriBuku = request.getParameter("kategoriBuku");
            String tahunTerbitBuku = request.getParameter("tahunTerbitBuku");
            String penerbitBuku = request.getParameter("penerbitBuku");

            HttpSession session = request.getSession(true);
            boolean hasDigit = isbnBuku.matches(".*\\d+.*");
            if (hasDigit == true) {
                x_Buku daoBuku = new x_Buku();
                daoBuku.updateBuku(idBuku, judulBuku, pengarangBuku, penerbitBuku, tahunTerbitBuku, isbnBuku, kategoriBuku);

                session.setAttribute("flashMessageAdmin", "Toast.fire({icon: \"success\",title: \" Data buku berhasil diubah \"});");
                response.sendRedirect(request.getContextPath() + "/admin/showBuku");
            } else {
                session.setAttribute("flashMessageAdmin", "Toast.fire({icon: \"error\",title: \" Perubahan gagal disimpan \"});");
                response.sendRedirect(request.getContextPath() + "/admin/editBuku?idBuku_=" + idBuku);
            }

        } else {
            response.sendRedirect(request.getContextPath() + "/admin/login");
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
