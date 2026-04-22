% for a given frontal area, varying power
%for constant power of 400W varying frontal area
%front rider, greater effective frontal area
function output = mrvp(time_step, C, density, m, initial_velocity, N, frontal_area, power_change)
figure
for i = power_change
    vf = calculate_velocity(time_step, C, density, m, i, initial_velocity, N, frontal_area);
    plot(t, vf);
    hold on
end
xlabel('Time (s)')
ylabel('velocity (m/s)')
title('final velocity vs time for rider in middle)')
legend('100W', '150W', '200W', '250W', '300W', '350W', '400W', '450W', '500W');
