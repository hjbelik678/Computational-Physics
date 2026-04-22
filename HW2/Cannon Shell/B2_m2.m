function output = b2_m(V)
    delta = 5; %m/s
    vd = 35; % m/s
    output = 0.0039 + (0.0058/(1+exp((V-vd)/delta)));
end