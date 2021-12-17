# Mech-482-Group-11-Inertia-Wheel-Pendulum

                         Project Members: Christopher Abel, Brendan Boozer, Spencer Monroe

                                          California State University, Chico

                    College of Mechanical and Mechatronic Engineering and Advance Manufacturing

                                          Inverted Inertia Wheel Pendulum

                                                     Fall 2021

# Table of Contents
1. Introduction
2. Objectives
3. Derivation
4. MATLAB Code
5. Simulink Diagram
6. Coppelia Simulation
7. System Simulation
8. Results and Conclusion
9. References
10. Appendices

# 1. Introduction
The Inertia Wheel Pendulum is an underactuated 2-DoF system consisting of a pendulum arm connected to an inertal mass, the wheel. The wheel is actuated by a single servo motor, which exerts a torque on the wheel. The system is controlled by using the motor to add or remove angular energy and momentum to the system. 

Control of the Inertia Wheel Pendulum consists of 2 phases: the swing-up, and maintaining an inverted position. Because the mathematical model of the swing-up phase is non-linear, it is considered out of the scope of this project. Instead, the pendulum will begin in the inverted postion, and maintain that position when disturbed by a small force.

# 2. Objectives
* To derive mathmatical model of system via Lagrangian eqns of motion
* To convert that mathmatical model into a State-Space Representation
* To create a Coppelia simulation that models our system
* To create a Simulink program to control the Coppelia model
* To arrive at a functional control scheme that is able to bring the pendulum back to inverted position after small deflection

# 3. Derivation
# Math Model
To begin, a simple model of the system was created.

![Model and EL Eqns](https://github.com/cabel3/Mech-482-Group-11-Inertia-Wheel-Pendulum/blob/main/Photos/Derivation/Diagram%20and%20lagrangian%20eqns%20of%20motion.png)
<p align="center"><b>Figure 1:</b> Simple Model and Euler-Lagrange Equations</p>

For clarity, the parameters of the system will now be defined:
* m_1 - mass of pendulum arm
* I_1 - moment of inertia of pendulum arm
* l_c - distance from pivot to center of mass of pendulum
* m_2 - mass of reaction wheel
* I_2 - moment of inertia of reaction wheel
* l_1 - length of pendlum arm, or distance of wheel from pivot
* q_1 - angle of pendulum arm relative to positive vertical
* q_1_dot - angluar velocity of pendulum arm
* q_1_dot_dot - angluar acceleration of pendulum arm
* q_2 - angle of wheel relative to pendulum arm
* q_2_dot - angular velocity of reaction wheel
* q_2_dot_dot - angluar acceleration of reaction wheel
* tau - torque applied to reaction wheel by motor

Because this system has two degrees of freedom, q_1 for the angle of the pendulum arm and q_2 for the angle of the wheel, two Euler-Lagrange equations are needed to describe the motion of this system. The only force acting on the system is the torque on the wheel applied by a motor.

To complete the above equations of motion, the lagrangian of the system must be found. The lagrangian is defined as the difference between the kinetic and potential energies of the system.

<p align="center">
  <img src="https://github.com/cabel3/Mech-482-Group-11-Inertia-Wheel-Pendulum/blob/main/Photos/Derivation/lagrangian.png" />
</p>
<p align="center"><b>Figure 2:</b> Lagrangian</p>

The kinetic energies of the pendulum and wheel must now be found, with the subscript 1 indicating the pendulum arm and the subscript 2 indicating the wheel.

![Kinetic Energy](https://github.com/cabel3/Mech-482-Group-11-Inertia-Wheel-Pendulum/blob/main/Photos/Derivation/Kinetic%20energies.png)
<p align="center"><b>Figure 3:</b> Kinetic Energies of System</p>

The total angular velocity of the wheel is the sum of the angular velocity of the pendulum and the relative angular velocity of the wheel.

The potential energy of the system must now by found. The datum is defined to be coincident with the main pivot of the pendulum, and parallel with the ground. To make use of the small angle approximation later, the angle of the pendlum is relative to positive vertical.

<p align="center">
  <img src="https://github.com/cabel3/Mech-482-Group-11-Inertia-Wheel-Pendulum/blob/main/Photos/Derivation/Potential%20Energy.png" />
</p>
<p align="center"><b>Figure 4:</b> Potential Energies of System</p>

The kinetic and potential energies can now be substituted into the lagrangian.

<p align="center">
  <img src="https://github.com/cabel3/Mech-482-Group-11-Inertia-Wheel-Pendulum/blob/main/Photos/Derivation/Filled%20out%20lagrangian.png" />
</p>
<p align="center"><b>Figure 5:</b> Substitution into Lagrangian</p>

The partial differentials of the lagrangian must now be taken to form the equations of motion of the system.

<p align="center">
  <img src="https://github.com/cabel3/Mech-482-Group-11-Inertia-Wheel-Pendulum/blob/main/Photos/Derivation/Partial%20derivatives.png" />
</p>
<p align="center"><b>Figure 6:</b> Partial Differentials of Lagrangian</p>

Now, the partial derivatives can be substitued into their places in the Euler-Lagrange equations of motion.

<p align="center">
  <img src="https://github.com/cabel3/Mech-482-Group-11-Inertia-Wheel-Pendulum/blob/main/Photos/Derivation/eqns%20of%20motion.png" />
</p>
<p align="center"><b>Figure 7:</b> Non-linear Equations of Motion</p>

By using the small-angle aproximation, the -sin(q_1) term in the first equation can be reduced to -q_1, allowing the system to be linearized.

<p align="center">
  <img src="https://github.com/cabel3/Mech-482-Group-11-Inertia-Wheel-Pendulum/blob/main/Photos/Derivation/math%20model.png" />
</p>
<p align="center"><b>Figure 8:</b> Linearized Equations of Motion</p>

# State-Space Representation
The math model of the system must be converted into a state-space representation in order to devlop a control scheme. To do this, the equations of motion must be solved for the highest order terms, q_1_dot_dot and q_2_dot_dot.

<p align="center">
  <img src="https://github.com/cabel3/Mech-482-Group-11-Inertia-Wheel-Pendulum/blob/main/Photos/Derivation/reaaranging%20to%20get%20SSR.png" />
</p>
<p align="center"><b>Figure 9:</b> Rearranging Math Model to get SSR</p>

Finally, substitution of Q gets the final state-space representation of the system.

<p align="center">
  <img src="https://github.com/cabel3/Mech-482-Group-11-Inertia-Wheel-Pendulum/blob/main/Photos/Derivation/SSR.png" />
</p>
<p align="center"><b>Figure 10:</b> State-Space Representation</p>

# 4. MATLAB Code

Looking for inspiration, a youtube video [3] was found that used a cart with a pendulum attached that utaiized both Matlab and Simulink. This was a helpful roadmap that outlined the basics of how to utilize Matlab and Simulink together, but ultimatly skipped some steps. The Matlab Code generated from that tutorial can be seen below. 
<p align="center">
  <img src="https://github.com/cabel3/Mech-482-Group-11-Inertia-Wheel-Pendulum/blob/main/MATLAB%2C%20Simulink%2C%20Coppelia/Matlab%20Code/mymodelmatlab'.JPG" />
</p>
<p align="center"><b>Figure 12:</b> Matlab Attempt Using Pendulm Cart Tutorial</p>


With newfound knowledge of Matlab and Simulink together, many attempts and renditions of both the code side, and the block diagram side were performed to try and yeild a working result. Many different methods were also employed in order to make a working rendition of both softwares but nothing was working all together at the same time. 
<p align="center">
  <img src="https://github.com/cabel3/Mech-482-Group-11-Inertia-Wheel-Pendulum/blob/main/MATLAB%2C%20Simulink%2C%20Coppelia/Matlab%20Code/try4matlab.JPG" />
</p>
<p align="center"><b>Figure 11:</b> Matlab Attempt Using State Space</p>




# 5. Simulink Diagram

Utilizing the base provided by the professor, and a controller created by following the tutorial, this Simulink module was created. Unfortunately it never quite performed as hoped, and many many renditions and attempts were made to utilize this system. 

<p align="center">
  <img src="https://github.com/cabel3/Mech-482-Group-11-Inertia-Wheel-Pendulum/blob/main/MATLAB%2C%20Simulink%2C%20Coppelia/Simulink/try4sim.JPG" />
</p>
<p align="center"><b>Figure 13:</b> Simulink Attempt Using In Class Files As Base</p>

This is an image from inside the controller pictured in Figure 13

<p align="center">
  <img src="https://github.com/cabel3/Mech-482-Group-11-Inertia-Wheel-Pendulum/blob/main/MATLAB%2C%20Simulink%2C%20Coppelia/Simulink/try4controller.JPG" />
</p>
<p align="center"><b>Figure 14:</b> Simulink Controller Attempt</p>

This system was generated by following the tutorial from the youtube video on how to make a system that performed in both Matlab and Simulink. It was first used by following the video, and then later adapted to the class project as a hopeful way of completing the process. 

<p align="center">
  <img src="https://github.com/cabel3/Mech-482-Group-11-Inertia-Wheel-Pendulum/blob/main/MATLAB%2C%20Simulink%2C%20Coppelia/Simulink/mymodeloverview.JPG" />
</p>
<p align="center"><b>Figure 15:</b> Simulink Controller Attempt Overview From Tutorial</p>

This is a view inside the system portion of the Simulink.

<p align="center">
  <img src="https://github.com/cabel3/Mech-482-Group-11-Inertia-Wheel-Pendulum/blob/main/MATLAB%2C%20Simulink%2C%20Coppelia/Simulink/mymodelsystem.JPG" />
</p>
<p align="center"><b>Figure 16:</b> Simulink System Attempt From Tutorial</p>

This is a view inside the Controller section of the Simulink. 

<p align="center">
  <img src="https://github.com/cabel3/Mech-482-Group-11-Inertia-Wheel-Pendulum/blob/main/MATLAB%2C%20Simulink%2C%20Coppelia/Simulink/mymodelcontroller.JPG" />
</p>
<p align="center"><b>Figure 17</b> Simulink Controller Attempt From Tutorial </p>

# 6. Coppelia Simulation

To simulates the system as if it were actually physical, a scene of the sytem was created in Coppelia.

<p align="center">
  <img src="https://github.com/cabel3/Mech-482-Group-11-Inertia-Wheel-Pendulum/blob/main/MATLAB%2C%20Simulink%2C%20Coppelia/Coppelia/Swingin.gif" />
</p>
<p align="center"><b>Figure 18</b> Animation of Coppelia Inertia Pendulum </p>

The Coppelia model was created by linking simple objects with joints. A joint attaches the pendulum arm to the bass, and another joint connects ther eaction wheel to the pendulum arm. The animation here is to establish that a viable Coppelia model was made.

# 7. System Simulation


# 8. Results and Conclusion

While it was possible to establish a link between MATLAB and Coppelia, we were not able to get actual signals to be sent from or to Coppelia. With more time and troubleshooting, it is possible to control the Coppelia model via signals sent from MATLAB, and to have a controler in MATLAB respond accordingly to the measurements it receives from Coppelia.

# 9. References
[1] Hernández-Guzmán Victor Manuel, &amp; Silva-Ortigoza Ramón. (2019). Automatic control with experiments. Springer. 

[2] Brevik, P. (2017). Two-Axis Reaction Wheel Inverted Pendulum.

[3] Turnwald, Alen. “State Space Control for the Pendulum-Cart System: A Short Tutorial on Using MATLAB® and Simulink®.” YouTube, Technical University of Kaiserslautern, 7 Feb.      2018, https://www.youtube.com/watch?v=hAI8Ag3bzeE. 
