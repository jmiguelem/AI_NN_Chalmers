function close = astar_search(grid_size, start, goal, obstacle)
%% FUNCTIONALITY: Run astart search on grid
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
%% INPUT(4): obstacle (list of obstacle positions)
% type --> matrix
% e.g. obstacle = [3, 3, 4;  % = [obst1_r, obst2_r, obst3_r; 
%                  2, 3, 3]; %    obst1_c, obst2_c, obst3_c];
% get grid site
%% OUTPUT: explored (list of explored nodes)
% type --> array of nodes: [node1, node2, node3, ...]
% Nodes are of type 'node structure':
% node structure (A* Search):
% node.row
% node.col
% node.g
% node.h
% node.f
% node.predecessor


%% Initialization
obstacle_map = repmat('E', grid_size, grid_size);
for it = 1:length(obstacle)
    obstacle_map(obstacle(1,it), obstacle(2,it)) = 'O';
end

%% Start of algorithm
% initialize open and close lists
% OPEN: contains nodes that have been visited but not expanded 
% (meaning that successirs have not been close yet). This is the list of
% pending tasks
% CLOSE: nodes that have been visited and expanded (successors have been
% close already and included in the open list, if this was the case)
open = []; 
close = [];

%% create list of all nodes and initialize their values
%% TODO: implement create_nodes_from_grid() based on template
nodes = create_nodes_from_grid(grid_size, goal);

%% Update initial state in list
% TODO
node_current.row = start.row;
node_current.col = start.col;
node_current.g = 0; % path cost from start node to node n
node_current.h = euclidean_distance_heuristics(node_current, goal); % estimated cost of the cheapest path from n to the goal - euclidean_distance_heuristics()
node_current.f = node_current.g + node_current.h;
node_current.predecessor = [0, 0]; % Start node has no predecessor --> Fill in non existent state [row, col] = [0, 0]

% Update node in list
nodes(sub2ind(size(obstacle_map), start.row, start.col)) = node_current;

%% Put initial state into the OPEN list with f(node_start) = h(node_start)
open = node_current;

%% 
while ~isempty(open) 
    
    % Take from the open list the node with the lowest f = g + h
    % Tip: use sort_node_list(nodes, field_num) to sort a list of nodes
    % based on particular field (e.g. in this case node.f)
    % TODO
    open = sort_node_list(open, 5);
    node_current = open(1);
    
    if (check_if_node_is_solution(node_current, goal))
        close = [close, node_current];
        disp('Found the Goal!')
        return
    end
    
    % set successor_current_cost
    % TODO
    successor_current_cost = node_current.g + 1; % all state transitions have the same cost of 1
    
    % loop through all possible actions (U, D, L, R) (or in other words
    % successors)
    actions = [1 -1 0 0; 0 0 -1 1];
    for a = 1:length(actions)
        if node_current.row+actions(1,a) > 0 && node_current.row+actions(1,a) < grid_size+1 && ...
           node_current.col+actions(2,a) > 0 && node_current.col+actions(2,a) < grid_size+1 && ...
           obstacle_map(node_current.row+actions(1,a), node_current.col+actions(2,a)) ~= 'O'
            
            % get successor by making copy from nodes list
            % TODO
            node_successor = nodes(sub2ind(size(obstacle_map), node_current.row + actions(1,a), node_current.col + actions(2,a)));
            
            % successor could either be in the open list, closed list or in
            % no list ...
            
            if check_if_in_node_list(node_successor, open) % in open list...
                if node_successor.g <= successor_current_cost % algorithm line 10 
                    continue % at line 20
                end
            elseif check_if_in_node_list(node_successor, close) % in closed list...
                if node_successor.g <= successor_current_cost % algorithm line 12
                    continue % at line 20
                end
                % move node_successor back from closed to open list
                open = [open node_successor];
                % TODO: remove from closed list
                close(end) = [];
            else
                % in case the node was not encountered before...
                % add node to the open list
                open = [open node_successor];
                % ignore line 16 --> already handled in create_nodes_from_grid()
            end
            
            % Update the node parameters in the list
            % 1. Set the new cost g and update f accordingly
            nodes(sub2ind(size(obstacle_map), node_successor.row, node_successor.col)).g = successor_current_cost;
            nodes(sub2ind(size(obstacle_map), node_successor.row, node_successor.col)).f = nodes(sub2ind(size(obstacle_map), node_successor.row, node_successor.col)).h + successor_current_cost;
            
            % 2. set the parent of node_successpr to node_current
            nodes(sub2ind(size(obstacle_map), node_successor.row, node_successor.col)).predecessor = node_current;
                     
            % also update the node_successor in the open list
            [ex, ind] = check_if_in_node_list(node_successor, open);
            if ex
                open(ind) = nodes(sub2ind(size(obstacle_map), node_successor.row, node_successor.col));
            end
            
        end
    end
    
    % after all successor states have been considered for current_node
    % TODO
    % 1. Remove from open list
    
    open(1) = [];
    % 2. Add to closed list
    close = [close node_current];
end

% ignore last line of pseudo code (l. 23)
end