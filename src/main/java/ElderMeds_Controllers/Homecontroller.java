package ElderMeds_Controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Homecontroller {

    @RequestMapping("/")
    public String home() {
        System.out.println("Opening Index Page...");
        return "index";
    }

    @RequestMapping("/Admin_login11")
    public String adminLoginPage() {
        return "Admin_login11";
    }

    @RequestMapping(value = "/adminlogin", method = RequestMethod.POST)
    public String adminLogin(HttpServletRequest request) {
        String email = request.getParameter("aemail");
        String password = request.getParameter("apassword");

        if ("admin@gmail.com".equalsIgnoreCase(email) && "admin123".equalsIgnoreCase(password)) {
            return "Admin_Dashboard11";
        } else {
            request.setAttribute("error", "Invalid Credentials!!");
            return "Admin_login11";
        }
    }
}
