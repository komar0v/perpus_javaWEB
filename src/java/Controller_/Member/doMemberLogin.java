/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller_.Member;

import Controller_.koneksi_db;
import DAO_.x_Admin;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
@WebServlet(name = "doMemberLogin", urlPatterns = {"/member/doMemberLogin"})
public class doMemberLogin extends HttpServlet {

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
        String emailMember = request.getParameter("emailMember");
        String passwordMember = request.getParameter("passwordMember");
        String id_Member = "", email_member = "", pswd_member = "", nama_member = "";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = koneksi_db.initializeDatabase();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM member WHERE email_member=? AND password_member=?");
            ps.setString(1, emailMember);
            ps.setString(2, passwordMember);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                id_Member = rs.getString("id_member");
                email_member = rs.getString("email_member");
                pswd_member = rs.getString("password_member");
                nama_member = rs.getString("nama_member");
            }

            conn.close();

            if ((email_member.equals(emailMember)) && pswd_member.equals(passwordMember)) {
                System.out.println("===========================BERHASIL");
                HttpSession oldSession = request.getSession(false);
                if (oldSession != null) {
                    oldSession.invalidate();
                }
                //generate a new session
                HttpSession newSession = request.getSession(true);

                //setting session to expiry in 5 mins
                newSession.setMaxInactiveInterval(5 * 60);

                Cookie namaMember = new Cookie("namaMember", nama_member);
                Cookie idMember = new Cookie("idMember", id_Member);
                Cookie emailnyaMember = new Cookie("emailnyaMember", email_member);

                response.addCookie(idMember);
                response.addCookie(emailnyaMember);
                response.addCookie(namaMember);
                HttpSession session = request.getSession(true);

                session.setAttribute("flashMessageMember", "toastr.success(\"Halo, "+namaMember.getValue()+"\",\"Selamat Datang!\",{showMethod:\"slideDown\",hideMethod:\"slideUp\",timeOut:3000});");
                response.sendRedirect(request.getContextPath()+"/member/home");

            } else {
                System.out.println("===========================GAGAL");
                HttpSession session = request.getSession(true);

                session.setAttribute("flashStatusRegister", "Swal.fire({icon:\"error\",title:\"Gagal!\",text:\"E-Mail atau Password Salah\"});");
                response.sendRedirect(request.getContextPath()+"/");
            }

        } catch (Exception ex) {
            Logger.getLogger(doMemberLogin.class.getName()).log(Level.SEVERE, null, ex);
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
