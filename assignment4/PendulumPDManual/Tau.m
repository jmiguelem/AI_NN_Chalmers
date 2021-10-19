function tau_output = Tau(u)
%TAU PD control for 1 degree of freedom robot (Pendulum)
%u: vector of input arguments (defined by the simulink model)


%Joint Position
q=u(1);

%Joint Velocity
qp=u(2);

% TODO IN SIMULINK: Manually set the Control Gains until a good pendulum behavior is
% achieved. You need to change the gains in the simulink model, and NOT here.
% Proportional gain
Kp=u(12);  % CHANGE Kp in SIMULINK
% Differentiation gain
Kd=u(13);  % CHANGE Kd in SIMULINK

% Desired joint position
qd=deg2rad(u(14));

% Regulation then zero
qdp=0;

% TODO: Joint position error
Dq= qd - q;

% TODO: Joint velocity error
Dqp= qdp - qp;

% TODO: Implement a PD controller using Dq, Dqp and gains (Kp, Kd)
tau = Dq * Kp + Dqp * Kd;

%output
tau_output=[tau;Dq];

end

