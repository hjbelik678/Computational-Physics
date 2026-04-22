clear all
close all

x_position_index = 1;
x_velocity_index = 2;
y_position_index = 3;
y_velocity_index = 4;
r_position_index = 5;

initial_x_velocity = 0; %AU/yr
initial_y_veloctiy = 2 * pi; %AU/yr
initial_x_position = 1; %AU
initial_y_position = 0; %AU

N = 3000;
B = 2.05;
time_step = 0.002; %years

t = time_steps(N, time_step);

%Orbital effect of changing initial velocity with varied B value
vi = [4, 5, 6, initial_y_veloctiy, 7, 8];
figure
for j = 1:length(vi)  
    orbit = orbital_data(initial_x_position, initial_y_position, initial_x_velocity, vi(j), B, N, time_step);
    plot(orbit(:,x_position_index), orbit(:, y_position_index))
        xlabel('AU')
        ylabel('AU')
        hold on
end
title('Orbital effect of changing initial velocity')
legendStrings = "viy = " + string(vi) + " AU/yr";
legend(legendStrings)
plot(0,0,'oy', 'DisplayName','Sun')
grid on


%Effects of initial velocity on semi major axis position
figure
initial_velocities = 1:0.05:8.8;
axis_change = zeros(length(initial_velocities), 1);
for i = 1:length(initial_velocities)
    vy = initial_velocities(i);
    data = orbital_data(initial_x_position, initial_y_position, initial_x_velocity, vy, B, N, time_step);

    r = zeros(length(data),1);
    for s = 1:length(data)
        r(s,1) = sqrt(data(s,x_position_index)^2 + data(s,y_position_index)^2);
    end
    major_axis = max(r(:,1));
    max_row = find(r==major_axis);
    theta1 = atan2(data(max_row, y_position_index), data(max_row, x_position_index));
    if theta1 < 0
        theta1 = pi + theta1;
    end
    axis_change(i,1) = theta1;
end

plot(initial_velocities, axis_change);
title('Effects of initial velocity on semi major axis position')
xlabel('initial y velocity (AU/yr)')
ylabel('smei-major axis angle (radiens)')

time1 = 500;
time2 = 500 + 1/time_step;


%Effects of initial velocity on orbital rotation
figure
initial_velocities = 1:0.05:8.8;
axis_change = zeros(length(initial_velocities), 1);
for i = 1:length(initial_velocities)
    vy = initial_velocities(i);
    data = orbital_data(initial_x_position, initial_y_position, initial_x_velocity, vy, B, N, time_step);

    theta1 = atan2(data(time1, y_position_index), data(time1, x_position_index));
    theta2 = atan2(data(time2, y_position_index), data(time2, x_position_index));

    axis_change(i,1) = theta1-theta2;
end

plot(initial_velocities, axis_change);
title('Effects of initial velocity on orbital rotation')
xlabel('initial y velocity (AU/yr)')
ylabel('orbital rotation (rad/yr)')

