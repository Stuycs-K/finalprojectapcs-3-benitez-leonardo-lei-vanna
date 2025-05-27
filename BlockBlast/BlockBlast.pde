private int score;
private int combos;
private int[] pieceLineUp;
static String scoreText;
//private Board gameboard;

void setup(){
  size(920,920);
  pieceLineUp = new int[3];
}
void draw(){
  background(255);
  fill(255);
  rect(380, 2, 200, 40);
  fill(0);
  textSize(20);
  text("Score: " + score, 395, 26);
}
void score(){
  score = 0;
  
}
void combos(){
  combos = 0;
}
