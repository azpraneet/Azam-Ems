<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Add New Person</title>
    <style>
        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background: linear-gradient(135deg, #6dd5fa, #2980b9);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            margin: 0;
        }

        h2 {
            color: #fff;
            text-shadow: 1px 1px 2px #000;
            margin-bottom: 10px;
        }

        form {
            background-color: white;
            border-radius: 15px;
            padding: 30px 40px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            width: 350px;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 15px;
        }

        input[type="text"], input[type="file"] {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
            transition: all 0.2s ease-in-out;
        }

        input[type="text"]:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0,123,255,0.4);
        }

        button {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 8px;
            background-color: #007bff;
            color: white;
            font-weight: bold;
            font-size: 15px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #0056b3;
        }

        a {
            margin-top: 20px;
            color: #fff;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }

        .message {
            color: #fff;
            font-weight: bold;
            margin-top: 15px;
        }
    </style>
</head>
<body>

    <h2>Add New Person</h2>

   <form action="${pageContext.request.contextPath}/savesPerson" method="post" enctype="multipart/form-data">
           <input type="text" name="name" placeholder="Enter name" required />
           <input type="text" name="mobile" placeholder="Enter mobile number" required />
           <input type="text" name="email" placeholder="Enter email" required />
           <input type="file" name="file" accept="image/*" required />
           <input type="text" name="occupation" placeholder="Enter occupation" required />
           <button type="submit">Save Person</button>
   </form>

    <h3 class="message">${message}</h3>

    <a href="${pageContext.request.contextPath}/persons">View All Persons</a>

</body>
</html>
