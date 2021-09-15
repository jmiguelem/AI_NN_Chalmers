function sorted_list = sort_node_list(nodes, field_num)
%% FUNCTIONALITY: sorts list of nodes based on variable field index
%% INPUT(1): nodes 
% type --> array of nodes: [node1, node2, node3, ...]
% Nodes are of type 'node structure':
% Breadth First Search:
% node.row
% node.col
% node.depth
% node.predecessor
% Astar Search:
% node.row
% node.col
% node.g 
% node.h 
% node.f
% node.predecessor
%% INPUT(2): field_num
% type --> int which indicates the field number based on which to sort
% (sort direction: from small to large)
% e.g. sort_node(frontier, 3) would sort list based on node.depth
%% OUTPUT(1): sorted list of nodes
% type --> array of nodes: [node1, node2, node3, ...]

%% Implementation
    cells = struct2cell(nodes);
    sortvals = cells(field_num,1,:);
    mat = cell2mat(sortvals);
    mat = squeeze(mat);
    [~, ix] = sort(mat);
    sorted_list = nodes(ix);
    
end