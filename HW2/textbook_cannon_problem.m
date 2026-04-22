% Henry Belik

clear all
close all

% time
time_step = 0.1; %s
N = 1000; % number of data points

% velocities
% vf = zeros(1, 100)'; % velocity of rider in front of pack
% vb = zeros(1, 100); % vlocity of rider in middle of the pack

%Constants
power = 400; % power
A = 0.33; % frontal area of rider
Ab = (1 - 0.3) * A; % effective frontal area in middle of pack
C = 0.5; % drag coefficient
m = 70; %mass of rider and bike; kg
density = 1.225; % kg/m^3

% initialized values
initial_velocity = 4;

t = time_steps(N, time_step);

%for constant power of 400W varying frontal area
figure
for i = 0.15:0.15:0.90
    vf = calculate_velocity(time_step, C, density, m, power, initial_velocity, N, i);
    plot(t, vf);
    hold on
end
xlabel('Time (s)')
ylabel('velocity (m/s)')
title('final velocity vs time (Power = 400 W)')
legend('0.15 m^2', '0.30 m^2', '0.45 m^2', '0.60 m^2', '0.75 m^2', '0.90 m^2')


% for a given frontal area, varying power
%for constant power of 400W varying frontal area
figure
power_change = 100:50:500;
for i = power_change
    vf = calculate_velocity(time_step, C, density, m, i, initial_velocity, N, A);
    plot(t, vf);
    hold on
end
xlabel('Time (s)')
ylabel('velocity (m/s)')
title('final velocity vs time (Aea = 0.33 m^2)')
legend('100W', '150W', '200W', '250W', '300W', '350W', '400W', '450W', '500W');

% for a given frontal area, varying power
%front rider, greater effective frontal area
figure
for i = power_change
    vf = calculate_velocity(time_step, C, density, m, i, initial_velocity, N, A);
    plot(t, vf);
    hold on
end
xlabel('Time (s)')
ylabel('velocity (m/s)')
title('final velocity vs time for rider in front)')
legend('100W', '150W', '200W', '250W', '300W', '350W', '400W', '450W', '500W');

% for a given frontal area, varying power
%for constant power of 400W varying frontal area
%front rider, greater effective frontal area
figure
for i = power_change
    vf = calculate_velocity(time_step, C, density, m, i, initial_velocity, N, Ab);
    plot(t, vf);
    hold on
end
xlabel('Time (s)')
ylabel('velocity (m/s)')
title('final velocity vs time for rider in middle)')
legend('100W', '150W', '200W', '250W', '300W', '350W', '400W', '450W', '500W');


detailed_power_change = 100:(500-100)/N:500;
terminal_velocity_front = zeros(length(detailed_power_change), 1);
%generate power vs terminal Velocity for rider in front of pack
counter = 1;
for i = detailed_power_change
    vf = calculate_velocity(time_step, C, density, m, i, initial_velocity, N, A);
    terminal_velocity_front(counter, 1) = vf(length(vf), 1);
    counter = counter + 1;
end
figure
plot(detailed_power_change, terminal_velocity_front)
xlabel('Power (w)')
ylabel('terminal velocity (m/s)')
title(' power vs termianl vlocity')
hold on

terminal_velocity_back = zeros(length(detailed_power_change), 1);
%generate power vs terminal Velocity for rider in front of pack
counter = 1;
for i = detailed_power_change
    vf = calculate_velocity(time_step, C, density, m, i, initial_velocity, N, Ab);
    terminal_velocity_back(counter, 1) = vf(length(vf), 1);
    counter = counter + 1;
end
plot(detailed_power_change, terminal_velocity_back)
legend('Front rider', 'Back rider')





