N = 200;
time_step = 0.05;
t = time_steps(N, time_step);

q = 6:0.2:7;
pendulum_length = 1;
initial_angle = 9; %degrees
initial_angular_velocity = 0;


figure
for i = q
    pos_vel_data = Pendulum(pendulum_length,i, initial_angle, initial_angular_velocity, N, time_step);
    plot(t, pos_vel_data(:,1))
    hold on
end

title('Damping Regimes')
xlabel('time (s)')
ylabel('Angular Position(rad)')
set(gca, 'XAxisLocation', 'origin')
%axis([2.4 3.4 -0.001 0.002])
legendStrings = "q = " + string(q);
legend(legendStrings)

figure
w = [2, 4, 6.2, 8, 10];
for i = w
    pos_vel_data = Pendulum(pendulum_length,i, initial_angle, initial_angular_velocity, N, time_step);
    plot(t, pos_vel_data(:,1))
    hold on
end

title('Damping Regimes')
xlabel('time (s)')
ylabel('Angular Position(rad)')
set(gca, 'XAxisLocation', 'origin')
legendStrings = "q = " + string(w);
legend(legendStrings)

