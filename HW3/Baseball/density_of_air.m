function output = density_of_air(y, initial_altitude)
    %density_at_sea_level = 1.225; %kg/m^3
    y0 = 1.00 * 10 ^ 4; %m
    output = exp(-(y + initial_altitude)/y0);
end