package model;

public class Game {
    private int targetNumber;
    private int attempts;
    private int maxAttempts;
    private int score;

    public Game(int maxAttempts) {
        this.maxAttempts = maxAttempts;
        resetGame(); // Call the method to initialize/reset the game
    }

    public void resetGame() {
        this.attempts = 0; // Reset attempts
        this.score = 0;    // Reset score
        this.targetNumber = generateRandomNumber(); // Generate a new random number
    }

    private int generateRandomNumber() {
        return (int) (Math.random() * 100) + 1;
    }

    public int getTargetNumber() {
        return targetNumber;
    }

    public int getAttempts() {
        return attempts;
    }

    public int getMaxAttempts() {
        return maxAttempts;
    }

    public int getScore() {
        return score;
    }

    // Method to process the player's guess
    public String guessNumber(int guess) {
        attempts++;

        if (guess < targetNumber) {
            return "low";
        } else if (guess > targetNumber) {
            return "high";
        } else {
            // Correct guess: Update the score
            score = 500 / attempts; // Award points for correct guess (adjust logic as necessary)
            return "correct";
        }
    }

    // Check if the game is over (win or max attempts reached)
    public boolean isGameOver() {
        return attempts >= maxAttempts || targetNumber == score;
    }
}
