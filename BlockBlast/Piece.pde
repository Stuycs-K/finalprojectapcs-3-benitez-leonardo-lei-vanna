public class Piece{
  private int[] design;        // RGB color
  private int[][] shape;       // 5x5 shape matrix
  private String identifier;   // piece type
  
  public Piece(String type) {
    identifier = type;
    design = randomColor();
    shape = generateShape(type);
  }
  
  public int[][] shape() {
    return shape;
  }
  
  public int[] colorID() {
    return design;
  }
  
  public String type() {
    return identifier;
  }
  
  private int[] randomColor() {
    return new int[] {
      (int)random(80, 255),
      (int)random(80, 255),
      (int)random(80, 255)
    };
  }
  
  private int[][] embedShape(int[][] small) {
    int[][] result = new int[5][5];
    int rowOffset = (5 - small.length) / 2;
    int colOffset = (5 - small[0].length) / 2;
    
  }
}
  
  
  
  
 
}
