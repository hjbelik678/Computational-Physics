b2_m = 4 * 10 ^-5; %1/m
density_at_sea_level = 1.225; %kg/m^3
G = 6.67 * 10 ^ -11;
Me = 5.972 * 10 ^ 24; %kg
Mc = 50; %kg


function output = positional_data(theta, initial_velocity, N, time_step)
    %returns a N x 4 matrix 
    %first column is x positional data
    % second column is x velocity data
    % third column is y positional data
    % fourth column is y velocity data
    v = zeros(N, 4);
    %define vix
    v(1,2) = initial_velocity * sind(theta);

    %define viy
    v(1, 4) = initial_velocity * sind(theta);

    for i = 1:N
        v(i + 1, 3) = v(i, 3) + v(i, 4) * time_step;
        v(i + 1, 4) = v(i, 4) + ((G * Me * Mc) / ((Re + v(i, 3)) ^ 2) -(air_density(v(i, 3)) * b2_m / density_at_sea_level) * v(i, 4) ^ 2) * time_step;
        
        v(i + 1, 1) = v(i, 1) + v(i, 2) * time_step;
        v(i + 1, 2) = v(i, 2) - (air_density(v(i, 3)) / density_at_sea_level) * b2_m * v(i, 2) ^ 2 * time_step;
    end
    output = v;
end