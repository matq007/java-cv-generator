package cz.muni.fi.jarvan.web;

import cz.muni.fi.jarvan.auth.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import javax.servlet.http.HttpSession;

@WebServlet(HomeServlet.URL_MAPPING + "/*")
public class HomeServlet extends HttpServlet
{
    
    private static final String HOME_JSP = "/WEB-INF/view/home.jsp";
    public static final String URL_MAPPING = "/home";

    private final static Logger log = LoggerFactory.getLogger(HomeServlet.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher(HOME_JSP).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String action = req.getPathInfo();
        switch(action)
        {
            case "/login":
                //get POST params from form
                String username = req.getParameter("username");
                String password = req.getParameter("password");
                if (!validate(username, password, req))
                {
                    req.getRequestDispatcher(HOME_JSP).forward(req, resp);
                    return;
                }
                //resp.sendRedirect(req.getContextPath() + DashboardServlet.URL_MAPPING);
                if (!allowUser(username, password)) 
                {
                    log.warn("Could not login. Username or Password invalid.");
                    req.setAttribute("error", "Username or Password invalid.");
                    req.getRequestDispatcher(HOME_JSP).forward(req, resp);
                    return;
                }
                else 
                {
                    HttpSession session = req.getSession();
                    session.setAttribute("isLogged", username);  // just a marker object

                    if(req.getSession().getAttribute("isLogged") == null)
                    {
                        resp.sendRedirect(req.getContextPath() + URL_MAPPING);
                    }
                    else
                    {
                        resp.sendRedirect(req.getContextPath() + DashboardServlet.URL_MAPPING);
                    }

                    //res.sendRedirect("/");
                }
                return;
        }
        resp.sendRedirect(req.getContextPath() + URL_MAPPING);
    
    
        
    }

    /**
     * Logges user into dasboard system if username and password are correct.
     * Otherwise prints error message
     * @param username
     * @param password
     * @return 
     */
    protected boolean allowUser(String username, String password) {
        
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        
        if(user.userAlreadyExists())
        {
            
            if(User.parser.login(username, user.getPassword()))
            {
                return true;
            }
        }
        
        return false;
    }
    
    /**
     * Checks if all fields are filled. If not return error message
     * @param username
     * @param password
     * @param req
     * @return error message
     */
    private boolean validate(String username, String password, HttpServletRequest req)
    {
        if (username.equals("") || password.equals(""))
        {
            log.error("One of the attributes is empty string");
            req.setAttribute("error", "You must fill all text fields.");
            return false;
        }
        return true;
    }
}