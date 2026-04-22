clear all
close all

N = 350;
time_step = 0.05;
t = time_steps(N, time_step);

pendulum_length = 1;
initial_angle = 9; %degrees
initial_angular_velocity = 0;

natural_frequency = sqrt(9.81 / pendulum_length);
%driving_frequency = 2.0 * natural_frequency; %rad/s
driving_force = 1 * natural_frequency; %Newtons
%q = 0.2;

%data = dd_Pendulum(pendulum_length, q, driving_frequency, driving_force, initial_angle, initial_angular_velocity, N, time_step);

% x = zeros(1, N);
% y = zeros(1, N);
% for i = 1:N
%     x(i) = pendulum_length * sind(data(i, 1));
%     y(i) = -pendulum_length * cosd(data(i, 1));
% end

% figure
% plot(t, data(:, 1))
% xlabel('Time (s)')
% ylabel('theta (radiens)')

%changing driving frequency show it has largest amplitude
% figure
% xlabel('Time (s)')
% ylabel('theta (radiens)')
% values = 1:0.5:5;
% for i= values
%     data = dd_Pendulum(pendulum_length, q, i, driving_force, initial_angle, initial_angular_velocity, N, time_step);
%     plot(t, data(:, 1))
%     hold on
% end

% legendStrings = "drive freq. = " + string(values);
% legend(legendStrings)

%constant driving frequency, chaning q
figure
driving_frequency = 3;
q = 1:6;
for i = q
    data = dd_Pendulum(pendulum_length, i, driving_frequency, driving_force, initial_angle, initial_angular_velocity, N, time_step);
    plot(t, data(:, 1))
    hold on
end
xlabel('Time (s)')
ylabel('theta (radiens)')
title('angular position vs time')
legendStrings = "q = " + string(q);
legend(legendStrings)