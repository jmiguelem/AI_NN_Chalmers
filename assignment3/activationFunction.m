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
        o=net;
        % TODO: define its time derivative (do/dnet)
        siz_o = size(net);
        do=ones(siz_o); 
    case 2
        % TODO: define the sigmoid activation function (o)
        o=(1./(1+exp(-net)));
        % TODO: define its time derivative (do/dnet) 
        do=o.*(1-o);
    case 3
        % TODO: define the tanh activation function (o)
        o=(exp(2*net)-1)./(exp(2*net)+1);
        % TODO: define its time derivative (do/dnet)
        do=1-(o.^2);
end

% HINT 1: Check the dimensions of the input: net. The partial derivative must
% have the same dimension as net's dimension!

% HINT 2: The (.) operator implements an element-wise operation, namely dot product, 
% you need it to complete TODO

