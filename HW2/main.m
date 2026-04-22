
clear all
close all

N = 200; % time increments

initial_velocity = 700; %m/s
time_step = 0.01; %s

% for theta = 35 degrees
theta = 35;
data = positions(theta, initial_velocity, N, time_step);

%t = time_steps(N, time_step);

index = 0;
for i = 1:N
    if data(i,2) < 0
        index = i;
        break
    end
end

figure
plot(data(1:index, 1), data(1:index, 2))
axis([0 max(data(:,1)) 0 max(data(:, 2) + 10)]) 
xlabel('x (m)')
ylabel('y (m)')
title('Cannon Shell Tradjectory' )


