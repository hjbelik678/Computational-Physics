function output = baseball_tradjectory_pos_vel(theta, initial_velocity, wind_velocity, N, time_step, initial_altitude, pos_vel, max_x, max_x_pos, min_y, min_y_pos)
    %pos_vel: true to return both veloctiy and position data
    g = 9.81; %m/s^2
    initial_velocity = mph_to_m(initial_velocity);
    wind_velocity = mph_to_m(wind_velocity);

    % velocity data, first column x, second column y
    velocity = zeros(N, 2);

    %position data, first column x, second column y
    position = zeros(N, 2);

    %define vix
    velocity(1, 1) = initial_velocity * cosd(theta);

    %define viy
    velocity(1, 2) = initial_velocity * sind(theta);

    for i = 1:N
        relative_velocity = sqrt((velocity(i, 1) - wind_velocity)^2 + (velocity(i, 2)^2));
        %x position
        position(i + 1, 1) = position(i, 1) + velocity(i, 1) * time_step;
        %x velocity
        velocity(i + 1, 1) = velocity(i, 1) - B2_m2(relative_velocity, initial_altitude) * relative_velocity * velocity(i, 1) * time_step;

        %y position
        position(i + 1, 2) = position(i, 2) + velocity(i, 2) * time_step;
        %y velocity
        velocity(i + 1, 2) = velocity(i, 2) + (-g - B2_m2(relative_velocity, initial_altitude) * velocity(i, 2) * relative_velocity) * time_step;
        index = i;
        if min_y
            if position(i, 2) < min_y_pos && i > 2
                break
            end
        end
        if max_x
            if position(i, 1) > max_x_pos && i > 2
                break
            end
        end
    end

    if pos_vel
        temporary = [position velocity];
        final = temporary(1:index - 1, 1:4);
        output = final;
    else
        output = position;
    end
end