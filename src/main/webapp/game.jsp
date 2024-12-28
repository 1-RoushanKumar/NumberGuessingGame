


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <title>Guess the Number</title>
        <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            text-align: center;
            background: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 350px;
        }
        h1 {
            color: #4CAF50;
            margin-bottom: 20px;
        }
        form {
            margin-bottom: 20px;
        }
        label {
            font-size: 16px;
            color: #333;
        }
        input[type="number"] {
            margin: 10px 0;
            padding: 8px;
            width: 100%;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }
        button {
            background: #4CAF50;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background: #45a049;
        }
        p {
            font-size: 14px;
            color: #333;
        }
        p strong {
            font-weight: bold;
        }
        p.error {
            color: red;
        }
        .stats {
            margin-top: 20px;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Guess the Number</h1>
        <form action="GameServlet" method="post">
            <label>Enter your guess:</label>
            <input type="number" name="guess" min="1" max="100" required>
            <button type="submit">Submit</button>
        </form>

        <c:if test="${not empty result}">
            <p>Your guess is <strong>${result}</strong>.</p>
            <c:choose>
                <c:when test="${result == 'correct'}">
                    <p>You got it!</p>
                </c:when>
                <c:otherwise>
                    <p>Keep trying!</p>
                </c:otherwise>
            </c:choose>
        </c:if>

        <div class="stats">
            <p>Attempts: ${game.attempts}/${game.maxAttempts}</p>
        </div>
    </div>
</body>
</html>

