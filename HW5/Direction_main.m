clear all
close all

x_positioni = 1;
x_velocity_index = 2;
y_positioni = 3;
y_velocity_index = 4;

initial_x_velocity = 0; %AU/yr
initial_y_veloctiy = pi; %AU/yr
initial_x_position = 1; %AU
initial_y_position = 0; %AU

time_step = 0.001; %years
N = 2000;
B = 2;

vy = zeros(1, 6);
for i = 1:6
    vy(1, i) = (i * pi)/2;
end
for i = vy
    data = orbital_data(initial_x_position, initial_y_position, initial_x_velocity, i, B, N, time_step);
    plot(data(:,x_positioni), data(:, y_positioni))
    xlabel('AU')
    ylabel('AU')
    hold on
end
title('Orbial effect of changing initial velocity')
legendStrings = "vy = " + string(vy) + " AU/yr";
legend(legendStrings)
plot(0,0,'.y',DisplayName='Sun' ,MarkerSize=20)
axis([ -2 2 -2 2]);
grid on


N = 3 * 1/time_step;
d1 = [1, 0, 0, pi];
d2 = [0, 1, -pi, 0];
d3 = [1, 0, pi / sqrt(2), pi / sqrt(2)];

data1 = orbital_data(d1(1), d1(2), d1(3), d1(4), 2, N, time_step);
data2 = orbital_data(d2(1), d2(2), d2(3), d2(4), 2, N, time_step);
data3 = orbital_data(d3(1), d3(2), d3(3), d3(4), 2, N, time_step);
figure
plot(data1(:, x_positioni), data1(:, y_positioni));
hold on
plot(data2(:, x_positioni), data2(:, y_positioni));
hold on
plot(data3(:, x_positioni), data3(:, y_positioni));
hold on
title('changing initial velocities')
xlabel('AU')
ylabel('AU')
plot(0,0,'.y',DisplayName='Sun' ,MarkerSize=20)
grid on
legend('90 degrees', '180 degrees', '45 degrees')


% N = 1050;
% d4 = [1, 0, 2*pi, 0];
% data4 = orbital_data(d4(1), d4(2), d4(3), d4(4), 2, N, time_step);
% %Create a movie
% writerObj = VideoWriter('planet_orbiting.mp4', 'MPEG-4');
% writerObj.FrameRate = 150;  % adjust frame rate if needed
% open(writerObj);
% 
% %Animation
% figure;
% for i = 1:length(data4)
%     plot(0, 0, 'yo', MarkerSize=50);  % sun
%     hold on    
%     plot(data4(i, x_positioni), data4(i, y_positioni), 'bo', MarkerSize=10);  % planet
%     xlim([-1 10]);
%     ylim([-1 1]);
%     title(['Planet orbit ', num2str(i)]);
%     xlabel('X Position (m)');
%     ylabel('Y Position (m)');
%     grid on;
%     hold off;
%     drawnow;
%     
%     %Capture frame for the movie
%     frame = getframe(gcf);
%     writeVideo(writerObj, frame);
% end
% 
% %Close the movie file
% close(writerObj);


