import java.sql.*;
public class Main {
    static final String DB_URL = "jdbc:mysql://localhost:3306/blastonburyfestival";
    static final String USER = "root";
    static final String PASS = "";
    static final String QUERY = "SELECT *  FROM blastonburyfestival.agent";
    public static void main(String[] args) {
// Open a connection
        try(Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(QUERY);) {
            // Extract data from result set
            while (rs.next()) {
                // Retrieve by column name
                System.out.print("Agent ID: " + rs.getInt("agent_ID"));
                System.out.println();
                System.out.println("Name: " + rs.getString("name"));
                System.out.println("Surname: " + rs.getString("surname"));
                System.out.println("Email: " + rs.getString("email"));
                System.out.print("Phone: " + rs.getString("phone"));
                System.out.println();
            }
        } catch (SQLException e) {e.printStackTrace();}}}