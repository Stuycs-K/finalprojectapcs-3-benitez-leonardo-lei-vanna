Dev Log:

This document must be updated daily every time you finish a work session.

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
