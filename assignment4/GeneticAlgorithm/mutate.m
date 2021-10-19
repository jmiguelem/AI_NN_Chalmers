function newInd = mutate(ind)

    % TODO: implement a mutation criteria for the gain values of the individual
    % ind
    crit = randn;
    
    newInd.p=ind + crit; %TODO: use a mutation criteria
    % Make sure that the gains are always positive
    if newInd.p < 0
        newInd.p=0.001;
    end
    newInd.d=ind + crit; %TODO: use a mutation criteria
    if newInd.d < 0
        newInd.d=0.001;
    end
end