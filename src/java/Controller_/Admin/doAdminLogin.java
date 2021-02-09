/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller_.Admin;

import Controller_.koneksi_db;
import DAO_.x_Admin;
import Model_.M_akunAdmin;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "doAdminLogin", urlPatterns = {"/admin/doAdminLogin"})
public class doAdminLogin extends HttpServlet {

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
        String usernameAdmin = request.getParameter("usernameA");
        String passwordAdmin = request.getParameter("passwordA");
        String id_Admin = "", uname_Admin = "", pswd_Admin = "", nama_admin = "";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM akun_admin WHERE username=? AND password=?");
            ps.setString(1, usernameAdmin);
            ps.setString(2, passwordAdmin);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                id_Admin = rs.getString("id_admin");
                uname_Admin = rs.getString("username");
                pswd_Admin = rs.getString("password");
                nama_admin = rs.getString("nama_admin");
            }

            conn.close();

            if ((uname_Admin.equals(usernameAdmin)) && pswd_Admin.equals(passwordAdmin)) {
                System.out.println("===========================BERHASIL");
                HttpSession oldSession = request.getSession(false);
                if (oldSession != null) {
                    oldSession.invalidate();
                }
                //generate a new session
                HttpSession newSession = request.getSession(true);

                //setting session to expiry in 5 mins
                newSession.setMaxInactiveInterval(5 * 60);

                Cookie namaAdmin = new Cookie("namaAdmin", nama_admin);
                Cookie idAdmin = new Cookie("idAdmin", id_Admin);
                Cookie unameAdmin = new Cookie("usernameAdmin", uname_Admin);

                response.addCookie(idAdmin);
                response.addCookie(unameAdmin);
                response.addCookie(namaAdmin);
                HttpSession session = request.getSession(true);

                session.setAttribute("flashMessageAdmin", "Toast.fire({icon: \"success\",title: \"  Selamat Datang, "+namaAdmin.getValue()+" \"});");
                response.sendRedirect(request.getContextPath()+"/admin/home");

            } else {
                System.out.println("===========================GAGAL");
                HttpSession session = request.getSession(true);

                session.setAttribute("flashMessageAdmin", "Toast.fire({icon: \"error\",title: \"  Gagal!\"});");
                response.sendRedirect(request.getContextPath()+"/admin/login");
            }

        } catch (Exception ex) {
            Logger.getLogger(doAdminLogin.class.getName()).log(Level.SEVERE, null, ex);
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
