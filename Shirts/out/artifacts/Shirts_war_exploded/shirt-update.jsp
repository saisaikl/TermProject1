<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "com.mysql.jdbc.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<sql:query dataSource="jdbc/shirts" var="shirts">
    SELECT * FROM shirt WHERE idshirt = ?
    <sql:param value="${param.id}" />
</sql:query>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Shirt</title>
</head>
<body>
<h1>Shirt <c:out value="${param.id}"/></h1>
<c:forEach var="p" items="${shirts.rows}">
    <form action="shirt-controller">
        <input type="hidden" name="cmd" value="u"/>
        <input type="hidden" name="idshirt" value='<c:out value="${p.idshirt}"/>'/>
        <table>
            <tr>
                <td>Shirt Name</td>
                <td><input type="text" name="shirt_name" value='<c:out value="${p.shirt_name}"/>'></td>
            </tr>
            <tr>
                <td>Shirt Brand</td>
                <td><input type="text" name="shirt_brand" value='<c:out value="${p.shirt_brand}"/>'></td>
            </tr>
            <tr>
                <td>Price</td>
                <td><input type="number" name="price" value='<c:out value="${p.price}"/>'></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="Update">
                </td>
            </tr>
        </table>
    </form>
</c:forEach>

</body>
</html>