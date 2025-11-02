<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>EMS Home</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            background-image: url('<c:url value="/images/azam.jpg"/>');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            color: white;
            font-family: Arial, sans-serif;
            text-align: center;
        }

        h2 {
            padding-top: 50px;
            font-size: 2em;
            text-shadow: 2px 2px 5px rgba(0,0,0,0.5);
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

        /* 🌟 Top Bar Container */
        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 40px;
        }

        /* 🌟 Search Form (Top Left) */
        .search-container {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .search-container input[type="text"] {
            padding: 8px 12px;
            width: 220px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 1rem;
        }

        .search-container button {
            padding: 8px 16px;
            background-color: #00b894;
            border: none;
            border-radius: 8px;
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .search-container button:hover {
            background-color: #019875;
        }

        /* 🌟 Buttons (Top Right) */
        .btn-container {
            display: flex;
            gap: 15px;
        }

        .btn {
            background-color: #007bff;
            color: black;
            font-weight: bold;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 8px;
            border: none;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #0056b3;
        }

    </style>
</head>
<body>
    <!-- 🌟 Top Bar -->
    <div class="top-bar">
        <!-- 🔍 Search on Left -->
        <div class="search-container">
            <form action="${pageContext.request.contextPath}/getByName" method="get">
                <input type="text" name="name" placeholder="Search Friends by name..." required>
                <button type="submit">Search</button>
            </form>
        </div>

        <!-- 🌟 Buttons on Right -->
        <div class="btn-container">
            <a href="/persons" class="btn">View All Persons</a>
            <a href="/saves" class="btn">Save Persons</a>
        </div>
    </div>

    <!-- 🌟 Welcome Section -->
    <h2>Welcome to Azam's Profile!</h2>

    <div class="header">
        <img src="<c:url value='/images/profile.jpg'/>" alt="Azam Profile Picture">
    </div>
</body>
</html>
