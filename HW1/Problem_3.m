
t = [10, 20, 30, 40, 50, 60]; %time in minutes
c = [3.4, 2.6, 1.6, 1.3, 1.0, 0.5]; %concentration in ppm
T = [0:1:75]';

concentration = 4.84 * exp(x) .^ (-0.034 * T); %concentraion relation equation

figure
plot(t,c,'d'); %plot with given data
hold on
plot(T, concentration, '.'); %plot with function distribution
title('concentration vs time')
xlabel('time (min)')
ylabel('concentration (pm)')
grid

figure %same figure as above but the y axis has a logrithmic scale
semilogy(t,c,'d'); %plot with given data
hold on
semilogy(T, concentration, '.'); %plot with function distribution
title('concentration vs time')
xlabel('time (min)')
ylabel('concentration (pm)')
grid