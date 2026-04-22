clear all 
close all


t = -5:55;
v = ones(length(t));

for i = 1:length(t)
    % t < 0
    if t(i) < 0
        v(i) = 0;
    end
    % 0 <= t <= 10
    if t(i) >= 0 && t(i) <= 10
        v(i) = 11 * t(i) ^ 2 - 5 * t(i);
    end
    % 10 <= t <= 20
    if 10 <= t(i) && t(i) <= 20
        v(i) = 1100 - 5 * t(i);
    end
    % 20 <= t <= 30
    if 20 <= t(i) && t(i) <= 30
        v(i) = 50 * t(i) + 2 * (t(i) - 20) ^ 2;
    end
    % t > 30
    if t(i) > 30
        v(i) = 1520 * exp(-0.2 * (t(i) - 30));
    end
end

disp(v)

figure
plot(t, v)
title('Piecewise velocity vs time')
xlabel('time (s)')
ylabel('velocity (m/s)')
        