clear all
close all

N = 200; % time increments

initial_velocity = 110; %m/s
time_step = 0.1; %s
theta = (27:1:32);
wind_velocity = 0;

figure
for i = theta
    tradjectory = baseball_tradjectory(i, initial_velocity, wind_velocity, N, time_step);
    plot(tradjectory(:, 1), tradjectory(:, 2))
    hold on   
end
xlabel('x (m)')
ylabel('y (m)')
title('Baseball Tradjectory' )
axis([0 325 0 100]) 
legend('27 degrees','28 degrees','29 degrees','30 degrees','31 degrees','32 degrees')