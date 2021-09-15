function node_list = create_nodes_from_grid(grid_size, goal)
%% Functionality: Loop through all grid cells and add node to node_list
%% TIP:
% When creating the node_list think about how the list index can correlate
% to node.row and node.col of a particular node...
% The Matlab function sub2ind() could later (in astar_search()) be used to retrieve list index
% for particular grid coordinate.
%% INPUT(1): grid_size (length of quadratic grid)
% type --> int
%% INPUT(2): goal (goal position)
% type --> goal structure:
% goal.row
% goal.col
%% OUTPUT: node_list (list of all existing nodes in grid)
% type --> array of nodes: [node1, node2, node3, ...]
% node structure (Astar Search):
% node.row
% node.col
% node.g 
% node.h 
% node.f
% node.predecessor

    %% TODO: Implementation
    node_list = [];
    for c = ??? % loop through cols of grid
        for r = ??? % loop through rows grid
            % 1. initialize the new node
            node.row = ???
            node.col = ???
            node.g = ??? % initial path cost from start node to current node with infinity
            % estimated cost of the cheapest path to the goal
            node.h = ??? % use euclidean_distance_heuristics()
            node.f = ???
            node.predecessor = [0 0]; % init with element which does not exist
            % 2. Add it to the list of nodes
            node_list = ??? % add node to the existing list
        end
    end

end