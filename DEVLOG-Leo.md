## Leonardo Benitez

### 2025-05-16 - Proposal

We spent the entire period brainstorming viable project ideas and narrowing them down based on feasibility, interest, and gameplay mechanics. I took notes during the brainstorming session and contributed ideas both in class and later at home. After discussing possibilities, we finalized Block Blast as our game concept, based on a recommendation and our own excitement about the mechanics.

### 2025-05-20 - Project description

I contributed heavily to refining the project description and Minimum Viable Product list. Although the commit was made on Vanna’s computer, we collaborated on the wording and game feature breakdown. I also spent time experimenting with GitHub branching to prep for version control during development.

### 2025-05-21 - Section 3

I finalized Section 3 of the prototype document and spent a good chunk of time trying to resolve issues with git branches and local commits. The version control side of things has taken some effort, but it’s starting to click.

### 2025-05-22 - Brief description

We began outlining the overall structure of our codebase. I researched UML diagramming tools and created our initial UML diagram using SmartDraw. This helped us better visualize how our classes would interact, especially regarding board logic and piece generation.

### 2025-05-23 - Brief description

After reevaluating our class design, we created a revised UML diagram with a cleaner structure. I initiated the update and focused on making our design modular and adaptable to game modes. This step clarified how we'll implement features like different piece types and board states.

### 2025-05-27 - Board development

I started working on implementing the Board class, particularly focusing on method stubs like placePiece(), movePiece(), and clearLines(). It was a frustrating day dealing with branching conflicts in GitHub, but I eventually sorted them out and got the basic Board tab working in Processing.

### 2025-05-28 - Board + Piece class development

Today we had a course-wide discussion and reviewed graphics final projects for inspiration. Afterward, I made significant progress on the Board and Piece classes. I worked on finalizing the structure of the Piece class so it supports random generation and rotation of all piece types. I also cleaned up the Board class and reviewed its logic for clearing lines and placing blocks. I embedded all shapes into 5×5 matrices for alignment, added color generation, and made sure our shapes spawn with fixed but randomly chosen orientations. It's starting to feel like a real game engine now.

### 2025-05-29 - Debugging and Environment Fixes

After encountering persistent syncing issues between my local files and the remote repo, I recloned the project to reestablish proper branch tracking. Once that was resolved, I dove into debugging — identifying and fixing several critical logic errors in the Board and Piece classes that were preventing the program from compiling or running correctly. This session was less about adding features and more about making sure our foundation was solid and runnable.

### 2025-06-01 - Piece Placement, Scoring, and Visual Refinement

I focused heavily on core gameplay functionality today. First, I debugged and refined the piece placement logic, ensuring that mouse dragging only affects the current piece and not the board itself. I adjusted how pieces snap to the grid and verified that invalid placements are correctly rejected. Next, I fixed the scoring system so that points are accurately awarded when rows or columns are cleared. I then added randomized piece generation to trigger immediately after a piece is successfully placed. Finally, I cleaned up the visual presentation by modifying the drawPiece() method to only render the active blocks of a piece — removing the distracting white boxes that previously filled empty cells. These changes brought the project much closer to a polished, playable state.

### 2025-06-02 - Piece Control + Color Logic + Refactoring

I added RGB-based color generation for each piece and created keyboard controls to adjust their colors for testing. I also cleaned up the drawPiece logic to separate visuals from internal behavior and continued refining mouse drag detection. I ran multiple tests on piece placement across the board and tweaked the canPlace and isValid methods to prevent invalid overlaps. I also removed unused variables and began re-centering the visual grid, fixing visual offsets from earlier versions.

### 2025-06-03 - Visual Polish + Background Experiments

I experimented with randomly generated background visuals to make the game more dynamic and colorful. This included testing gradient effects and animated transitions, though not all of it was committed. I also cleaned up piece rendering by ensuring shadows don’t misalign and continued adjusting piece centering on the board. I updated the draw loop and added more devlog notes to reflect these updates.

### 2025-06-04 - Game Over Logic + Restart + UI Centering

Today I worked on integrating a game-over condition into the logic — specifically modifying the canPlaceAny() method to check for board saturation. I also added a restart button that resets the score and generates a new set of pieces. I did a full test cycle for UI centering, cleaning up the offset calculation that had been skewing the piece placement slightly. Also started writing up instructions and preparing for the README update.

### 2025-06-08 - Color Matching + Shadow Fixes + Cleanup

I overhauled the color-matching logic so that the game now checks for color adjacency when determining which blocks to clear. This involved modifying the clearLines method and embedding new logic into the board scanning routine. I also fixed the centering of triangle-based pieces, which had been rendering off-center due to uneven matrix padding. I added a piece-shadow feature that previews where a block would land before it’s placed, using a helper method to simulate ghost placement. Finally, I cleaned up the entire board render function and deleted all commented-out code and test snippets to prepare for final polishing.

### 2025-06-09 - Game Over Bug Fix + High Score Display

I finally tracked down and fixed a long-standing bug in the game-over logic. The issue was caused by an edge case where pieces could be scanned for but be missed due to a row of zeros in their structure. I restructured the piece layouts  and added a last-resort board scan to ensure endgame triggers correctly. I also implemented a high score tracker that persists across restarts and is updated on-screen. Lastly, I fixed an issue with image rendering in the UI — specifically, missing image icons in the score display that were failing to load on launch.

I believe this document accurately reflects the contributions of my teammate
- Vanna Lei
