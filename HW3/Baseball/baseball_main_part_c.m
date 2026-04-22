initial_velocity = [0:1:250]';
launch_angle = 36; %degrees
N = 200;
wind_velocity = 0;
time_step = 0.1;
initial_altitude = 0;
pos_vel = true;
baseball_weight = 0.145; %kg
baseball_mass = baseball_weight / 9.81;
min_y_pos = 0;

kinetic_energy = zeros(length(initial_velocity), 1);
range = zeros(length(initial_velocity), 1);
for i = 1:length(initial_velocity)
    data = baseball_tradjectory_pos_vel(launch_angle, initial_velocity(i), wind_velocity, N, time_step, initial_altitude, pos_vel, false, 0, true, min_y_pos);
    kinetic_energy(i,1) = 0.5 * baseball_mass * initial_velocity(i, 1) ^ 2;
    range(i, 1) = data(length(data));
end
figure
plot(kinetic_energy, range);
xlabel('Initial KE (J)')
ylabel('Range (m)')
title('Initial KE vs Range')

