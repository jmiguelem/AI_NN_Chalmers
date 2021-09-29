B=[1 0 0;
   0 1 0;
   0 0 1];

nO = [.9 ;.1 ;.1 ];

red = norm(B(:, 1) - nO)
green = norm(B(:, 2) - nO)
blue = norm(B(:, 3) - nO)

[value, ind] = min([red green blue]);
