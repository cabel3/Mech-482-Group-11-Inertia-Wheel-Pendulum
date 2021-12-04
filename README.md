# Mech-482-Group-11-Inertia-Wheel-Pendulum
# Table of Contents
1. [Introduction](Introduction "goto Introduction")
2. [Objectives](Objectives "goto Objectives")
3. [Derivation](Derivation "goto Derivation")
4. [MATLAB Code](MATLAB Code "goto MATLAB Code")
5. [Model Simulation](Model Simulation "goto Model Simulation")
6. [Results](Results "goto Results")

# Introduction
The Inertia Wheel Pendulum is an underactuated 2-DoF system consisting of a pendulum arm connected to an inertal mass, the wheel. The wheel is actuated by a single servor motor, which exerts a torque on the wheel. The system is controlled by using the motor to add or remove angular energy and momentum to the system. 

Control of the Inertia Wheel Pendulum consists of 2 phases: the swing-up, and maintaing an inverted position. Because the mathematical model of the swing-up phase is non-linear, it is considered out of the scope of this project. Instead, the pendulum will begin in the inverted postion, and maintain that position when disturbed by a small force.

# Objectives
