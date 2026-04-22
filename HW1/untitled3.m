g = 9.81; % m/s^2
y0 = 0; % m/s
v0 = 30; % m/s
theta = 15; %[15:15:75]';
x = [0:5:100]';

denominator = 2 .* (v0 .^ 2) .* (cos(theta) .^ 2) .* (x .^ 2);
y = tan(theta) .* x - g ./ (denominator) + y0

