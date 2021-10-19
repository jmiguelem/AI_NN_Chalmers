function tau_output = Tau(u)
%TAU PD control for 1 degree of freedom robot (Pendulum)
%u: vector of input arguments (defined by the simulink model)


%Joint Position
q=u(1);

%Joint Velocity
qp=u(2);

% Control Gains
% Proportional gain
Kp=u(13);
% Differentiation gain
Kd=u(14);

% Desired joint position
qd=deg2rad(u(15));

% Regulation then zero
qdp=0;

% TODO: Joint position error
Dq=???;

% TODO: Joint velocity error
Dqp=???;

% TODO: Implement a PD controller using Dq, Dqp and gains (Kp, Kd)
tau=???;

%output
tau_output=[tau;Dq];

end

