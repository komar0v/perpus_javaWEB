/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller_.Admin;

import DAO_.x_Buku;
import Model_.M_buku;
import java.io.IOException;
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
@WebServlet(name = "doAdmin_addBuku", urlPatterns = {"/admin/doAdmin_addBuku"})
public class doAdmin_addBuku extends HttpServlet {

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
            String judulBuku = request.getParameter("judulBuku");
            String pengarangBuku = request.getParameter("pengarangBuku");
            String isbnBuku = request.getParameter("isbnBuku");
            String kategoriBuku = request.getParameter("kategoriBuku");
            String kodeBuku = request.getParameter("kodeBuku");
            String tahunTerbitBuku = request.getParameter("tahunTerbitBuku");
            String penerbitBuku = request.getParameter("penerbitBuku");

            M_buku dataBuku = new M_buku();
            Random rndm3digit = new Random();
            int random3digit = rndm3digit.nextInt(900) + 100;
            String rndm3digit_ = Integer.toString(random3digit);

            String id_buku;
            id_buku = kodeBuku + "-" + rndm3digit_ + "-" + tahunTerbitBuku;

            dataBuku.setId_buku(id_buku);
            dataBuku.setJudul_buku(judulBuku);
            dataBuku.setPengarang_buku(pengarangBuku);
            dataBuku.setPenerbit_buku(penerbitBuku);
            dataBuku.setKategori_buku(kategoriBuku);
            dataBuku.setIsbn_buku(isbnBuku);
            dataBuku.setTahunterbit_buku(tahunTerbitBuku);

            HttpSession session = request.getSession(true);
            boolean hasDigit = isbnBuku.matches(".*\\d+.*");
            
            if (hasDigit == true) {
                x_Buku daoBuku = new x_Buku();
                daoBuku.addBuku(dataBuku);
                session.setAttribute("flashMessageAdmin", "Toast.fire({icon: \"success\",title: \" Buku berhasil ditambahkan \"});");
                response.sendRedirect(request.getContextPath() + "/admin/showBuku");
            } else {
                session.setAttribute("flashMessageAdmin", "Toast.fire({icon: \"error\",title: \" Buku gagal ditambahkan \"});");
                response.sendRedirect(request.getContextPath() + "/admin/addBuku");
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
