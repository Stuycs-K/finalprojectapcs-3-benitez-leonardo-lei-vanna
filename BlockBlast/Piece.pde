public class Piece{
  private int[] design;        // RGB color
  private int[][] shape;       // 5x5 shape matrix
  private String identifier;   // piece type
  
  public Piece(String type) {
    identifier = type;
    design = randomColor();
    shape = generateShape(type);
  }
  
  public int[][] shape(){
    return shape;
  }
  
  private int[] randomColor(){
  }
  
  
  public String type(){
    return identifier;
  }
  
  
 
}
