function output = Pendulum(pendulum_length, damping_constant, initial_angle, initial_anular_velocity, N, time_step)
    g = 9.81; %m/s

    %initialize data matrix
    %column 1 angular position
    %column 2 angular velocity
    pos_vel_data = zeros(N, 2);
    
    %initialize data
    pos_vel_data(1, 2) = 3.14 / 180 * initial_anular_velocity;
    pos_vel_data(1,1) = 3.14 / 180 * initial_angle;
    
    for i = 1:N
        %angular velocity
        pos_vel_data(i+1, 2) = -damping_constant * pos_vel_data(i,2) * time_step - g/pendulum_length * pos_vel_data(i, 1) * time_step + pos_vel_data(i, 2);
    
        %angular position
        pos_vel_data(i+1, 1) = pos_vel_data(i+1,2) * time_step + pos_vel_data(i, 1);
    end
    output=pos_vel_data;
end