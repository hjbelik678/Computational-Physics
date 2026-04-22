clear all
close all

x_position_index = 1;
x_velocity_index = 2;
y_position_index = 3;
y_velocity_index = 4;

initial_x_velocity = 0; %AU/yr
%initial_y_veloctiy = 2 * pi; %AU/yr
initial_x_position = 1; %AU
initial_y_position = 0; %AU

N = 15000;
time_step = 0.002; %years

t = time_steps(N, time_step);

velocities = 5:10;
for i = velocities
    orbit = orbital_data(initial_x_position, initial_x_velocity, initial_y_position, i, 2, N, time_step);
    plot(orbit(:,x_position_index), orbit(:, y_position_index))
    xlabel('AU')
    ylabel('AU')
    hold on
end
title('Escape velocity of the sun')
legendStrings = "v = " + string(velocities) + " AU/yr";
legend(legendStrings)
grid on

velocities2 = 8:0.1:9;
for i = velocities2
    orbit = orbital_data(initial_x_position, initial_x_velocity, initial_y_position, i, 2, N, time_step);
    plot(orbit(:,x_position_index), orbit(:, y_position_index))
    xlabel('AU')
    ylabel('AU')
    hold on
end
title('Escape velocity of the sun')
legendStrings = "v = " + string(velocities2) + " AU/yr";
legend(legendStrings)
grid on

