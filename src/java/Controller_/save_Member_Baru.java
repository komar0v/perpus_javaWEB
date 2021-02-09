/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller_;

import DAO_.x_Member;
import Model_.M_akunMember;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "save_Member_Baru", urlPatterns = {"/save_Member_Baru"})
public class save_Member_Baru extends HttpServlet {

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

        Random rand = new Random();
        int idMember_4digit = 0;
        int idMember_fix = 0;
        for (int i = 1; i <= 10; i++) {
            idMember_4digit = rand.nextInt((9999 - 100) + 1) + 10;
            String str_idMember_4digit = Integer.toString(idMember_4digit)+"2020";
            idMember_fix = Integer.parseInt(str_idMember_4digit);
        }

        M_akunMember member_ = new M_akunMember();
        member_.setId_member(idMember_fix);
        member_.setNama_member(request.getParameter("namaleng_member"));
        member_.setEmail_member(request.getParameter("email_member"));
        member_.setAlamat_member(request.getParameter("alamat_member"));
        member_.setNotel_member(request.getParameter("notel_member"));
        member_.setPassword_member(request.getParameter("password_member"));

        String jenis_kelamin = request.getParameter("jeniskel_member");
        
        if("1".equals(jenis_kelamin)){
            member_.setJeniskel_member("Perempuan");
        }else{
            member_.setJeniskel_member("Laki-laki");
        }
        
        x_Member daoMember = new x_Member();
        daoMember.register_member_baru(member_);
        HttpSession session = request.getSession(true);

        session.setAttribute("flashStatusRegister", "Swal.fire({icon:\"success\",title:\"Berhasil Register\",text:\"Silahkan login!\"});");

        response.sendRedirect("./");

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
