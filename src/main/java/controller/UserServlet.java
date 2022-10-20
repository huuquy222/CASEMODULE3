package controller;


import model.Country;
import model.Role;
import model.User;
import service.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "UserServlet", urlPatterns = "/users")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;
    private ICountryDAO iCountryDAO;
    private IRoleDAO roleDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
        iCountryDAO = new CountryDAO();
        roleDAO=new RoleDAO();
       List<Country> countryList = iCountryDAO.selectAllCountry();
        if (getServletContext().getAttribute("countryList") == null) {
            getServletContext().setAttribute("countryList", countryList);
        }
        List<Role> roleList = roleDAO.selectAllRole();
        if (getServletContext().getAttribute("roleList") == null) {
            getServletContext().setAttribute("roleList", roleList);
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        try {
            switch (action) {
                case "create":
                    showNewForm(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "delete":
                    deleteUser(request, response);
                    break;
                default:
//                    listUser(request, response);
                    listuserPagging(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listuserPagging(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String q = "";
        int page = 1;
        int recordsPerPage = 5;

        if (request.getParameter("q") != null) {
            q = request.getParameter("q");
        }
        if(request.getParameter("page") != null)
            page = Integer.parseInt(request.getParameter("page"));
        List<User> listUser = userDAO.selectUsersPagging((page-1)*recordsPerPage, recordsPerPage, q);
        int noOfRecords = userDAO.getNoOfRecords();
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);

        request.setAttribute("listUser", listUser);
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);

        RequestDispatcher view = request.getRequestDispatcher("user/list_paging.jsp");
        view.forward(request, response);
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
     List<User> listUser = userDAO.selectAllUsers();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/list.jsp");
        dispatcher.forward(request, response);
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
       int id = Integer.parseInt(request.getParameter("id"));
        userDAO.deleteUser(id);

        response.sendRedirect("/users");
    }
   private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        User existingUser = userDAO.selectUser(id);
       RequestDispatcher dispatcher = request.getRequestDispatcher("user/edit.jsp");
       request.setAttribute("user", existingUser);
        dispatcher.forward(request, response);
    }
    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      RequestDispatcher dispatcher = request.getRequestDispatcher("user/create.jsp");
       dispatcher.forward(request, response);
  }


  @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String action = request.getParameter("action");
      if (action == null) {
          action = "";
       }
       try {
           switch (action) {
                case "create":
                  insertUser(request, response);
                   break;
              case "edit":
                  updateUser(request, response);
                   break;
          }
     } catch (SQLException ex) {
          throw new ServletException(ex);
       }
   }


    private void insertUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
      String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        int idCountry = Integer.parseInt(request.getParameter("idcountry"));
        String address = request.getParameter("address");
        int idrole = Integer.parseInt(request.getParameter("idrole"));
       userDAO.insertUser(new User(name, email,password, idCountry,address, idrole));
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/create.jsp");
        dispatcher.forward(request, response);
   }

  private void updateUser(HttpServletRequest request, HttpServletResponse response) throws SQLException,ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
       String email = request.getParameter("email");
        String password = request.getParameter("password");
      int idCountry = Integer.parseInt(request.getParameter("idcountry"));
      String address = request.getParameter("address");
      int idrole = Integer.parseInt(request.getParameter("idrole"));


      User book = new User(id, name,password, email, idCountry,address,idrole);
       userDAO.updateUser(book);
      response.sendRedirect("/users");
   }


}
