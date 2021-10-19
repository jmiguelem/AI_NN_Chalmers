function Qpp=Dynamic_robot1DOFV(u)
%Dynamic model of 1 degree of freedom (DOF) robot (pendulum)
%   u: vector of input arguments (defined by the simulink model)
% Qpp: joint acceleration of pendulum
% DO NOT CHANGE THIS FUNCTION

%Joint Position
q=u(1);

%Joint Velocity
qp=u(2);

%Kinematic Parameter
l=u(3);

%Dynamic Parameter
m=u(4);

% Inertia Parameter
I=u(5);


%Viscous Friction Matrix
Beta(1,1)=u(8);

%Directions of the Gravity Vector
gx=u(9);
gy=u(10);

%Joint Position Vector
Q=q;

%Joint Velocity Vector
Qp=qp;

%Inertia Matrix
M(1,1)=l^2*m + I;

%Gravitational Torques Vector
G(1,1)=l*m*(gy*u(6)*cos(q) - gx*u(6)*sin(q));

% Control
Tau=u(12);

% Direct dynamic model
Qpp=(M)\(Tau-G-Beta*Qp);
