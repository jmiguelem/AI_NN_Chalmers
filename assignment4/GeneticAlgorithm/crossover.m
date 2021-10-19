function child = crossover(ind1,ind2)
    %%TODO: Make a crossover of the individuals' gains 'p' and 'd'
    parents=[ind1,ind2];
    %Randomly decide from which parent the child will inherit the
    %properties, e.g. gain values.
   
    %The crossover can be at the level of gain values, e.g.
    %child.p=value_generated_with_the_parents  
    child.p=parents[randi(2)](1);  % float value
    child.d=parents[randi(2)](2);  % float value
end