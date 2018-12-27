package shirts.controller;

import javax.naming.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

// Extend HttpServlet class
public class ShirtServlet extends HttpServlet {

    public void init() throws ServletException {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Deletion
        String idshirt = request.getParameter("idshirt");
        String cmd = request.getParameter("cmd");

        // Insertion
        String shirt_name = request.getParameter("shirt_name");
        String shirt_brand = request.getParameter("shirt_brand");
        String price = request.getParameter("price");

        // Set response content type
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Insertion
//        out.println(name+"<br/>");
//        out.println(price+"<br/>");
//        out.println(description+"<br/>");
//        out.println(category_id+"<br/>");

        Context envContext = null;
        try {
            envContext = new InitialContext();
            out.println(envContext+"<br>");
//            NamingEnumeration<NameClassPair> list = envContext.list("java:comp/env");
//            while (list.hasMore()) {
//                NameClassPair nc = (NameClassPair)list.next();
//                out.println(nc);
//            }
//            Context initContext  = (Context)envContext.lookup("java:/comp/env");
            Context initContext = envContext;
//            DataSource ds = (DataSource)initContext.lookup("jdbc/affableBean");
            DataSource ds = (DataSource)envContext.lookup("java:/comp/env/jdbc/shirt");
            Connection con = ds.getConnection();


            String sql = "";
            if (cmd != null && cmd.equals("d")) {
                // Delete a product
                sql = "DELETE FROM shirt WHERE idshirt = ?";
                PreparedStatement stmt = con.prepareStatement(sql);
                stmt.setInt(1, Integer.parseInt(idshirt));
                stmt.execute();
            } else if (cmd != null && cmd.equals("u")) {
                // Update a product

                sql = "UPDATE shirt SET shirt_name = ?, shirt_brand = ?, price = ?  WHERE idshirt = ?;";
                PreparedStatement stmt=con.prepareStatement(sql);
                stmt.setString(1,shirt_name);
                stmt.setString(2,shirt_brand);
                stmt.setInt(3,Integer.parseInt(price));
                stmt.setInt(4,Integer.parseInt(idshirt));
                stmt.execute();

            } else {
                // Insert a new product
                sql = "INSERT INTO shirt (idshirt, shirt_name, shirt_brand, price)  values (?,?,?,?);";
                PreparedStatement stmt=con.prepareStatement(sql);
                stmt.setInt(1,Integer.parseInt(idshirt));
                stmt.setString(2,shirt_name);
                stmt.setString(3,shirt_brand);
                stmt.setInt(4,Integer.parseInt(price));
                stmt.execute();
            }
//            out.println("Row affect "+r+"<br>");
            response.sendRedirect("shirts.jsp");

        }  catch (SQLException | NamingException e) {
            e.printStackTrace();
            out.print(e);
        }
    }

    public void destroy() {
        // do nothing.
    }
}
