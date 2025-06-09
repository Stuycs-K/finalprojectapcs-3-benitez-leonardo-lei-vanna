private int score;
private int highScore;
private int combos;
private int numPlaced;
private Piece[] pieceLineUp;
private int lineUpSize = 3;
static String scoreText;
private Board gameBoard;
private int x = 460;
private int y = 275;
public Piece piece;
private int select = -1;
private int time = 0;
private int[] backgroundColor = new int[] {
  (int)random(150, 255),
  (int)random(150, 255),
  (int)random(150, 255)
};

public void setup() {
  size(920, 920);
  pieceLineUp = new Piece[lineUpSize];
  newLineUp();
  gameBoard=new Board();
  piece = null;
}


public void draw() {
  if (keyPressed) {
    if ((key == 'Q' || key == 'q')&&backgroundColor[0]<246)
      backgroundColor[0]+=10;
    if ((key == 'W' || key == 'w')&&backgroundColor[0]>9)
      backgroundColor[0]-=10;
    if ((key == 'A' || key == 'a')&&backgroundColor[1]<246)
      backgroundColor[1]+=10;
    if ((key == 'S' || key == 's')&&backgroundColor[1]>9)
      backgroundColor[1]-=10;
    if ((key == 'Z' || key == 'z')&&backgroundColor[2]<246)
      backgroundColor[2]+=10;
    if ((key == 'X' || key == 'x')&&backgroundColor[2]>9)
      backgroundColor[2]-=10;
    fill(255);
  }
  if (piece != null) {
    drawShadow(piece, x, y);
    piece.drawPiece(x, y);
  }
  background(backgroundColor[0], backgroundColor[1], backgroundColor[2]);
  fill(255);
  textSize(50);
  text("BLOCKBLAST", 320, 75);
  fill(255);
  rect(350, 95, 200, 60);
  fill(0);
  textSize(20);
  text("Score: "+score, 410, 145);
  highScore();
  gameBoard.drawBoard();
  if (piece != null) {
    piece.drawPiece(x, y);
  }
  for (int i = 0; i<lineUpSize; i++) {
    if (pieceLineUp[i]!=null && i != select)
      pieceLineUp[i].drawPiece(350 + i*170, 725);
  }
  if (!gameBoard.canPlaceAny(pieceLineUp)) {
    fill(0);
    textSize(50);
    text("GAME OVER!", 330, 350);
    text("Press R to restart ", 282, 390);
    if (keyPressed) {
      if (key == 'R' || key == 'r') {
        setup();
        if (score>highScore)
          highScore = score;
        score = 0;
      }
    }
    if (score>highScore) {
      text("NEW HIGH SCORE!!", 252, 520);
    }
  }
  if (time>0) {
    int[] randcolors = new int[] {
      (int)random(80, 255),
      (int)random(80, 255),
      (int)random(80, 255)
    };
    if (backgroundColor[0] != randcolors[0]) {
      if (backgroundColor[0] < randcolors[0]) {
        backgroundColor[0]+=(int)random(0, 4);
      } else if (backgroundColor[0] > randcolors[0]) {
        backgroundColor[0]-=(int)random(0, 4);
        ;
      }
    }
    if (backgroundColor[1] != randcolors[1]) {
      if (backgroundColor[1] < randcolors[1]) {
        backgroundColor[1]+=(int)random(0, 6);
        ;
      } else if (backgroundColor[1] > randcolors[1]) {
        backgroundColor[1]-=(int)random(0, 6);
        ;
      }
    }
    if (backgroundColor[2] != randcolors[2]) {
      if (backgroundColor[2] < randcolors[2]) {
        backgroundColor[2]++;
      } else if (backgroundColor[2] > randcolors[2]) {
        backgroundColor[2]--;
      }
    }
    time --;
  }
}


void drawShadow(Piece p, int mouseX, int mouseY) {
  int pieceCenterOffset = 2 * gameBoard.cellSize();
  int adjustedX = mouseX - pieceCenterOffset;
  int adjustedY = mouseY - pieceCenterOffset;
  int boardCol = (adjustedX - 250) / gameBoard.cellSize();
  int boardRow = (adjustedY - 175) / gameBoard.cellSize();
  if (!gameBoard.canPlace(p, boardRow, boardCol)) return;
  int[][] shape = p.shape();
  int[] pcolor = p.colorID();
  int cs = gameBoard.cellSize();
  noStroke();//testing this out
  fill(pcolor[0], pcolor[1], pcolor[2], 100);
  for (int r = 0; r < shape.length; r++) {
    for (int c = 0; c < shape[0].length; c++) {
      if (shape[r][c] == 1) {
        int drawX = (boardCol + c) * cs + 250;
        int drawY = (boardRow + r) * cs + 175;
        rect(drawX, drawY, cs, cs);
      }
    }
  }
}


void highScore() {
  fill(0);
  textSize(20);
  text("High Score: "+highScore, 390, 120);
}


void newLineUp() {
  String[] pieceTypes = {"T3x3", "L3x3", "L2x3", "L2x2", "V2x3", "S2x3"};
  for (int i = 0; i < lineUpSize; i++) {
    pieceLineUp[i] = new Piece(pieceTypes[(int)random(pieceTypes.length)]);
  }
}

public void scoreRow() {
  for (int row = 0; row < 8; row++) {
    boolean full = true;
    for (int col = 0; col < 8; col++) {
      if (gameBoard.getBoard()[row][col]==0) {
        full = false;
      }
    }
    if (full) {
      for (int col = 0; col < 8; col++) {
        gameBoard.getBoard()[row][col] = 0;
      }
      combos++;
      score += 80;
      time = 50;
    }
  }
}



void mouseDragged() {
  if (piece != null) {
    x=mouseX+10;
    y=mouseY+10;
  }
}

void mousePressed() {
  for (int i = 0; i<3; i++) {
    if (mouseX > 250 + i*150 && mouseX < 400 + i*150 && mouseY >600 && mouseY <750) {
      if (pieceLineUp[i] != null) {
        piece = pieceLineUp[i];
        select = i;
        x = mouseX;
        y = mouseY;
      }
    }
  }
}

void mouseReleased() {
  if (piece == null) return;
  int pieceCenterOffset = 2 * gameBoard.cellSize();
  int adjustedX = mouseX - pieceCenterOffset;
  int adjustedY = mouseY - pieceCenterOffset;
  int boardCol = (adjustedX - 250) / gameBoard.cellSize();
  int boardRow = (adjustedY - 175) / gameBoard.cellSize();
  if (gameBoard.placePiece(piece, boardRow, boardCol)) {
    scoreRow();
    scoreCol();
    numPlaced++;
    combos();
    if (combos>1) {
      score += 80*combos;
    }
    piece = null;
    if (select >= 0 && select < 3) {
      pieceLineUp[select] = null;
    }
    piece = null;
    select = -1;
    //String[] pieceTypes = {"T3x3", "L3x3", "L2x3", "L2x2"};
    //piece = new Piece(pieceTypes[(int)random(pieceTypes.length)]);
    boolean empty = true;
    for (Piece p : pieceLineUp) {
      if (p != null) {
        empty = false;
        break;
      }
    }
    if (empty) {
      newLineUp();
    }
  } else {
    piece = null;
    select = -1;
  }
}

public void scoreCol() {
  for (int col = 0; col < 8; col++) {//MORE MAGIC NUMBERS
    boolean full = true;
    for (int row = 0; row < 8; row++) {
      if (gameBoard.getBoard()[row][col] == 0) {
        full = false;
      }
    }
    if (full) {
      for (int row = 0; row < 8; row++) {
        gameBoard.getBoard()[row][col] = 0;
      }
      score += 80;
      combos++;
      time = 50;
    }
  }
}


public void combos() {
  if (combos > 1) {
    if (numPlaced>3) {
      combos = 0;
    }
  }
}
