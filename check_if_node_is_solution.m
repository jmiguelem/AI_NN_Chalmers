function solution = check_if_node_is_solution(node, goal)
%% FUNCTIONALITY: Check if node is a goal state
% Function should work for breadth first search AND astar search
%% INPUT(1): node 
% type --> node structure (Breadth First Search):
% node.row
% node.col
% node.depth
% node.predecessor
% type --> node structure (Astar Search):
% node.row
% node.col
% node.g 
% node.h 
% node.f
% node.predecessor
%% INPUT(2): goal 
% type --> goal structure:
% goal.row
% goal.col
%% OUTPUT: solution
% type --> int (0 = false, 1 = true)

    %% TODO: check if node is goal and return either true or false (0 = false, 1 = true)    
    if node.row == goal.row && node.column == goal.column 
        solution = 1;
    else 
        solution = 0;
    end
end