function q_table = initialize_q_table(state_params)
%% FUNCTIONALITY: set up Q-table with the following initial values
% all values are zero
%% TIP: look up the zeros() function
%% INPUT(1): state_params: [grid_size, num_obj_pos, num_goal_pos, num_actions] 
% type --> vector: [int, int, int, int]
%% OUTPUT: q_table ( Q(s,a) )
% type --> 2D - matrix (size: num_states x actions)


%% TODO: Implementation
num_states = (state_params(1)^2)*state_params(3)*state_params(2); % number of states
q_table = zeros(num_states, state_params(4)); % have a look at the zeros function in the documentation to see how to use it

end