       %Henry Belik
N = 500;
time_step = 0.04; %s

t = time_steps(N, time_step);

g = 9.81; %m/s
pendulum_length = 1; %m
q = 0; %damping constant

initial_angle = 8; %less than 10 degrees
initial_anular_velocity = 0; %deg/s

pos_vel_data = Pendulum(pendulum_length, q, initial_angle, initial_anular_velocity, N, time_step);
figure
plot(t, pos_vel_data(:,1))
xlabel('time (s)')
ylabel('θ (radiens)')
title("Simple Pendulum (Euler Cromer Method)")


%total energy calculations
pendulum_mass = 1; %kg
energy = zeros(N, 1);
energy(1) = 1/2 * pendulum_mass * g*pendulum_length*(pos_vel_data(1,2)^2 + g/pendulum_length * pos_vel_data(1,1)^2) * time_step^2;
for i = 1:N
    energy(i+1) = 1/2 * pendulum_mass * g*pendulum_length*(pos_vel_data(i,2)^2 + g/pendulum_length * pos_vel_data(i,1)^2) * time_step^2;
end

figure
plot(t, energy(:, 1))
xlabel('time (s)')
axis([0 10 0.0014 0.0016])
ylabel('Energy (Joules)')
title('Energy vs time')

