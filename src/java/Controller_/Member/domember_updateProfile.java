/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller_.Member;

import DAO_.x_Member;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "domember_updateProfile", urlPatterns = {"/member/domember_updateProfile"})
public class domember_updateProfile extends HttpServlet {

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

            String idMember_string = request.getParameter("idMember");
            int idMember_int = Integer.parseInt(idMember_string);

            String namaMember = request.getParameter("namaMember");
            String notelMember = request.getParameter("notelMember");
            String emailMember = request.getParameter("emailMember");
            String jeniskelMember = request.getParameter("jeniskelMember");
            String alamatMember = request.getParameter("alamatMember");

            Cookie new_namaMember = new Cookie("namaMember", namaMember);
            Cookie new_emailnyaMember = new Cookie("emailnyaMember", emailMember);

            response.addCookie(new_emailnyaMember);
            response.addCookie(new_namaMember);

            x_Member daoMember = new x_Member();
            daoMember.updateProfileMember(idMember_int, namaMember, alamatMember, emailMember, jeniskelMember, notelMember);

            session.setAttribute("flashMessageMember", "toastr.success(\"Halo, " + namaMember + "\",\"Perubahan disimpan!\",{showMethod:\"slideDown\",hideMethod:\"slideUp\",timeOut:3000});");
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
