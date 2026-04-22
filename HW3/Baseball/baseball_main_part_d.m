pitch_height = 2; %m
home_plate_distance_ft = 60.5; %ft
home_plate_distance_m = home_plate_distance_ft * 0.3048; %m
exit_velocity = 100; %mph
throw_angle = 0; %degrees
N = 200;
time_step = 0.01; %s

data = baseball_tradjectory_pos_vel(throw_angle, exit_velocity, wind_velocity, N, time_step, 0, true, true, home_plate_distance_m, false, 0);
final_velocity = sqrt(data(length(data), 3)^2 + data(length(data), 4)^2);
final_velocity = final_velocity * 2.2369
