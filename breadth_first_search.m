function explored = breadth_first_search(grid_size, start, goal, obstacle)
%% FUNCTIONALITY: Run breadth-first search on grid
%% INPUT(1): grid_size (length of quadratic grid)
% type --> int
%% INPUT(2): start (start position)
% type --> start structure:
% start.row
% start.col
%% INPUT(3): goal (goal position)
% type --> goal structure:
% goal.row
% goal.col
%% INPUT(3): obstacle (list of obstalce positions)
% type --> matrix
% e.g. obstacle = [3, 3, 4;  % = [obst1_r, obst2_r, obst3_r; 
%                  2, 3, 3]; %    obst1_c, obst2_c, obst3_c];
%% OUTPUT: explored (list of explored nodes)
% type --> array of nodes: [node1, node2, node3, ...]
% Nodes are of type 'node structure':
% node structure (Breadth First Search):
% node.row
% node.col
% node.depth
% node.predecessor


%% Initialization
obstacle_map = repmat('E', grid_size, grid_size);
for it = 1:length(obstacle)
    obstacle_map(obstacle(1,it), obstacle(2,it)) = 'O';
end

explored = []; % list of explored nodes
frontier = []; % nodes which are currently on frontier

%% Start of algorithm
% Set initial state
% TODO
node.row = start.row;
node.col = start.col;
node.depth = 1;
node.predecessor = [0 0]; % Start node has no predecessor --> Fill in non existent state [row, col] = [0, 0]

% return from search if start node is the goal
% TODO
if check_if_node_is_solution(node, goal)
    return ;
end

% Move start node into frontier
% TODO
frontier = [frontier node];

goal_not_found = 1;
while goal_not_found
    
    % check if frontier is empty
    %TODO
    if isempty(frontier)
        disp("Empty frontier list");
        return
    end
    
   
    % POP shallowest element from frontier
    % TODO
    frontier = sort_node_list(frontier, 3); % sort after depth field which is number 3 in node structure
    node = frontier(1); 
    frontier(1) = []; % remove first element from frontier
    disp(frontier)
    
    % add node to the list of explored nodes
    % TODO
    explored = [explored, node];
    
    % loop through all possible actions (U, D, L, R) and add possible child
    % state to the frontier
    actions = [1 -1 0 0; 
               0 0 -1 1];
    for a = 1:length(actions)
        % check if action leads to new state which is allowed (e.g. not
        % outside the grid and no obstacle
        if node.row+actions(1,a) > 0 && node.row+actions(1,a) < grid_size+1 && ...
           node.col+actions(2,a) > 0 && node.col+actions(2,a) < grid_size+1 && ...
           obstacle_map(node.row+actions(1,a), node.col+actions(2,a)) ~= 'O'
            % Set child node
            % TODO
            child.row = node.row + actions(1,a);
            child.col = node.col + actions(2,a);
            child.depth = node.depth + 1;
            child.predecessor = [node.row node.col];
            
            % check if child is already in frontier or already explored
            if check_if_in_node_list(node, frontier) == 0 && check_if_in_node_list(node, explored) == 0 % TODO: use check_if_in_node_list() to check if node not in frontier list or in explored list 
                if check_if_node_is_solution(child, goal) % TODO: use check_if_node_is_solution() to check if child is goal
                    goal_not_found = 0; % stop the while loop
                    explored = [explored, child]; % Technically goal is not explored but,
                    %we need to add it in order to be able to reconstruct
                    %path from goal to start
                    disp('Found the Goal!')
                else
                    % add child to frontier
                    frontier = [frontier child];
                end
            end
        end
    end   
end