function [r, s_next] = perform_one_step(s_current, a_current, goals, state_params, obstacles)
%% FUNCTIONALITY: 
% based on current state and an action calculate the reward and the next
% state
%% INPUT(1): current robot state
% type --> array with 4 values:
% s_current(1): initial robot start row
% s_current(2): initial robot start col
% s_current(3): initial object position (where it is to be picked up by the
% robot) in form of an index (1 (= 'A'), 2 (= 'B'), 3 (= 'C'),
%  4 (= 'D'), 5 (= 'inGripper') )
% s_current(4): drop-off goal position in form of an index (1 (= 'A'), 2 (= 'B'), 3 (= 'C'),
%  4 (= 'D'))
%% INPUT(2): a_current (action)
% type --> int
% index that represents an action:
% 1 (= 'S') --> move south 
% 2 (= 'N') --> move north 
% 3 (= 'W') --> move west 
% 4 (= 'E') --> move east 
% 5 (= 'pick-up') 
% 6 (= 'drop-off') 
%% INPUT(3): goals (position of 'A', 'B', 'C', 'D'
% e.g. goals = [1, 1, 10, 10;  = [Arow, Brow, Crow, Drow;
%               1, 9, 10,  1];    Acol, Bcol, Ccol, Dcol]
%% INPUT(4): state_params: [grid_size, num_obj_pos, num_goal_pos, num_actions] 
% type --> vector: [int, int, int, int]
%% INPUT(5): obstacle (list of obstacle positions)
% type --> matrix
% e.g. obstacle = [3, 3, 4;  % = [obst1_r, obst2_r, obst3_r; 
%                  2, 3, 3]; %    obst1_c, obst2_c, obst3_c];
%% OUTPUT(1): r (reward generated by a_current)
% type --> int
%% OUTPUT(2): s_next (next state)
% type --> array with 4 values:
% s_next(1): next robot start row
% s_next(2): next robot start col
% s_next(3): object position in form of an index (1 (= 'A'), 2 (= 'B'), 3 (= 'C'),
%  4 (= 'D'), 5 (= 'inGripper') )
% s_next(4): drop-off goal position in form of an index (1 (= 'A'), 2 (= 'B'), 3 (= 'C'),
%  4 (= 'D'))

%% TODO: Implementation
        
    % TIP: you can again use the following action deterministic action
    % representation when coding the transitions
    a_move = [1, -1,  0, 0;
              0,  0, 1, -1];
            
    % TODO
    obs = 0;
    if a_current < 5 % a_current is one of the movements (S, N, W, E)]
        
        for o=1:1:length(obstacles)
            if (s_current(1)+a_move(1,a_current) == obstacles(1,o) && s_current(2)== obstacles(2,o)) || (s_current(1) == obstacles(1,o) && s_current(2)+a_move(2,a_current)== obstacles(2,o))
                obs = 1;
            end
        end
        
        if  s_current(1)+ a_move(1,a_current) <= 0 || state_params(1) < s_current(1)+a_move(1,a_current) || s_current(2)+a_move(2,a_current) <= 0 || state_params(1) < s_current(2)+a_move(2,a_current) || obs % check if agents would bump into wall
            r = -100;
            s_next = s_current;
        else % normal 1 step reward
            r = -1;
            s_next = s_current;
            s_next(1) = s_current(1)+a_move(1,a_current);
            s_next(2) = s_current(2)+a_move(2,a_current);
        end
    elseif a_current == 5 % action is pick up
        if s_current(3) ~= 5
            if (s_current(1) == goals(1,s_current(3)) && s_current(2) == goals(2,s_current(3)))% succesfull pickup
                r = 0;
                s_next = s_current;
                s_next(3) = 5;
            else % non-succesfull pickup
                r = -10;
                s_next = s_current;
            end
        else
            r = -10;
            s_next = s_current;
        end
    elseif a_current == 6 % action is drop down
        if (s_current(1) == goals(1,s_current(4)) && s_current(2) == goals(2,s_current(4))) && s_current(3) == 5% succesfull drop down
            r = 20;          
            s_next = s_current; % no next state is required since episode is finished after
            % that step so simply set it to current state
        else % non-succesfull drop down
            r = -10;
            s_next = s_current;
        end
    end
end