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
distance = sqrt((current(1)-goal(1))^2 + (current(2)-goal(2))^2);
end