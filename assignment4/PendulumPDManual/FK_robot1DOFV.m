function X=FK_robot1DOFV(u)
%Forward kinematics of a 1 DOF robot (Pendulum)
%u=[q1 l1]: vector of input arguments (defined by the simulink model)
% DO NOT CHANGE THIS FUNCTION
q=u(1);
l=u(2);
X=[l*cos(q);l*sin(q);0];
