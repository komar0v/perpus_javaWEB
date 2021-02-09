/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller_.Member;

import DAO_.x_Member;
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
@WebServlet(name = "domember_savePasswordBaru", urlPatterns = {"/member/domember_savePasswordBaru"})
public class domember_savePasswordBaru extends HttpServlet {

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

            String idMember_string = request.getParameter("idMember_");
            int idMember_int = Integer.parseInt(idMember_string);

            String passBaru = request.getParameter("passBaru_");

            String nama_Member = null;
            String email_member = null;
            String id_Member = null;

            Cookie namaMember = new Cookie("namaMember", nama_Member);
            Cookie idMember = new Cookie("idMember", id_Member);
            Cookie emailMember = new Cookie("emailnyaMember", email_member);

            namaMember.setMaxAge(0);
            emailMember.setMaxAge(0);
            idMember.setMaxAge(0);

            response.addCookie(namaMember);
            response.addCookie(emailMember);
            response.addCookie(idMember);

            x_Member daoMember = new x_Member();
            daoMember.updatePasswordMember(idMember_int, passBaru);

            if (session != null) {
                session.invalidate();
            }
            
            HttpSession NEWsession = request.getSession(true);

            NEWsession.setAttribute("flashStatusRegister", "Swal.fire({icon:\"success\",title:\"Password berhasil diganti!\",text:\"Silahkan Login kembali\"});");
            response.sendRedirect(request.getContextPath() + "/");
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
