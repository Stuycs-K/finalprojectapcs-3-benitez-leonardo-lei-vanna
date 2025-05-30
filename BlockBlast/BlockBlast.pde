  private int score;
  private int combos;
  private int[] pieceLineUp;
  static String scoreText;
  private Board gameBoard;
  private int x = 460;
  private int y = 275;
  
  public void setup(){
    size(920,920);
    pieceLineUp = new int[3];
    gameBoard = new Board();
  }
  
  Piece piece = new Piece("T3x3");

  public void draw(){
    background(255);
    fill(255);
    rect(380, 15, 200, 40);
    fill(0);
    textSize(20);
    text("Score: " + score, 395, 40);
    //gameBoard.drawBoard(x,y);
    piece.drawPiece(x,y);
  }
  
  public void scoreRow(){
    for(int row = 0; row<8; row++){
      boolean full = true;
      for(int col = 0; col<8; col++){
        if(gameBoard.getBoard()[row][col] == 0){
          full=false;
        }
      }
      if(full){
        for(int i = 0; i<8; i++){
          gameBoard.getBoard()[row][i] = 0;
          score += 80;
        }
      }
    }
  }
  
  void mouseDragged(){
    x=mouseX;
    y=mouseY;
  }
  
  public void scoreCol(){
    for(int col = 0; col<8; col++){
      boolean full = true;
      for(int row = 0; row<8; row++){
        if(gameBoard.getBoard()[row][col] == 0){
          full=false;
        }
      }
      if(full){
        for(int i = 0; i<8; i++){
          gameBoard.getBoard()[i][col] = 0;
          score += 80;
        }
      }
    }
  }
  
  public void combos(){
    combos = 0;
  }
