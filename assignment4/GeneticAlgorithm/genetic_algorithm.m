function [bestInd,bestFit]=genetic_algorithm()

    % The dir "Pendulum" contains the simulink that we will use to
    % evaluate each individual of the pupulation in our GA.
    % we need to add it to the matlab path, then the ga_eval function can 
    % find the simulink
    addpath('Pendulum');

    %TODO: Define the maximum population
    maxPop=5;
    %TODO: Define the number of generations
    generations=10;
    
    % First, create an initial random population
    % population will be an array of struct 'individual'
    population=[];

    % iterate to the population number. Create the initial population with 
    % random values for the p and d gains.
    for i = 1:maxPop
        % The individuals are structs containing gains p and d.
        % The structs variables are defined using ".", e.g.
        % individual.p=1, individual.d=2, will create a
        % structure 'individual' with two variables.
        % Example:
        % individual.p=rand()*maxValue;
        % individual.d=rand()*maxValue;
        % TODO: You need to define the maximum value for each gain
        maxValue=500;
        individual.p = rand() * maxValue;
        individual.d = rand() * maxValue;
        
        % append the newly created individual to the array 'population'
        population=[population individual];
    end
    
    % Second, iterate through the number of generations
    for gen = 1:generations
        % Container for the new population
        % In each generation we will create a new population which evolves
        % using the GA
        newPop=[];
        % Container for the fitness values (results of evaluating the
        % individuals in the model.
        fitnessL=[];
        
        fprintf(1,"-----Generation: %d\n",gen);
        
        % Get the fitness value of each individual
        % Evaluate each individual, i.e. each Kp, Kd in the model and
        % calculate the error (fitness value)
        % Iterate through the size of the population
        for i = 1:maxPop
            
            disp(i); %--> disp(i) is equivalent to fprintf(1,'%d\n',i);
            fprintf(1,'Individual: \n');
            disp(population(i)); % --> it can be used with structures!
            
            % Run the model using each individual values (p,d), the model
            % will calculate an error function and return it. This value
            % will be used as fitness value.
            fitness=ga_eval(population(i));
            fprintf(1,'Fitness Value: \n');
            disp(fitness);
            % Append the fitness value of the individual(i) to the array
            % The population and fitnessL array will have the same order,
            % i.e. the fitness value of the individual 'population(i)' is
            % fitnessL(i)
            fitnessL=[fitnessL fitness];
        end
        %Choose the individual with the best fitness and add it to the new
        %population
        % The max function returns the max value found in the array, and
        % its index
        [bestFit,bestIdx]=max(fitnessL);
        % Get the best individual using its index
        bestInd=population(bestIdx);
        % Add the best individual to the new population list
        % In this way, the new population will always have the best
        % individual found during the generations
        newPop=[newPop bestInd];
        
        % Loop until you have created a new population of size = maxPop
        while size(newPop,2)<maxPop
            %Choose two individuals from the population according to their
            %fitness. You need to add selection propabilities according to
            %the fitness value, i.e. an individual(i) with higher fitness
            %value should have higher probability (chance) to be selected
            %than an individual(j) with lower fitness value
            [ind1,ind2]=random_selection(population,fitnessL);
            
            
            % Using the randomly selected individuals, perform the
            % crossover between them
            child=crossover(ind1,ind2);
            
            %TODO: Define a mutation probability between [0-1]
            mutP=0.5;
            
            %randomly execute the mutation, e.g. if rand() is lower than the
            %given threshold then mutate child.
            if rand()<mutP
                child=mutate(child);
            end
            
            %Add the child to the new population
            newPop=[newPop child];
        end
        population = newPop;
    
    end
  

end