%% setup environment & calls the planning algorithms
clear all;
clc;
% 1. Create a quadratic grid environment
% size of the grid e.g. 4x4
grid_size = 4;
% row and col position of obstacles 
obstacle = [3, 3, 4;  % = [obst1_r, obst2_r, obst3_r; 
            2, 3, 3]; %    obst1_c, obst2_c, obst3_c];
% row and col position of start
start.row = 3;
start.col = 1;
% row and col position of goal
goal.row = 4;
goal.col = 4;

% Grid visualization (not important for the algorithms but could help for
% debugging)
% each cell has either type, E (Empty), O (Obstacle), S (Start), G (Goal)
grid = repmat('E', grid_size, grid_size);
for it = 1:length(obstacle)
    grid(obstacle(1,it), obstacle(2,it)) = 'O';
end
grid(start.row, start.col) = 'S';
grid(goal.row, goal.col) = 'G';


%% 2. Breadth first search
% node type (Breadth first search) is defined as follows
% node.row
% node.col
% node.depth
% node.predecessor
exploredBF = breadth_first_search(grid_size, start, goal, obstacle);

%% 3. A* search
% node type (A*) is defined as follows
% node.row
% node.col
% node.g path cost from start node to current node
% node.h estimated cost of the cheapest path from n to the goal
% node.f = node.g + node.h;
% node.predecessor
exploredA = astar_search(grid_size, start, goal, obstacle);
 
%% 4. To find path traverse back from goal to start using the node.predecessor
%path = reconstruct_path(exploredBF, start, goal);


% Try reconstruct when we didnt reach the start
% node1.row = 1; node1.col = 2; node1.predecessor = [3,3];
% 
% node2.row = 2; node2.col = 3; node2.predecessor = [1, 2];
% node3.row = 4; node3.col = 4; node3.predecessor = [2, 3];
% 
% explored = [node3 node2 node1];

