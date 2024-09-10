import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/InfantServlet")
public class InfantServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection details
    private static final String DB_URL = "jdbc:mysql://localhost:3306/babycare";
    private static final String DB_USER = "root"; // Using 'root' as the username
    private static final String DB_PASSWORD = ""; // No password

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set request encoding if necessary
        request.setCharacterEncoding("UTF-8");

        // Retrieve form data
        String infantName = request.getParameter("infantName");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String parentName = request.getParameter("parentName");
        String contactNumber = request.getParameter("contactNumber");
        String email = request.getParameter("email");
        String weight = request.getParameter("weight");
        String height = request.getParameter("height");
        String allergies = request.getParameter("allergies");
        String medicalConditions = request.getParameter("medicalConditions");
        String serviceType = request.getParameter("serviceType");
        String serviceDate = request.getParameter("serviceDate");
        String preferredTime = request.getParameter("preferredTime");
        String specialInstructions = request.getParameter("specialInstructions");

        // SQL query to insert data into the database
        String sql = "INSERT INTO infant_care_services (infant_name, dob, gender, parent_name, contact_number, email, " +
                     "weight, height, allergies, medical_conditions, service_type, service_date, preferred_time, special_instructions) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection to the database
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Create a PreparedStatement
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, infantName);
            pstmt.setString(2, dob);
            pstmt.setString(3, gender);
            pstmt.setString(4, parentName);
            pstmt.setString(5, contactNumber);
            pstmt.setString(6, email);
            pstmt.setString(7, weight);
            pstmt.setString(8, height);
            pstmt.setString(9, allergies);
            pstmt.setString(10, medicalConditions);
            pstmt.setString(11, serviceType);
            pstmt.setString(12, serviceDate);
            pstmt.setString(13, preferredTime);
            pstmt.setString(14, specialInstructions);

            // Execute the SQL statement
            int rowCount = pstmt.executeUpdate();

            // Close resources
            pstmt.close();
            conn.close();

            // Redirect to a success page
            if (rowCount > 0) {
                response.sendRedirect("success.jsp");
            } else {
                response.sendRedirect("error.jsp");
            }
        } catch (Exception e) {
            // Handle errors
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
