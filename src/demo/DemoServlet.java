package demo;

import java.io.IOException;
import java.io.PrintWriter;
 
import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
public class DemoServlet extends HttpServlet {
 
    public void init(ServletConfig config) {
        System.out.println("initialized");
    }
 
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
 
        PrintWriter writer = response.getWriter();
        writer.println("doGet");
        writer.flush();
    }
 
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String query = request.getParameter("query");
        PrintWriter writer = response.getWriter();
        writer.println("doPost: " +query);
        writer.flush();
 
    }
 
    public void destroy() {
        System.out.println("destroyed");
    }
}
