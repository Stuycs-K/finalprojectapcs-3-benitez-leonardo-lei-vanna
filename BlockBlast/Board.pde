class Board {
  private int[][] gameBoard;
  private int rows = 8;
  private int cols = 8;
  private int cellSize = 50;

  public Board() {
    gameBoard = new int[rows][cols];
  }
  
  public int[][] getBoard(){
    return gameBoard;
  }

  boolean placePiece(Piece piece, int startRow, int startCol) {
    if (!canPlace(piece, startRow, startCol))
      return false;
    for (int r = 0; r < piece.shape().length; r++) {
      for (int c = 0; c < piece.shape()[0].length; c++) {
        if (piece.shape()[r][c] == 1) {
          gameBoard[startRow+r][startCol+c]=1;
        }
      }
    }
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
    boolean[] fullRows = new boolean[rows];
    boolean[] fullCols = new boolean[cols];

    for (int r = 0; r < rows; r++) {
      boolean full = true;
      for (int c = 0; c < cols; c++) {
        if (gameBoard[r][c] == 0) {
          full = false;
          break;
        }
      }
      fullRows[r] = full;
    }
    for (int c = 0; c < cols; c++) {
      boolean full = true;
      for (int r = 0; r < rows; r++) {
        if (gameBoard[r][c] == 0) {
          full = false;
          break;
        }
      }
      fullCols[c] = full;
    }

    for (int r = 0; r < rows; r++) {
      if (fullRows[r]) {
        for (int c = 0; c < cols; c++) {
          gameBoard[r][c] = 0;
        }
      }
    }

    for (int c = 0; c < cols; c++) {
      if (fullCols[c]) {
        for (int r = 0; r < rows; r++) {
          gameBoard[r][c] = 0;
        }
      }
    }
  }

  public void drawBoard(int x, int y) {
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        if (gameBoard[r][c] == 1)
          fill(100, 200, 250);
        else
          fill(220);
        stroke(0);
        //rect(c*cellSize+260, r*cellSize+75, cellSize, cellSize);
        rect(c*cellSize+x-cellSize*4, r*cellSize+y-cellSize*4, cellSize, cellSize);

      }
    }
  }
  
  boolean canPlaceAny(Piece[] pieces) {//for game over scenario
    for (Piece piece : pieces) {
      for (int r = 0; r <= rows - piece.shape.length; r++) {
        for (int c = 0; c <= cols - piece.shape[0].length; c++) {
          if (canPlace(piece, r, c)) {
            return true;
          }
        }
      }
    }
    return false;
  }
}
