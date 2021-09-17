function distance = euclidean_distance_heuristics(current, goal)
%% Functionality: Calculate euclidean distance between current and goal position
%% INPUT(1): current position
% type --> array [row, col]
% how to access: e.g. current_row = current(1)
%% INPUT(2): goal position
% type --> array [row, col]
% how to access: e.g. goal_col = goal(2)
%% OUTPUT: euclidean distance between the two states
% type --> double/float

%% TODO: Implementation
distance = sqrt((current.row-goal.row)^2 + (current.col-goal.col)^2);
end