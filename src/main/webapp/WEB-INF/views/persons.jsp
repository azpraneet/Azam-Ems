<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>All Persons</title>
    <style>
        /* 🌟 Base Page Styling */
        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background: linear-gradient(135deg, #74b9ff, #a29bfe);
            margin: 0;
            padding: 0;
            color: #333;
        }

        /* 🌟 Header Section */
        .header {
            text-align: center;
            padding: 40px 20px 10px;
        }

        .header img {
            width: 160px;
            height: 160px;
            border-radius: 50%;
            border: 4px solid white;
            object-fit: cover;
            box-shadow: 0 4px 12px rgba(0,0,0,0.3);
        }

        .header h2 {
            margin-top: 20px;
            color: #fff;
            font-size: 2rem;
            text-shadow: 2px 2px 5px rgba(0,0,0,0.3);
        }

        /* 🌟 Search Bar Styling */
        .search-container {
            text-align: center;
            margin-top: 20px;
        }

        .search-container form {
            display: inline-block;
            background: #fff;
            padding: 10px 15px;
            border-radius: 30px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        .search-container input[type="text"] {
            border: none;
            outline: none;
            padding: 8px 12px;
            font-size: 1rem;
            border-radius: 20px;
        }

        .search-container button {
            background-color: #0984e3;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 20px;
            font-size: 1rem;
            cursor: pointer;
            transition: 0.3s;
        }

        .search-container button:hover {
            background-color: #74b9ff;
        }

        /* 🌟 Table Styling */
        table {
            width: 90%;
            margin: 30px auto;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        th {
            background-color: #0984e3;
            color: white;
            font-weight: bold;
            padding: 12px;
            text-align: center;
            font-size: 1rem;
        }

        td {
            text-align: center;
            padding: 10px;
            font-size: 0.95rem;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        /* 🌟 Person Images inside table */
        td img {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 50%;
            border: 2px solid #74b9ff;
        }

        /* 🌟 Back Button */
        .back-link {
            text-align: center;
            margin: 30px 0;
        }

        .back-link a {
            text-decoration: none;
            background-color: #0984e3;
            color: white;
            padding: 10px 25px;
            border-radius: 6px;
            transition: background 0.3s ease;
        }

        .back-link a:hover {
            background-color: #74b9ff;
        }
    </style>
</head>
<body>

    <!-- 🌟 Header -->
    <div class="header">
        <img src="<c:url value='/images/profile.jpg'/>" alt="Azam Profile Picture">
        <h2>Welcome to Azam's Friends List</h2>
    </div>

    <!-- 🌟 Search Bar -->
    <div class="search-container">
        <form action="${pageContext.request.contextPath}/getByName" method="get">
            <input type="text" name="name" placeholder="🔍 Search by Name" required />
            <button type="submit">Search</button>
        </form>
    </div>


    <!-- 🌟 Table of Persons -->
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Mobile</th>
            <th>Email</th>
            <th>Image</th>
            <th>Occupation</th>
        </tr>

        <c:forEach var="p" items="${persons}">
            <tr>
                <td>${p.id}</td>
                <td>${p.name}</td>
                <td>${p.mobile}</td>
                <td>${p.email}</td>
                <td>
                    <img src="${pageContext.request.contextPath}${p.image}" width="120" height="120" />
                </td>
                <td>${p.occupation}</td>
            </tr>
        </c:forEach>
    </table>

    <!-- 🌟 Back Link -->
    <div class="back-link">
        <a href="/">Back to Home</a>
    </div>

</body>
</html>
