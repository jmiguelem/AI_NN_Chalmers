function [Wi_h,Wh_o,e2,DWi_h,DWh_o] = backwardPropagationv2(Wi_h,Wh_o,xin,H,O,to,eta,alpha,DWi_h_1,DWh_o_1)
%BACKWARDPROPAGATION Backward propagation of errors to update weights
%   Performs the backward propagation to compute the \delta for both layers
%   and generate the DW

% Input:
% Wi_h: Weights (input layer to hidden layer) in prevoius iteration
% Wh_o: Weights (hidden layer to outter layer) in prevoius iteration
% xin: input vector of training sample, with bias x0
% H(:,1) -> estimation of hidden layer value(h)
% H(:,2) -> partial derivative of h wrt net_h
% O(:,1) -> estimation of outter layer value(o)
% O(:,2) -> partial derivative of o wrt net_o
% to: output vector of training sample (this is the real output value, differing from 
% estimated output value O(:,1) by neural network )
% eta: vector of learning rates, eta(1) is learning rate for hidden layer, 
% eta(2) for outter layer
% alpha: vector of momentum gains, alpha(1) for hidden layer, alpha(2) for outter layer
% DWi_h_1: Delta weights (input layer to hidden layer) in prevoius iteration
% DWh_o_1: Delta weights (hidden layer to outter layer) in prevoius iteration
% h_bias: bias value for the hidden layer, can be 1 or 0

% Output:
% Wi_h: Updated weights (input layer to hidden layer)
% Wh_o: Updated Weights (hidden layer to outter layer)
% e2: square error
% DWi_h: Delta weights (input layer to hidden layer) in current iteration
% DWh_o: Delta weights (hidden layer to outter layer) in current iteration

%hidden layer output
h=H(:,1); % (n_h X 1)
dh_dnet=H(:,2); % (n_h X 1)


%outter layer output
o=O(:,1); % (n_o X 1)
do_dnet=O(:,2); % (n_o X 1)


% Backward propagation of errors (out->hidden)
%(n_o X 1)=(n_o X 1)-(n_o X 1)

% TODO: define the estimation error in outter layer
e=?????

%(n_o X 1) = (n_o X 1).*(n_o X 1)
% TODO: Compute \delta_k
d_k=??

%Backward propagation of errors (hidden->input)
%(n_h X 1) = (n_h X 1).*(n_h X n_o)*(n_o X 1)
% TODO: Compute \delta_h
d_h=??
  
%delta output weights (hidden->out)
%(n_h X n_o)=((1 X 1)*(n_o X 1)*(1 X n_h))'+ (1 X 1)*(n_h X n_o)
%TODO: Compute the increment for Wh_o (outter layer weights)
% Remember to use the learning rate and the momemtum gain 
DWh_o=??

%delta hidden weights (input->hidden)
%(n_i X n_h)=((1 X 1)*(n_h X 1)*(1 X n_i))'+ (1 X 1)*(n_i X n_h)
%TODO: Compute the increment for Wi_h (hidden layer weights)
% Remember to use the learning rate and the momemtum gain 
DWi_h=??

%Update output Weights (hidden->out)
% TODO: Update outter weights
Wh_o=Wh_o+??

%Update hidden Weights (input->hidden)
% TODO: Update hidden weights
Wi_h=Wi_h+??

%Error
% The (.) operator implements an operation element-wise, e.g.,
% e is a vector of size n_o X 1, then e.^2 = [e(1)^2, e(2)^2,...,e(n_o)^2]
e2=e.^2;

end

