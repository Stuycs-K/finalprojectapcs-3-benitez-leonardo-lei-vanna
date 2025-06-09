# Section 1: Description

**PERIOD 3**
**Group members names:** Leonardo Benitez and Vanna Lei
**Group Name:** BlockBlastBananas

### Brief Project Description:

~~Our group is going to recreate the amazing Block Blast Game. There will be 2 different game modes: one that starts with an empty board and another one with random pieces. filled in. There were be three random pieces generated for you to fit in the board. You will use arrow keys (or drag and drop if we have time) to move the pieces onto the board. The row gets cleared and you get points after the row is filled with blocks, just like the game. The score will be placed on the top and it will also account for combos.~~

Our group is recreating the Block Blast Game in Processing. There will be an 8x8 board and a lineup of three randomly generated pieces for the player to place using drag-and-drop. Rows and columns clear when fully filled, increasing the score and triggering visual effects like background flashes. The score and high score will be tracked at the top. Once no pieces can be placed, the game ends and can be restarted. (new/updated)

### Expanded Description: (new/updated)

The game replicates the core mechanics of Block Blast: placing polyomino-style pieces on an 8x8 grid to clear rows or columns and score points. Players can drag pieces from a bottom lineup to valid positions on the board. Each piece has a color and predefined shape. The game includes dynamic background visuals that react to score events, a combo system for multiple clears, and an animated high score display. Pieces can’t be placed out-of-bounds or on filled cells, and once no moves are possible, a game over screen appears.

### Critical features (Minimum Viable Product) - What you want to have after 1.5 weeks

* Functional 8x8 board using a 3D array to store color data
* Class-based system for `Piece` and `Board` objects
* Randomly generating 3-piece lineup with pre-set shapes
* Ability to drag and place pieces onto valid board positions
* Logic to clear full rows and columns
* Score tracking and display (displayedScore vs score)
* Game over detection when no pieces can be placed

### Nice to have features - What you would want to have by the end

* Visual shadows to preview valid placement (included in `drawShadow`) (new/updated)
* Background color customization via keyboard input (Q/W/A/S/Z/X) (new/updated)
* Animated high score message with rotation and styling (new/updated)
* Background flashing effect after row/col clears (new/updated)
* ~~Drag and drop blocks instead of moving them using arrow keys~~
* ~~Different themes/game modes~~
* Local leaderboard or sound effects if time permits

---

# Section 2: UML

UML Diagram showing class hierarchy and interactions:

![alt text](https://github.com/Stuycs-K/finalprojectapcs-3-benitez-leonardo-lei-vanna/blob/main/FinalUML.png "UML Diagram")

### Outline of how methods fit together:

* `Piece` class stores shape, color, and drawing logic for each piece
* `Board` class manages board grid and piece placement (`canPlace`, `placePiece`, `drawBoard`)
* `newLineUp()` generates 3 random pieces using predefined shape strings
* Game loop (`draw`) handles rendering board, score, high score, and active piece
* `drawShadow()` shows transparent preview when hovering a piece
* Input methods (`mousePressed`, `mouseReleased`, `mouseDragged`) enable interaction
* `scoreRow()` and `scoreCol()` handle detection and clearing of filled rows/cols
* `combos()` handles combo logic and extra scoring
* `handleGameOver()` checks whether the game is over and allows restarting

(new/updated)

---

# Section 3: Development Phases/Stages

### **Phase 1: Game Board and Block Basics (Days 1–5: May 16–20)**

* [x] Built 8x8 board using a 3D array of RGB values (`Board` class)

  * [x] Initialized and displayed the board grid
* [x] Defined and stored piece shapes as 2D arrays in `Piece`

  * [x] Assigned each piece a random RGB color
* [x] Displayed basic board with colored blocks

  * [x] Ensured visual alignment and board layout stability

---

### **Phase 2: Piece Lineup and Placement Logic (Days 6–10: May 21–25)**

* [x] Created method to generate 3 random `Piece` objects (`newLineUp`)

  * [x] Stored them in `pieceLineUp[]`
* [x] Added drag-and-drop mechanics using `mousePressed`, `mouseDragged`, `mouseReleased`
* [x] Prevented illegal placements (overlap or out-of-bounds) using `canPlace`
* [x] Implemented piece placement and board update method (`placePiece`)
* [x] Initial visual tweaks to improve block rendering

---

### **Phase 3: Scoring, Clearing, and Combo System (Days 11–15: May 26–30)**

* [x] Added logic to clear filled rows and columns (`scoreRow`, `scoreCol`)
* [x] Implemented scoring and display (`score`, `displayedScore`, `highScore`)
* [x] Designed combo system for extra points during multiple clears
* [x] Added animated flash background effect on successful clears
* [x] Debugged and refined score-related animations

---

### **Phase 4: Game Over and UI Polish (Days 16–20: May 31–June 4)**

* [x] Detected game-over state using `canPlaceAny`

  * [x] Displayed “Game Over” message and restart option
* [x] Created animated high score alert (“NEW HIGH SCORE!!”) using `rotate`
* [x] Enhanced UI visuals (title, layout, color adjustments)
* [x] Added shadow to show potential piece placement (`drawShadow`)
* [x] Debugged visual alignment and centering issues

---

### **Phase 5: Extra Features and Final Touches (Days 21–25: June 5–9)**

* [x] Enabled background color adjustments via keyboard (Q/W/A/S/Z/X keys)
* [x] Performed major code cleanup and optimization
* [x] Refined piece visuals using triangle render logic
* [x] Improved user feedback through animation and interaction polish
* [ ] ~~Game modes: Classic vs. Challenge (not implemented)~~
* [ ] ~~Local leaderboard (not implemented)~~
* [ ] ~~Sound effects (not implemented)~~
* [ ] ~~Additional visual themes and color palette (not implemented)~~


# ~~Section 3: Development Phases/Stages~~

~~**Section 3: Development Phases/Stages**~~

~~**Phase 1: Game Board and Block Basics (Days 1–5)**~~

* ~~Build 8x8 board using a 2D array and display it~~  
* ~~Create basic block shapes and store them as arrays~~  
* ~~Add ability to place blocks and update board state~~  

~~**Phase 2: Random Blocks and Movement (Days 6–10)**~~

* ~~Generate 3 random blocks from a fixed set~~  
* ~~Display blocks and allow arrow key movement~~  
* ~~Prevent illegal placements (overlaps, out-of-bounds)~~  

~~**Phase 3: Row Clearing and Scoring (Days 11–14)**~~

* ~~Add logic to detect and clear full rows~~  
* ~~Implement scoring system (rows cleared + combos)~~  
* ~~Show score at the top of the screen~~  

~~**Phase 4: Game Modes and Polishing (Days 15–20)**~~

* ~~Add Classic (empty board) and Challenge (pre-filled) modes~~  
* ~~End game when no blocks fit, show Game Over screen~~  
* ~~Clean up UI and basic styling~~  

~~**Phase 5: Extra Features (Days 21–30)**~~

* ~~Drag and drop for block movement~~  
* ~~Theme and color options~~  
* ~~Add local leaderboard and sound effects (if time)~~  
