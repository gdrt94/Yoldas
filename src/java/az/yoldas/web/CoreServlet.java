/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package az.yoldas.web;

import az.yoldas.database.DatabaseUtility;
import az.yoldas.database.MySqlCoreDao;
import az.yoldas.database.CoreDao;
import az.yoldas.domain.User;
import az.yoldas.service.DefaultCoreService;
import az.yoldas.service.CoreService;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

/**
 *
 * @author Gudrat
 */
public class CoreServlet extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        try {
            DataSource ds = DatabaseUtility.connect();
            CoreDao coreDao = new MySqlCoreDao(ds);
            CoreService coreService = new DefaultCoreService(coreDao);
            
            HttpSession session = request.getSession();

            String lats [] = request.getParameterValues("lats");
            String lngs [] = request.getParameterValues("lngs");
            //System.out.println(lats);
            //System.out.println(lngs);
            double[] dLats = new double[7];
            double[] dLngs = new double[7];
            for(int i = 0; i < lats.length; i++) {
                if(!"".equals(lats[i])&&lats[i] != null)
                dLats[i] = Double.parseDouble(lats[i]);
            }
            for(int i = 0; i < lngs.length; i++) {
                if(!"".equals(lngs[i])&&lngs[i] != null)
                dLngs[i] = Double.parseDouble(lngs[i]);
            }

            User user = (User) session.getAttribute("user");
            boolean success = coreService.addTrip(user.getId(), dLats, dLngs);
            String addResult = "";
            if(success) {
                addResult = "Yeni marşrutunuz uğurla yerləşdirilmişdir";
            } else {
                addResult = "Marşrutunuzu yerləşdirmək mümkün olmadı. Bir daha sınayın";
            }

            RequestDispatcher rd = request.getRequestDispatcher("main.jsp");
            request.setAttribute("addResult", addResult);
            rd.forward(request, response);
            //create ends
            
            
        } catch(Exception e) {
            e.printStackTrace();
        } finally {            
            out.close();
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
