function path = reconstruct_path(explored, start, goal)
%% FUNCTIONALITY: Reconstruct the path from start to goal with help of explored nodes
%% TIP(1): reconstruction can be achieved with help from node.predecessor
%% TIP(2): start your way from goal node and work your way back to start node
%% INPUT(1): node list 
% nodes are of type:
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
%% INPUT(2): start (start position)
% type --> start structure:
% start.row
% start.col
%% INPUT(3): goal (goal position)
% type --> goal structure:
% goal.row
% goal.col
%% OUTPUT(1): path (list of states which indicate the path from start to goal)
% type --> 2xn matrix (n = number of steps from start to goal)
% e.g. obstacle = [1, 1, 1;  % = [node1_r, node2_r, node3_r; 
%                  1, 2, 3]; %    node1_c, node2_c, node3_c];
%% !!!!!OUTPUT REQUIREMENTS!!!!!:
% 1. If no path can be found return empty list
% 2. If soltion can be found return the complete list in logical order
%   [start_state, step1, step2, step3, ..., goal_state] (not the other way
%   around)
% 3. If start = goal only return the state once ==> [start_state]


%% Implementation TODO

% TODO: start the path from the goal node
path = goal;
% instantly return if goal is start
if goal == start
    return 
end


reached_start = 0;
while % not reached start
    found_predecessor = 0 % boolean that is set to 1 if any predecessor could be found for the current node (only required for the case that no path can be found) 
    % TODO
    for expl = explored % loop through the explored list
        if find(expl == path) % if node from explored list is the current path element, add its predecessor to the list
            path = expl.predecessor % always add path elements to the left side since we reconstruct from the goal
            found_predecessor = 1
            break
        end
    end
    % TODO: check if path is complete --> terminate while loop
    if %%% path has reached the start node
        reached_start = 1
        disp('Found the path!')
    end
    
    % TODO: check if any solution is found, if not return empty path list
    if found_predecessor == 0
        disp('Could not find a path!')
        path = [];
        reached_start = 1;
    end
end


end