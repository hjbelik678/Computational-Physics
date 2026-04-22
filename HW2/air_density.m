density_at_sea_level = 1.225; %kg/m^3
y0 = 1.00 * 10 ^ 4; %m

function output = air_density(y)
    output = density_at_sea_level * exp(-y/y0);
end
    