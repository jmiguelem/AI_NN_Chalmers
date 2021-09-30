function [O,H] = forwardPropagationv2(Wi_h,Wh_o,xin,af1,af2)
%FORWARDPROPAGATION Computes the output of the hidden and outter layers
% Input:
% Wi_h: Hidden layer weights i-->h R^{n_i X n_h}
% Wh_o: Outter layer weights h-->o R^{n_h X n_o}
% xin: input vector with bias x0 --> R^{n_i X 1}
% af1: activation function type for hidden layer
% af2: activation function type for outter layer
%Output:
% H(:,1) -> estimation of hidden layer value(h)
% H(:,2) -> partial derivative of h wrt net_h
% O(:,1) -> estimation of outter layer value(o)
% O(:,2) -> partial derivative of o wrt net_o

% Hidden nodes h (input->hidden)
% (n_h X 1)   (n_h X n_i)*(n_i X 1)
% TODO: Compute the net_h
net_h=Wi_h'*xin;  

%n_h X 1  n_h X 1
% h     dh_dnet
% TODO: Complete this function
[H(:,1),H(:,2)]=activationFunction(net_h, af1);

%Adding bias to the hidden layer
H(1,1)=1;

%Output nodes o (hidden->out) and partial derivative of o wrt net
% (n_o X 1)  (n_o X n_h)*(n_h X 1)
% TODO: Compute net_o
net_o=Wh_o'*H(:,1);



%(n_o X 1) (n_o X 1)
% o     do_dnet
[O(:,1),O(:,2)]=activationFunction(net_o,af2);

end