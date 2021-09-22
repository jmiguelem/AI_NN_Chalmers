function actions = test_q_table(q_table, s_start, goals, grid, state_params, obstacles)
%% Functionality: generate list of actions, 
% which are required to reach the goal of dropping object at goal position
%% INPUT(1): q_table ( Q(s,a) )
% type --> 2D - matrix (size: num_states x actions)
%% INPUT(2): start state
% type --> array with 4 values:
% s_start(1): initial robot start row
% s_start(2): initial robot start col
% s_start(3): initial object position (where it is to be picked up by the
% robot) in form of an index (1 (= 'A'), 2 (= 'B'), 3 (= 'C'),
%  4 (= 'D'))
% s_start(4): drop-off goal position in form of an index (1 (= 'A'), 2 (= 'B'), 3 (= 'C'),
%  4 (= 'D'))
%% INPUT(3): goals (position of 'A', 'B', 'C', 'D'
% e.g. goals = [1, 1, 10, 10;  = [Arow, Brow, Crow, Drow;
%               1, 9, 10,  1];    Acol, Bcol, Ccol, Dcol]
%% INPUT(4): the grid as defined in setup.m
%% INPUT(5): state_params: [grid_size, num_obj_pos, num_goal_pos, num_actions] 
% type --> vector: [int, int, int, int]
%% INPUT(6): obstacle (list of obstacle positions)
% type --> matrix
% e.g. obstacle = [3, 3, 4;  % = [obst1_r, obst2_r, obst3_r; 
%                  2, 3, 3]; %    obst1_c, obst2_c, obst3_c];
%% OUTPUT: actions 
% type --> array of size [1xn] (number of actions to reach goal)

%% TODO: Implementation

    % starting from current state always choose the best next state to
    % reach the goal state
    
    s_current = s_start; % variable that track the current robot state: initialize with s_start
    grid_copy = grid; % copy of the grid: for visualisation purposes
    grid_copy(s_current(1), s_current(2)) = 'R' % R is the current robot position
    actions = []; % list which saves all the actions
 
    terminate_episode = 0;
    steps_counter = 0;
    running_reward = 0;
    while ~terminate_episode
        % TODO: choose an greedily derived action based on current state
        a_current = ???
        
        % TODO: perform one step update and get the next state and
        % reward (perform_one_step())
        [r, s_next] = ???
        
        s_current = s_next;
        actions = [actions, a_current];

        running_reward = running_reward + r;
        
        % Visualisation of the grid
        grid_copy = grid;
        grid_copy(s_current(1), s_current(2)) = 'R'
        action_names = ['S', 'N', 'E', 'W', 'P', 'D'];
        disp(['Action: ', action_names(a_current)]);
             
        
        % Terminate the episode once succ. drop down reward was
            % observed
        if r==20 
            disp('Successfully dropped the object')
            terminate_episode = 1;
        end

        steps_counter = steps_counter + 1;


end



