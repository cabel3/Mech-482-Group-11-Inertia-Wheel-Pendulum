%% Mech 482, HW 3 Problem 2, Christopher Abel

clear all, close all, clc;

m1 = .05975; % kg; mass of pendulum arm
L1 = .117; % meter; length of pendulum arm to wheel
Lc = L1/2;  % meter; center of mass of pendulum arm
I1 = .000048463; % kg*m^2; Moment of inertia of pendulum arm
m2 = .058; % kg; mass of wheel
I2 = .0000076242; % kg*m^2; Moment of inertia of wheel
mBar = m1*Lc + m2*L1; % Substitution variable to make calculation easier
g = 9.81; % m/s^2; gravity

Q = m1*Lc^2 + m2*L1^2 + I1; % Substitution variable to make constructing the matrices easier

A = [0 1 0 0; mBar*g/Q 0 0 0; 0 0 0 1; -mBar*g/Q 0 0 0]; % State-Space Representation
B = [0; -1/Q; 0; (1+I2/Q)/I2];
C = [1 0 0 0];
D = zeros(size(C,1),1);

%%

% Definition of the system in state space
sys_ss = ss(A,B,C,D)


%% Solving sys and plotting its numerical dynamic simulation (response)
t = 0:0.01:.1;                 % Time span
u = ones(size(t,2),1);    % Step input
% u = sin(t);
x0 = [0 0 0 0];                  % Initial conditions
[Y,T,X] = lsim(sys_ss,u,t,x0);

% Plotting the result
figure; hold on;
plot(t,u,'r');
plot(T,Y,'m-.','linewidth',2);
% axis([-1.5 t(end) -.5 1.5])
legend('reference','response');