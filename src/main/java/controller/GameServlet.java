package controller;

import model.Game;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/GameServlet")
public class GameServlet extends HttpServlet {

    // Process GET request - initializes the game if not yet created
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Create or reset game object when the game is being started or restarted
        Game game = new Game(10); // Set max attempts to 10
        session.setAttribute("game", game);

        // Forward to the game page
        request.getRequestDispatcher("game.jsp").forward(request, response);
    }

    // Process POST request - for submitting guesses
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Game game = (Game) session.getAttribute("game");

        // Handle the guess
        int guessedNumber = Integer.parseInt(request.getParameter("guess"));
        String result = game.guessNumber(guessedNumber);

        request.setAttribute("result", result);

        // If the player has guessed correctly or game is over, show result
        if (result.equals("correct") || game.isGameOver()) {
            // Forward to result page with the updated score
            request.getRequestDispatcher("result.jsp").forward(request, response);
        } else {
            // If the game is still ongoing, show the game page
            request.getRequestDispatcher("game.jsp").forward(request, response);
        }
    }
}
