function action = epsilon_greedy_action(q_table, s_current, epsilon, state_params)
%% FUNCTIONALITY: 
% with the chance of 1-epsilon: Take action with highest Q value
% with the chance of epsilon: Randomly choose action among the other
% actions
%% INPUT(1): q_table ( Q(s,a) )
% type --> 2D - matrix (size: states x actions)
%% INPUT(2): initial robot state
% type --> array with 4 values:
% s_current(1): initial robot start row
% s_current(2): initial robot start col
% s_current(3): initial object position (where it is to be picked up by the
% robot) in form of an index (1 (= 'A'), 2 (= 'B'), 3 (= 'C'),
%  4 (= 'D'), 5 (= 'inGripper') )
% s_current(4): drop-off goal position in form of an index (1 (= 'A'), 2 (= 'B'), 3 (= 'C'),
%  4 (= 'D'))
%% INPUT(3): epsilon (chance of exploration)
% type --> float value between [0, 1]
%% OUTPUT: action
% type --> int
% index that represents which action was chosen:
% 1 (= 'S') --> move south 
% 2 (= 'N') --> move north 
% 3 (= 'W') --> move west 
% 4 (= 'E') --> move east 
% 5 (= 'pick-up') 
% 6 (= 'drop-off') 


%% TODO: Implementation
    
   % TODO: draw random number between 0 and 1
    prob_exploitation = rand ; % use the function rand() (consult the matlab documentation in case you have questions about its usage)
    
    % take optimal action
    % retrieve the q-table vector for all possible actions given s_current
    ind_q = sub2ind([state_params(1) state_params(1) state_params(2) state_params(3)], s_current(1), s_current(2), s_current(3), s_current(4)); % index of the current state in the q_table
    q_table_s_current = q_table(ind_q); 
    
    % TODO: get the max. q-value and corresponding action of
    % q_table_s_current
    [max_num, ind] = max(q_table_s_current);% Tip: use the max() function (consult the matlab documentation in case you have questions about its usage)
    action = ind;
    
    
    % TODO: case of exploration
    if prob_exploitation < epsilon % in case the prob for exploitation is smaller than epsilon
        while action == ind
            disp('loop')
            action = randi(state_params(4)); % TODO: draw a new action with help of randi 
        end
    end
    
end