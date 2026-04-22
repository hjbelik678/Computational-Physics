function output = positions(theta, initial_velocity, N, time_step)
    b2_m = 4 * 10 ^ -5; %1/m
    %density_at_sea_level = 1.225; %kg/m^3
    G = 6.67 * 10 ^ -11;
    Me = 5.972 * 10 ^ 24; %kg
    Mc = 50; %kg
    Re = 6.371 * 10 ^ 6; %m   
    % velocity data, first column x, second column y
    velocity = zeros(N, 2);

    %position data, first column x, second column y
    position = zeros(N, 2);

    %define vix
    velocity(1, 1) = initial_velocity * cosd(theta);

    %define viy
    velocity(1, 2) = initial_velocity * sind(theta);

    for i = 1:N
        %x position
        position(i + 1, 1) = position(i, 1) + velocity(i, 1) * time_step;
        %x velocity
        velocity(i + 1, 1) = velocity(i, 1) - ((density_of_air(position(i, 2))) * b2_m * sqrt(velocity(i, 1) ^ 2 + velocity(i, 2) ^ 2) * velocity(i, 1)) * time_step;

        %y position
        position(i + 1, 2) = position(i, 2) + velocity(i, 2) * time_step;
        %y velocity
        velocity(i + 1, 2) = velocity(i, 2) + (-(G * Me * Mc) / ((Re + position(i, 2)) ^ 2) - (density_of_air(position(i, 2)) * b2_m) * velocity(i, 2) * sqrt(velocity(i, 1) ^ 2 + velocity(i, 2) ^2)) * time_step;
        
        if position(i,2) && (i > 0.1 * N) < 0
            break
        end
    end
    output = position;
end