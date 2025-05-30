class Piece{
  private int[] design; // RGB color
  private int[][] shape; // 5x5 shape matrix
  private String identifier; // piece type
  
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
    for (int i = 0; i < small.length; i++) {
      for (int j = 0; j < small[0].length; j++) {
        result[i+rowOffset][j+colOffset] = small[i][j];
      }
    }
    return result;
  }
  
  private int[][] generateShape(String type) {
    int[][] grid = new int[5][5];
    int r = (int)random(0, 4); // Random rotation

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
        // fallback: 2x2 block
        return embedShape(new int[][] {
          {1,1},
          {1,1}
        });
    }
  }
}
