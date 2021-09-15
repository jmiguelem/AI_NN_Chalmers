# Implementation of BSF and A* algorithms

## Files

- setup.m: Main script that sets up the environment, calls the search algorithms and reconstructs the path from start to goal
- breadth_first_search.m: implementation of the BFS 
- astar_search.m: implementation of the A* algorithm
- reconstruct_path.m: reconstruct the path from start to goal based on the list of explored nodes (output from the search algorithms)
- check_if_node_is_solution.m: check if a node is the goal and return either true or false
- sort_node_list.m: already implemented!!!! Sorts a list of nodes based on a specified field number
- check_if_in_node_list.m: checks if a node is in a list of nodes
- create_nodes_from_grid.m: only required for A* algorithm; initializes a list of all grid cells which is going to save information regarding the g,h,f cost and the currently best predecessor
- euclidean_distance_heuristics.m: function that calculates the euclidean distance between current cell and goal cell in the grid

