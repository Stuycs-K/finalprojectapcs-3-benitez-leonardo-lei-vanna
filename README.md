[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/YxXKqIeT)

# Block Blast!

## Project Description

**Block Blast!** is a fast-paced, grid-based puzzle game where you drag and drop Tetris-style pieces to fill rows and columns on an 8x8 board. Clear full rows and columns to score points, rack up combos, and chase your high score! With colorful visuals, a dynamic background, and an intuitive UI, Block Blast offers strategic challenge and a fun time.

Think of it as **Tetris x Sudoku**, with no gravity and infinite possibilities - just don’t run out of space!

---

## How to Play

### Controls

* **Drag and Drop**: Click on any of the three pieces in the bottom lineup and drag it to a valid location on the board. Release to place it.
* **Restart Game**: Press `R` after a game over to reset and start a new run.
* **Change Background Colors**:

  * `Q/W` - Increase/decrease Red
  * `A/S` - Increase/decrease Green
  * `Z/X` - Increase/decrease Blue

### Objective

* Fill **entire rows or columns** to clear them and gain **80 points** per clear.
* Chain multiple clears to trigger **combos** and score bonus points.
* Once **no valid moves** are left for any piece in the lineup, the game ends.
* Beat your **high score**, which is saved and animated when broken!

---

## Gameplay Overview

* The **bottom of the screen** shows a **lineup of 3 random pieces**.
* Pieces have various shapes (L, T, S, etc.) and are represented with **color-coded blocks**.
* Dragging a piece over the board shows a **transparent shadow** if it's a valid move.
* Pieces can only be placed if:

  * All cells the piece covers are empty
  * The piece fits within the 8x8 board bounds
* **Once all 3 pieces are placed**, a new lineup is generated.
* A **flashing background effect** occurs on successful clears.

---

## Features

* ✔️ Smooth **drag-and-drop interaction**
* ✔️ **8x8 board** with RGB color storage in a 3D array
* ✔️ **3-piece random lineup** of predefined shapes
* ✔️ **Score and high score tracking**
* ✔️ **Background color customization** using keyboard keys
* ✔️ **Game Over screen** with restart prompt
* ✔️ **Shadow preview** of valid placements
* ✔️ **Animated background flash** when scoring


## Created By

**Period 3 — Group: BlockBlastBananas**
**Leonardo Benitez** & **Vanna Lei**


* This is a singleplayer game
* This game was designed to run in 920x920 resolution.
