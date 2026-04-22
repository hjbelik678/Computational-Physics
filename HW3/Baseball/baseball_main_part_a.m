clear all
close all

N = 200; % time increments

initial_velocity = 110; %m/s
time_step = 0.1; %s
theta = (34:1:40);
wind_velocity = 0;
initial_altitude = 0;

figure
for i = theta
    tradjectory = baseball_tradjectory(i, initial_velocity, wind_velocity, N, time_step, 0);
    plot(tradjectory(:, 1), tradjectory(:, 2))
    hold on   
end
xlabel('x (m)')
ylabel('y (m)')
title('Baseball Tradjectory' )
axis([0 125 0 40]) 
legend('34 degrees','35 degrees','36 degrees','37 degrees','38 degrees','39 degrees', '40 degrees')