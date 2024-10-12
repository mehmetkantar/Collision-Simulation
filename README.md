# Collision-Simulation
Simulation Details
Random Disk Placement: Disks are randomly placed within a specified rectangular domain, with the number of disks (N) being randomly chosen between 2 and 8.

Disk Properties:

Radii of disks are randomly assigned between 0.1 m and 0.3 m.
Masses are calculated based on their areas.
Initial velocity components for each disk are randomly selected between 10 m/s and 20 m/s.
Collision Handling:

Collisions between disks and the walls of the rectangular domain are treated as elastic, with the disks reversing their normal velocity component upon impact.
The simulation runs from t=0 to 𝑡=1 seconds.
Conservation of Momentum
The simulation incorporates principles from the field of dynamics to ensure accurate collision outcomes. The calculations take into account the "line of impact" and the "plane of impact" based on the angle of rotation between the xy and x'y' coordinate systems.

For detailed understanding, refer to:

Engineering Mechanics, Dynamics
Author: R. C. Hibbeler
Chapter 15: Kinetics of a Particle: Impulse and Momentum
Section 15.4: Oblique Impact
