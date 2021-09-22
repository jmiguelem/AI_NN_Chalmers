%% setup environment & calls q learning algorithm, plots the results and applies q table to specific setup
clear all;
clc;

%% Robo Butler %%
% There are four designated locations in the grid world indicated by:
% A, B, C, D. 
% When the episode starts, the robot starts off at a random square.
% Its goal is to pick up an object at a random location
% and deliver it to a destination (either A, B, C or D). 
% Once the object is dropped off, the episode ends.

        
% Actions:
% There are 6 discrete deterministic actions:
% - 0: move south
% - 1: move north
% - 2: move east 
% - 3: move west 
% - 4: pickup passenger
% - 5: dropoff passenger
% 

% Rewards: 
% There is a default per-step reward of -1,
% except for delivering the passenger, which is +20,
% or executing "pickup" and "drop-off" actions illegally, which is -10.


%% 1. Create a quadratic grid environment
% size of the grid e.g. 6x6
grid_size = 6;
num_actions = 6;
num_obj_pos = 5;
num_goal_pos = 4;
state_params = [grid_size, num_obj_pos, num_goal_pos, num_actions];
% row and col position of obstacles 
obstacles = [1, 3, 3, 3, 4, 4, 5, 6;  % = [obst1_r, obst2_r, obst3_r; 
             3, 1, 2, 3, 5, 6, 2, 2]; %    obst1_c, obst2_c, obst3_c];
goals = [1, 1, 6, 6;
         1, 5, 1, 6];
goals_name = ['A', 'B', 'C', 'D'];


% Grid visualization (not important for the algorithms but could help for
% debugging)
% each cell has either type, E (Empty), O (Obstacle), S (Start), G (Goal)
grid = repmat('E', grid_size, grid_size);
for it = 1:length(obstacles)
    grid(obstacles(1,it), obstacles(2,it)) = 'O';
end
for it = 1:length(goals)
   grid(goals(1,it), goals(2,it)) = goals_name((it));
end

% Set the parameters for the q learning algorithm
num_episodes = 50000;
epsilon = 0.01;
alpha = 0.1;
gamma = 0.9;


%% 2. Q-Learning
% Set the parameters for the q-learning algorithm
[q_table, rewards, q_diffs] = q_learning(state_params, obstacles, goals, num_episodes, epsilon, alpha, gamma);

%% 3. Plotting
% code which generates the mean over mean_range values
mean_diffs = [];
mean_range = 100;
for i = 1:mean_range:length(rewards)-mean_range
    mean_diffs = [mean_diffs, mean(q_diffs(i:i+mean_range))];
end
% TODO: plot rewards and mean rewards

mean_reward = figure(1);
plot(mean_diffs);
xlabel('Episode');
ylabel('Mean of diffs in Q');
title('Average Max Q Diff');


%% 4. Testing
% define start position of the robot and the environment
% e.g. robot is located at [5, 5], the object is locates at 'A' = 1 and the
% goal is 'D' = 4
s_start = [5, 5, 1, 4];
% steps = test_q_table(q_table, s_start, goals, grid, state_params, obstacles);