function [ind1,ind2] = random_selection(population,fitness)
    % Choose two individuals from the population according to their
    % fitness. 
    % Bigger fitness values increase the probability of being chosen.

    % TODO: You need to use matlab built-in function 'randsample()' to 
    % randomly select two individuals, where the probability to be selected depends on
    % the fitness value, i.e. an individual with good score should have more changes to be selected. 
    % This will make the population evolve to a better population
    fitness = abs(fitness - min(fitness));
    IND=randsample(population, 2, true, fitness);
    ind1=IND(1);
    ind2=IND(2);
end