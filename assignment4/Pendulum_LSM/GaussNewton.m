function a = GaussNewton(database) 
% An iterative method to solve non-linear LSM problem

% a: the last value vector for [m, l, beta] when iteration stops

% RUN: GaussNewton("LSM_data.mat")

% load x and y
db = load(database);

% x: matrix, each column vector contains [q, qp, qpp] 
% from an experiment with pendulum dynamics model
x = db.x;
% y: column vector as input, it contains real tau values 
% from an experiment with pendulum dynamics model
y = db.y;

tol = 0.0001;  %--set a tolerance value for the accuracy, DO NOT CHANGE IT

% TODO: Try with different learning rate lamda, e.g., 0.5, 0.2, 0.1, 0.05, 0.001 ...
lamda = 0.05;  %--set a learning rate for incrementing 'a'
a = [0.01, 0.28, 0.12];  %-- set initial guess for [m, l, beta]. You're free to set a new inital guess or just leave it as it is

% TODO: Try with different iteration numbers iter_max, e.g., 30, 40, 50 ,70, 80, 100, 150 so on ...
iter_max = 200;  %--set maximum iteration number to run for
n = length(x);  %--number of data samples, each sample contains [q, qp, qpp]   

I = 0.04;  %-- inertial coefficient
g = 9.81;  %-- gravity acceleration

q = x(:, 1);  %-- joint position
qp = x(:, 2);  %-- joint velocity
qpp = x(:, 3);  %-- joint acceleration

% starting the iteration process
for iter = 1:iter_max
    m = a(1);  %-- dynamic coefficient
    l = a(2);  %-- kinematic coefficient
    beta = a(3);  %-- viscous friction coefficient 
    for i = 1:n
		% predicted tau value, you need 'qpp(i)', 'qp(i)' and 'q(i)'
        f(i) = (m*l^2+I)*qpp(i) + beta*qp(i) + m*g*l*sin(q(i));
        
		%% A should be a n x 3 matrix, n stands for the number of samples, 
        % each row contains a partial derivative of tau w.r.t --> m, l and beta
        % calculate partial derivative of tau (CHECK THE DOCUMENT OF ASSIGNMENT 4 FOR what tau is) w.r.t. 'm', you need given 'qpp(i)' and 'q(i)'
		A(i, 1) = l^2*qpp(i) + g*l*sin(q(i));
		
		% calculate partial derivative of tau w.r.t. 'l', you need 'qpp(i)' and 'q(i)'
        A(i, 2) = 2*m*l*qpp(i) + m*g*sin(q(i));
		
		% calculate partial derivative of tau w.r.t. 'beta', you need 'qp(i)'
        A(i, 3) = qp(i);
		
		% calculate residual given real tau value 'y(i)' and predicted tau value 'f(i)'
        e(i) = y(i) - f(i);
    end
	
	% calculate increment 'Delta_a' for 'a': [m, l, beta]
    Delta_a = inv(A'*A)*A'.*e;
	% display 
	fprintf(1,'iteration: %d\n', iter);
    fprintf(1,'m, l, beta: \n');
    disp(a)
    fprintf(1,'increment for a: \n');
    disp([Delta_a'])
	
	% calculate new approximation for 'a' given 'Delta_a'
    a = a + lamda*Delta_a';
	
	% if less than tolerance break iteration
    % IF NOT LESS THAN TOLERANCE, that means your algorithm doesn't
    % converge well
    if (abs(Delta_a(1)) < tol && abs(Delta_a(2)) < tol && abs(Delta_a(3)) < tol)
        disp("Iteration has converged")
        break
        
    end
end

    
    