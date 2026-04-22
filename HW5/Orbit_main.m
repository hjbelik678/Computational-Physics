clear all
close all

x_position_index = 1;
x_velocity_index = 2;
y_position_index = 3;
y_velocity_index = 4;

initial_x_velocity = 0; %AU/yr
initial_y_veloctiy = 2 * pi; %AU/yr
initial_x_position = 1; %AU
initial_y_position = 0; %AU

N = 2500;
time_step = 0.002; %years

t = time_steps(N, time_step);

vi = [4, 5, 6, initial_y_veloctiy, 7, 8];
figure
for j = 1:length(vi)  
    orbit = orbital_data(initial_x_position, initial_y_position, initial_x_velocity, vi(j), 2, N, time_step);
    plot(orbit(:,x_position_index), orbit(:, y_position_index))
        xlabel('AU')
        ylabel('AU')
        hold on
end
title('Orbial effect of changing initial velocity')
legendStrings = "viy = " + string(vi) + " AU/yr";
legend(legendStrings)
plot(0,0,'oy')
grid on

%varying time step
step = [0.001, 0.01, 0.05, 0.1];
figure
for i = 1:length(step)
    data = orbital_data(initial_x_position, initial_y_position, initial_x_velocity, initial_y_veloctiy, 2, 5/step(i), step(i));
    plot(data(:,x_position_index), data(:, y_position_index))
    xlabel('AU')
    ylabel('AU')
    hold on
end
title('Orbital effect of changing time step')
legendStrings = "time step = " + string(step) + " yr";
legend(legendStrings)
plot(0,0,'oy',DisplayName='Sun')
axis([-2 2 -2 2]);
grid on



