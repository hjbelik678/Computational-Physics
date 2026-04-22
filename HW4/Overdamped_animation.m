N = 150;
time_step = 0.1;
t = time_steps(N, time_step);

q = 8;
pendulum_length = 1;
initial_angle = 9; %degrees
initial_angular_velocity = 0;

data = Pendulum(pendulum_length,q, initial_angle, initial_angular_velocity, N, time_step);

x = zeros(1, N);
y = zeros(1, N);
for i = 1:N
    x(i) = pendulum_length * sind(data(i, 1));
    y(i) = -pendulum_length * cosd(data(i, 1));
end

% Create a movie
writerObj = VideoWriter('overdamped_animation.mp4', 'MPEG-4');
writerObj.FrameRate = 5;  % adjust frame rate if needed
open(writerObj);

% Animation
figure;
for i = 1:length(x)
    plot(0, 0, 'ro', 'MarkerSize', 10);  % pivot point
    hold on;
    plot([0, x(i)], [0, y(i)], 'b', 'LineWidth', 2);  % pendulum rod
    plot(x(i), y(i), 'bo', 'MarkerSize', 20);  % pendulum bob
    xlim([-1.5*max(abs(x)) 1.5*max(abs(x))]);
    ylim([-1.5*max(abs(y)) 1.5*max(abs(y))]);
    title(['Pendulum Animation at Frame ', num2str(i)]);
    xlabel('X Position (m)');
    ylabel('Y Position (m)');
    grid on;
    hold off;
    drawnow;
    
    % Capture frame for the movie
    frame = getframe(gcf);
    writeVideo(writerObj, frame);
end

% Close the movie file
close(writerObj);
    