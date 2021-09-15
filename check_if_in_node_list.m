function [in_list, ind] = check_if_in_node_list(node, node_list)
%% FUNCTIONALITY: check if node is in node_list based on row and col;
% Return if node is in node_list and the element index
% Should also work in case node_list is empty!!!
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
%% INPUT(2): node_list
% type --> array of nodes: [node1, node2, node3, ...]
%% OUTPUT(1): in_list (int that satets if node is in node_list)
% type --> int (0 = node is not in node_list, 1 = node is in node_list)
%% OUTPUT(2): ind (in case node is in node_list --> index of node in node_list)
% type --> int (0 if node is not in node_list, ~0 if node is in node_list

in_list = 0; ind = 0;
if isempty(node_list)
    return 
else 
    % TODO: Loop through all the elements of the node list
    for index = 1: length(node_list)
       % TODO: check if node is equal to list element based on row and col
       if node.row == node_list(index).row && node.col == node_list(index).col
            in_list = 1;
            ind = index
       %end
    end
end


end