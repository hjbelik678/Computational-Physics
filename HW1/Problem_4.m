clear all
close all

g = 9.81; % m/s^2
y0 = 0; % m/s
v0 = 30; % m/s
theta0 = 15:15:75;
x = 0:0.5:100;
y = ones(length(x), length(theta0));

for i = 1:length(x)
    % for each time interval
    for j = 1:length(theta0)
        % for each launch angle(value of theta)
        y(i,j) = (tand(theta0(j)) * x(i)) - (g / (2 * (v0 ^ 2) * (cosd(theta0(j)) ^ 2))) * (x(i) ^ 2) + y0;
    end
end

figure
plot(x, y)
axis([min(x) max(x) 0 max(max(y))])
legend('15 degrees', '30 degrees', '45 degrees', '60 degrees', '75 degrees');
title('Position vs time based on launch angle')
xlabel('time (s)')
ylabel('position (m)')