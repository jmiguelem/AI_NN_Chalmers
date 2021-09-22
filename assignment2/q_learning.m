function [q_table, rewards, q_diffs] = q_learning(state_params, obstacles, goals, num_episodes, epsilon, alpha, gamma) 
%% FUNCTIONALITY: implementation of the Q-learning algorithm 
% Base the implementation of the functions which you have implemented in
% the previous subtasks.
%% INPUT(1): state_params: [grid_size, num_obj_pos, num_goal_pos, num_actions] 
% type --> vector: [int, int, int, int]
%% INPUT(2): obstacle (list of obstacle positions)
% type --> matrix
% e.g. obstacle = [3, 3, 4;  % = [obst1_r, obst2_r, obst3_r; 
%                  2, 3, 3]; %    obst1_c, obst2_c, obst3_c];
%% INPUT(3): goals (position of 'A', 'B', 'C', 'D')
% e.g. goals = [1, 1, 10, 10;  = [Arow, Brow, Crow, Drow;
%               1, 9, 10,  1];    Acol, Bcol, Ccol, Dcol]
%% INPUT(4): num_episodes (number of episodes performed during the training)
% type --> int
%% INPUT(5): epsilon (chance of exploration)
% type --> float value between [0, 1]
%% INPUT(6): alpha (learning rate)
% type --> float value between [0, 1]
%% INPUT(7): gamma (discount factor)
% type --> float value between [0, 1]
%% OUTPUT(1): q_table ( Q(s,a) )
% type --> 2D - matrix (size: states x actions)
%% OUTPUT(2): rewards (list of all final episode rewards)
% type --> array of size [1xnum_episodes]
% Sum up the collected step rewards during each episode. After the episode
% has ended, push the accumulated episode reward into the rewards vector.
% Start from zero in each new episode.
%% OUTPUT(3): q_diffs (list of maximal element wise difference during q-table update)
% type --> array of size [1xnum_episodes-1]
% After every episode, look what was the largest element wise q-table
% update and add it to the q_diffs list.


%% TODO: Implementation

    %% 1. Init the q_table 
    % TODO:
    q_table = initialize_q_table(state_params); % use initialize_q_table function
    
    rewards = []; % list that will save the episode rewards
    q_diffs = []; % list that will save q-table differences between episodes
    
    %% 2. Perform episodes
    for ep = 1:1:num_episodes
        % randomly init the start state S with help of the
        % initialize_robot()
        % function
        [current_row, current_col, current_obj, current_goal] = initialize_robot(state_params, obstacles); % use the initialize_robot function
        s_current = [current_row, current_col, current_obj, current_goal];
        terminate_episode = 0; % to terminate while loop when episode is finished
        running_reward = 0; % counts the episode reward
        q_old = q_table; % Save q_table from previous episode to calculate the difference
        
        while ~terminate_episode % as long as episode is not terminated
            % TODO: choose an greedily derived action (epsilon_greedy_action())
            a_current = epsilon_greedy_action(q_table, s_current, epsilon, state_params);
            
            % TODO: perform one step update; get the next state and
            % reward (perform_one_step())
            [r, s_next] = perform_one_step(s_current, a_current, goals, state_params, obstacles);
            
            % update q-table
            % Task: 2 (deterministic update rule): update_q_table_det()
            % Task: 6 (non-deterministic update rule): update_q_table_gen()
            q_table = update_q_table_det(q_old, s_current, a_current, r, s_next, gamma, state_params); 
            
            s_current = s_next;
                       
            running_reward = running_reward + r;
            
            % Terminate the episode once succ. drop down reward was
            % observed
            if r==20 
                % disp('Successfully dropped the object')
                terminate_episode = 1;
            end
            
%           % TODO: get biggest difference between q_table elements in
%           consecutive q-tables (between q_table and q_old)
            max_diff = max(abs(q_table-q_old)); % Tip: use the max() and abs() functions () (consult the matlab documentation in case you have questions about its usage)
            q_diffs = [q_diffs, max_diff];
    
        % save episode rewards
        rewards = [rewards, running_reward];
        
        % print out current episode after every 100 episodes during the
        % training
        if mod(ep, 100) == 0
            disp(['Episode: ', int2str(ep)])
        end
    end 
end