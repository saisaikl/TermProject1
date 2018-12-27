<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "com.mysql.jdbc.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<sql:query dataSource="jdbc/shirts" var="result">
    SELECT * FROM shirt
</sql:query>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Shirt</title>
</head>
<body>
<h1>Shirt</h1>
<form action="shirt-controller">
    <table>
        <tr>
            <td>Shirt No.</td>
            <td><input type="number" name="idshirt"></td>
        </tr>
        <tr>
            <td>Shirt Name</td>
            <td><input type="text" name="shirt_name"></td>
        </tr>
        <tr>
            <td>Shirt Brand</td>
            <td><input type="text" name="shirt_brand"></td>
        </tr>
        <tr>
            <td>Price</td>
            <td><input type="number" name="price"></td>
        </tr>
        <td colspan="2">
            <input type="submit" value="Create">
        </td>
        </tr>
    </table>
</form>

</body>
</html>