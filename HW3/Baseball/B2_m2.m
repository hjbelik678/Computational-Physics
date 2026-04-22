function output = B2_m2(V, initial_altitdue)
    delta = 5; %m/s
    vd = 35; % m/s
    p0 = 1.225;
    output = (p0 / density_of_air(V, initial_altitdue)) * (0.0039 + (0.0058/(1+exp((V-vd)/delta))));
end