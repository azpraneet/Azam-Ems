<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Person</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #dfe6e9;
            text-align: center;
            padding: 40px;
        }
        form {
            display: inline-block;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        input, button {
            margin: 10px;
            padding: 10px;
            width: 250px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }
        button {
            background: #0984e3;
            color: white;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background: #74b9ff;
        }
    </style>
</head>
<body>
<h2>Update Person</h2>
<form action="${pageContext.request.contextPath}/updatePerson" method="post" enctype="multipart/form-data">
    <input type="hidden" name="id" value="${person.id}"/>
    <input type="text" name="name" value="${person.name}" placeholder="Name" required/><br>
    <input type="text" name="mobile" value="${person.mobile}" placeholder="Mobile" required/><br>
    <input type="text" name="email" value="${person.email}" placeholder="Email" required/><br>
    <input type="text" name="occupation" value="${person.occupation}" placeholder="Occupation" required/><br>
    <input type="file" name="file" accept="image/*"/><br>
    <button type="submit">Update</button>
</form>
<br>
<a href="${pageContext.request.contextPath}/persons">Back to List</a>
</body>
</html>
