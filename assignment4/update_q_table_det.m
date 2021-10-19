function q_table_out = update_q_table_det(q_table_in, s_current, a_current, r, s_next, gamma, state_params)
%% FUNCTIONALITY: update the q-table (special update which only works for deterministic actions)
%% INPUT(1): q_table_in ( Q(s,a) )
% type --> 2D - matrix (size: num_states x actions)
%% INPUT(2): s_current (current robot state)
% type --> array with 4 values:
% s_current(1): current robot start row
% s_current(2): current robot start col
% s_current(3): current object position (where it is to be picked up by the
% robot) in form of an index (1 (= 'A'), 2 (= 'B'), 3 (= 'C'),
%  4 (= 'D'), 5 (= 'inGripper') )
% s_current(4):  drop-off goal position in form of an index (1 (= 'A'), 2 (= 'B'), 3 (= 'C'),
%  4 (= 'D'))
%% INPUT(3): a_current (action)
% type --> int
% index that represents an action:
% 1 (= 'S') --> move south 
% 2 (= 'N') --> move north 
% 3 (= 'W') --> move west 
% 4 (= 'E') --> move east 
% 5 (= 'pick-up') 
% 6 (= 'drop-off') 
%% INPUT(4): r (reward generated by a_current)
% type --> int
%% INPUT(5): s_next (next robot state)
% type --> array with 4 values:
% s_next(1): next robot start row
% s_next(2): next robot start col
% s_next(3): next object position (where it is to be picked up by the
% robot) in form of an index (1 (= 'A'), 2 (= 'B'), 3 (= 'C'),
%  4 (= 'D'), 5 (= 'inGripper') )
% s_next(4): drop-off goal position in form of an index (1 (= 'A'), 2 (= 'B'), 3 (= 'C'),
%  4 (= 'D'))
%% INPUT(6): gamma (discount factor)
% type --> float value between [0, 1]
%% INPUT(7): state_params: [grid_size, num_obj_pos, num_goal_pos, num_actions] 
% type --> vector: [int, int, int, int]
%% OUTPUT: q_table_out ( Q(s,a) )
% type --> 2D - matrix (size: num_states x actions)

%% TODO: Implementation

    % index of current state in q_table
    ind_cur = sub2ind([state_params(1) state_params(1) state_params(2) state_params(3)], s_current(1), s_current(2), s_current(3), s_current(4));
    % index of next state in q_table
    ind_next = sub2ind([state_params(1) state_params(1) state_params(2) state_params(3)], s_next(1), s_next(2), s_next(3), s_next(4));
    
    % TODO: Update the q-table    
    max_s = max(q_table_in(ind_next,:));
    q_table_out = q_table_in;
    q_table_out(ind_cur,a_current) = r + gamma*max_s;
end