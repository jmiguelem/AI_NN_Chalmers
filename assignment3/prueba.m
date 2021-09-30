Xt = [1 0 0 1 ; 0 0 1 1; 1 0 1 1]
[r,c] = size(Xt);
bias = ones([1 c]);
Xt= [bias; Xt]

r = size(Xt);
r(2)