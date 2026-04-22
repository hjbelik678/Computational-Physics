t = [0:0.005:0.7]'; %seconds
R = 50; %Ohms
q0 = 12; %Colombs
L = 5; %Henri's
C = 10^-4; % degrees farenheight
e = 2.81; %exp
exponent = -R .* t / (2 * L);
root = (1 / (L * C) - (R / (2 * L))^2);
Q = q0 * e .^ (exponent) .* cos(sqrt(root) .* t); %charge in Colombs

figure
plot(t,Q);
title('Plort t vs. Q')
xlabel('time (s)')
ylabel('charge (C)')
grid