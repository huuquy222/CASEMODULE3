package controller;

import model.Country;
import model.Product;
import model.User;
import service.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    private IUserDAO iUserDAO;
    private ICountryDAO iCountryDAO;



    @Override
    public void init() throws ServletException {
        iUserDAO = new UserDAO();
        iCountryDAO = new CountryDAO();
        List<Country> listCountry = iCountryDAO.selectAllCountry();

        if (this.getServletContext().getAttribute("listCountry") == null) {
            this.getServletContext().setAttribute("listCountry", listCountry);}

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("logintted/index.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        User  user = null;
        try {
            user =  iUserDAO.selectUser(1);
            if (user.getEmail().equals(email) && user.getPassword().equals(password)){
                resp.sendRedirect("/products");
                return;
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
//            userList.
        }
        boolean flag = true;
//        for (User user : userList){
//            if (user.getEmail().equals(email) && user.getPassword().equals(password)){
//                resp.sendRedirect("/products");
//                break;
//            }
//        }

    }

}