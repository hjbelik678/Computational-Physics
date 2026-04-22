clear all
close all

N = 6000; % time increments

initial_velocity = 110; %m/s
time_step = 0.001; %s
theta = (32:1:36); %degrees
angle = 30;
wind_velocity1 = mph_to_m(-25); %headwind
wind_velocity2 = mph_to_m(25); %tail wind
initial_altitude = 0; %m

figure
headwind_max = 34; %degrees
tailwind_max = 38; %degrees
no_wind_max = 36; %degrees
tradjectory1 = baseball_tradjectory(headwind_max, initial_velocity, wind_velocity1, N, time_step, 0);
plot(tradjectory1(:, 1), tradjectory1(:, 2))
hold on 
tradjectory2 = baseball_tradjectory(tailwind_max, initial_velocity, wind_velocity2, N, time_step, 0);
plot(tradjectory2(:, 1), tradjectory2(:, 2))
tradjectory3 = baseball_tradjectory(no_wind_max, initial_velocity, 0, N, time_step, 0);
plot(tradjectory3(:, 1), tradjectory3(:, 2))
xlabel('x (m)')
ylabel('y (m)')
title('Baseball Tradjectory' )
axis([0 120 0 50]) 
legend('34 degrees(headwind)', '38 degrees (tailwind)', '36 degrees(no wind)')


