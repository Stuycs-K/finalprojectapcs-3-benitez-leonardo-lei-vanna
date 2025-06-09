class Board {
  private int[][][] gameBoard;
  private int rows = 8;
  private int cols = 8;
  private int cellSize = 50;

  public Board() {
    gameBoard = new int[rows][cols][3]; // for RGB
  }

  public int[][][] getBoard() {
    return gameBoard;
  }

  public int cellSize() {
    return cellSize;
  }

  boolean placePiece(Piece piece, int startRow, int startCol) {
    if (!canPlace(piece, startRow, startCol))
      return false;
    for (int r = 0; r<piece.shape().length; r++) {
      for (int c = 0; c<piece.shape()[0].length; c++) {
        if (piece.shape()[r][c] == 1) {
          gameBoard[startRow+r][startCol+c][0] = piece.colorID()[0];
          gameBoard[startRow+r][startCol+c][1] = piece.colorID()[1];
          gameBoard[startRow+r][startCol+c][2] = piece.colorID()[2];
          ;
        }
      }
    }
    return true;
  }

  public boolean canPlace(Piece piece, int startRow, int startCol) {
    for (int r = 0; r<piece.shape().length; r++) {
      for (int c = 0; c<piece.shape()[0].length; c++) {
        if (piece.shape()[r][c] == 1) {
          int boardRow = startRow+r;
          int boardCol = startCol+c;
          if (boardRow<0 || boardRow >= rows || boardCol<0 || boardCol >= cols)
            return false;
          if (gameBoard[boardRow][boardCol][0] > 0 || gameBoard[boardRow][boardCol][1] > 0 || gameBoard[boardRow][boardCol][2] > 0)

            return false;
        }
      }
    }
    return true;
  }

  public void drawBoard() {
    for (int r = 0; r<rows; r++) {
      for (int c = 0; c<cols; c++) {
        if (gameBoard[r][c][0] > 0 || gameBoard[r][c][1] > 0 || gameBoard[r][c][2] > 0)
          fill(gameBoard[r][c][0], gameBoard[r][c][1], gameBoard[r][c][2]);
        else
          fill(220);
        stroke(0);
        rect(c*cellSize+250, r*cellSize+175, cellSize, cellSize);//MAGIC NUMBERS
      }
    }
  }

  boolean canPlaceAny(Piece[] pieces) {
    for (Piece piece : pieces) {
      if (piece == null) continue;
      for (int r = 0; r <= rows; r++) {
        for (int c = 0; c <= cols; c++) {
          if (canPlace(piece, r, c)) {
            return true;
          }
        }
      }
    }
    return false;
  }
}
