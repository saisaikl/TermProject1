<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "com.mysql.jdbc.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script>
    function confirmDelete(id) {
        if (confirm('Are you sure?')) {
            window.location = "shirt-controller?cmd=d&idshirt="+id;
        }
    }
</script>
<head>
    <title>Shirt</title>
</head>
<body>
<h1>Shirt</h1>
<a href="shirts.jsp">ADD</a>

<sql:query dataSource="jdbc/shirts" var="result">
    SELECT * FROM shirt
</sql:query>


<table border="1">
    <c:forEach var="row" items="${result.rows}">
        <tr>
            <td><c:out value="${row.idshirt}"/></td>
            <td><c:out value="${row.shirt_name}"/></td>
            <td><c:out value="${row.shirt_brand}"/></td>
            <td><c:out value="${row.price}"/></td>
            <td>
                <button onclick="window.location='shirt-update.jsp?idshirt=<c:out value="${row.idshirt}"/>';">UPDATE</button>
                <button onclick="confirmDelete(<c:out value="${row.idshirt}"/>);">DELETE</button>
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
