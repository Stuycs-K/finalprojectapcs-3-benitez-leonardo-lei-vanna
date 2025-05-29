public class Board {
  private int[][] gameBoard;
  private int rows = 8;
  private int cols = 8;
  private int cellSize = 50;

  public Board() {
    gameBoard = new int[rows][cols];
  }

  boolean placePiece(Piece piece, int startRow, int startCol) {
    clearLines();
    return true;
  }
  
  public boolean canPlace(Piece piece, int startRow, int startCol) {
    for (int r = 0; r < piece.shape().length; r++) {
      for (int c = 0; c < piece.shape()[0].length; c++) {
        if (piece.shape[r][c] == 1) {
          int boardRow = startRow + r;
          int boardCol = startCol + c;
          if (boardRow < 0 || boardRow >= rows || boardCol < 0 || boardCol >= cols)
            return false;
          if (gameBoard[boardRow][boardCol] == 1)
            return false;
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
