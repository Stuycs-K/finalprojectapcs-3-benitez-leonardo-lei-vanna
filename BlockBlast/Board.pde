public class Board {
  private int[][] gameBoard;
  private int rows = 8;
  private int cols = 8;
  private int cellSize = 50; // size of each square on screen

  public Board() {
    gameBoard = new int[rows][cols];
  }

  public void placePiece() {
    return;
  }
  
  public boolean canPlace(Piece piece, int startRow, int startCol) {
    for (int r = 0; r < piece.shape().length; r++) {
      for (int c = 0; c < piece.shape()[0].length; c++) {
        if (piece.shape[r][c] == 1) {
          int boardRow = startRow + r;
          int boardCol = startCol + c;
        }
      }
    }
    return true;
  }

  public void movePiece() {
    return;
  }

  public void clearLines() {
    return;
  }

  public void drawBoard() {
    return;
  }
}
