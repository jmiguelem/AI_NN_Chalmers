function val = ga_eval(ind)
    
	% Save the gains of the individual in a variable sim_PD 
    % for later simulation 
    % This variable is shared with the simulink model, see 
    % Pendulum/DSimulator_robot1DOFV.slx
    % The simulink will use thoes values and run
    sim_PD=[0,ind.p,ind.d];
    
    % The function below stores the variable sim_PD in the workspace. 
    % Then, the simulink will be able to use it.
    assignin('base','sim_PD',sim_PD);
    
    %Run the pendulum simulation in simulink for 10 seconds
    sim('Pendulum/DSimulator_robot1DOFV.slx',10)
    
    % TODO: implement a cost function for computing fitness value of the individual
    % Here you need to get the fitness value from the simulation variable
    %"sim_error"
    % Remember: sim_error variable is a timeseries with properties:
    % sim_error.Time - Here is the time in a n x 1 array where n is the number of
    % samples
    % sim.error.Data - Here is the data in a n x 1 array
    % Use this variable to compute your fitness evaluation function, e.g. using
    % sim_error.Data(i)
   
    % Define a cost function using the values from sim_error. This cost function 
    % must return high value when the gains from an individual generate a good 
    % behavior for the pendulum
    
    % sim_error is an array with all the integrals of the position error
      
    % val must be a single and negative float
    val=?????;
    
    
end
