class Piece{
  private int[] design; // RGB color
  private int[][] shape; // 5x5 shape matrix
  private String identifier; // piece type
  private int cellSize = 50;

  
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
  
   public int[] randomColor() {
    return new int[] {
      (int)random(80, 255),
      (int)random(80, 255),
      (int)random(80, 255)
    };
  }
  
  private int[][] embedShape(int[][] small) {
    int[][] result = new int[3][3];
    int rowOffset = (3-small.length)/2;
    int colOffset = (3-small[0].length)/2;
    for (int i = 0; i < small.length; i++) {
      for (int j = 0; j < small[0].length; j++) {
        result[i+rowOffset][j+colOffset] = small[i][j];
      }
    }
    return result;
  }
  
  public void drawPiece(int x, int y) {
    for (int r = 0; r < shape.length; r++) {
      for (int c = 0; c < shape[0].length; c++) {
        if (shape[r][c] == 1) {
          fill(design[0], design[1], design[2]);
          stroke(0);
          rect(c*cellSize+x-cellSize*2, r*cellSize+y-cellSize*2, cellSize, cellSize);
        }
      }
    }
  }

  
  
  private int[][] generateShape(String type) {
    int r = (int)random(0, 4);

    switch(type) {
      case "T3x3":
        int[][][] tShapes = {
          { {0,1,0}, {1,1,1}, {0,0,0} },
          { {0,1,0}, {0,1,1}, {0,1,0} },
          { {0,0,0}, {1,1,1}, {0,1,0} },
          { {0,1,0}, {1,1,0}, {0,1,0} }
        };
        return embedShape(tShapes[r]);

      case "L3x3":
        int[][][] lShapes = {
          { {1,0,0}, {1,1,1}, {0,0,0} },
          { {0,1,1}, {0,1,0}, {0,1,0} },
          { {0,0,0}, {1,1,1}, {0,0,1} },
          { {0,1,0}, {0,1,0}, {1,1,0} }
        };
        return embedShape(lShapes[r]);
        
      case "L2x3":
        int[][][] l23 = {
          { {1,0}, {1,0}, {1,1} },
          { {0,0,1}, {1,1,1} },
          { {1,1}, {0,1}, {0,1} },
          { {1,1,1}, {1,0,0} }
        };
        return embedShape(l23[r]);

      case "L2x2":
        int[][][] l22 = {
          { {1,0}, {1,1} },
          { {1,1}, {0,1} },
          { {1,1}, {1,0} },
          { {0,1}, {1,1} }
        };
        return embedShape(l22[r]);

      default:
        return embedShape(new int[][] {
          {1,1},
          {1,1}
        });
    }
  }
}
