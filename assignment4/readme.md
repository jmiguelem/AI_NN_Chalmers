# Implement and test the q-learning algorithm

## Files

- setup.m: script that sets up the environment & calls q learning algorithm, plots the results and applies q table to specific setup
- q_learning.m: contains the implementation of the q-learning algorithm
- initialize_q_table.m: initializes the q table with zeros
- initialize_robot.m: initializes robot at a random but valid grid position
- epsilon_greedy_action.m: function that chooses the next action in greedy fashion
- perform_one_step.m: perform the previously determined action, return next state and the observed reward
- update_q_table_det.m: implements deterministic update rule
- update_q_table_gen.m: implements non-deterministic update rule
- test_q_table.m: use the learned q-table to guide the robot for a specific test scenario
