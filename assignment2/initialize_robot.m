function [current_row, current_col, current_obj, current_goal] = initialize_robot(state_params, obstacles)
%% FUNCTIONALITY: randomly initialize the start state based on legal values
%  1. current_row and current_col: within bounds and not on an obstacle cell
%  2. current_obj and current_goal: either 1 (= 'A'), 2 (= 'B'), 3 (= 'C'),
%  4 (= 'D'). Note: it is legal to have pick-up and drop-off goal at same position 
%% INPUT(1): state_params: [grid_size, num_obj_pos, num_goal_pos, num_actions] 
% type --> vector: [int, int, int, int]
%% INPUT(2): obstacle (list of obstacle positions)
% type --> matrix
% e.g. obstacle = [3, 3, 4;  % = [obst1_r, obst2_r, obst3_r; 
%                  2, 3, 3]; %    obst1_c, obst2_c, obst3_c];
%% OUTPUT: initial robot state
% type --> array with 4 values:
% current_row: initial robot start row
% current_col: initial robot start col
% current_obj: initial object position (where it is to be picked up by the
% robot)
% current_goal: drop-off goal position
%% IMPORTANT: Positions need to be randomly generated!!!!!
%% TIP: use the functions randi() to generate uniformly distributed random numbers


%% TODO: Implementation

    % initial cell: draw a row/col position that is not an obstacle
    hit_obstacle = 1; 
    while hit_obstacle % repeat until you have drawn a row/col which is not an obstacle
        % TODO: draw two random initial values within the boundaries of the
        % grid for the row and the col position
        position = randi(6, 1, 2); % Tip: look for the randi function in the documentation to figure out how it works 
        current_row = position(1);
        current_col = position(2);
        
        hit_obstacle = 0; % do not continue with the while if random position is not an obstacle   
        if ~isempty(obstacles) 
            % TODO
            for o = 1:length(obstacles) % loop through the obstacles
                if current_row == obstacles(1,o) && current_col == obstacles(2,o)  % check if the init_pos is an obstacle
                    hit_obstacle = 1;
                end
            end
        end
    end
    
    % TODO: initial pick-up and drop-off position
    pick_and_drop_pos = randi(4, 1, 2);
    current_obj = pick_and_drop_pos(1); 
    current_goal = pick_and_drop_pos(2);
    
    
end