<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@page import="model.Game"%>
<!DOCTYPE html>
<html>
<head>
    <title>Game Over</title>
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
        p {
            color: #333;
            margin: 10px 0;
        }
        .button {
            background: #4CAF50;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            border: none;
            cursor: pointer;
        }
        .button:hover {
            background: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Game Over</h1>
        <p>Your final score: ${game.score}</p>
        <p>Attempts used: ${game.attempts}/${game.maxAttempts}</p>

        <!-- Display the correct number if the game is over -->
        <p><strong>The correct number was: ${game.targetNumber}</strong></p>

        <!-- Button to start a new game -->
        <form action="GameServlet" method="get">
            <button type="submit" class="button">Play Again</button>
        </form>
    </div>
</body>
</html>
