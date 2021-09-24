function [o, do] = activationFunction(net, type)
%ACTIVATIONFUNCTION Activation function for Perceptron
% net: network value, usually w'*x or (w'*h), where w \in R^{n_{in} \times n_{out}} is
% a matrix of network weights and x \in R^{n_{in}} is the vector of input features
% type: type of activation function, 1: linear, 2: sigmoid, 3: tanh
% o: activation function output value \in R^{n_{out}}
% do: partial derivative of o wrt net (do/dnet) 

switch type
    case 1
        % TODO: define the linear activation function (o)
        o=??
        % TODO: define its time derivative (do/dnet)
        do=??
    case 2
        % TODO: define the sigmoid activation function (o)
        o=??
        % TODO: define its time derivative (do/dnet) 
        do=??
    case 3
        % TODO: define the tanh activation function (o)
        o=??
        % TODO: define its time derivative (do/dnet)
        do=??
end

% HINT 1: Check the dimensions of the input: net. The partial derivative must
% have the same dimension as net's dimension!

% HINT 2: The (.) operator implements an element-wise operation, namely dot product, 
% you need it to complete TODO

