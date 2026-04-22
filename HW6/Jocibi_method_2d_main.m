clear all
close all

n=6; %matrix size; electric field detail
potential = zeros(n);

plate_1_potential = -2; %V
plate_1_position = -1; %m
plate_2_potential = 2; %V
plate_2_position = 1; %m


delta_x = (plate_2_position - plate_1_position)/n;
values = linspace(plate_1_potential, plate_2_potential, n);

%define initial values
potential(:,1) = plate_1_potential; % Volts
potential(:, n) = plate_2_potential; % Volts

for i = 2:n-1
    potential(1, i) = values(i);
    potential(n, i) = values(i);
end
for k = 1:20
    %number of times to repeat entire process
    for j = 2:n-1
        %columns
        for i = 2:n-1
            %rows
            potential(i, j) = twoDimensionRelaxationMethod(i, j, potential);
        end
    end
    disp(potential)
end

contour(potential)
colorbar;
title('Parallel Plate potential plot')

electric_field = electricfield(potential, delta_x);
Ex = electric_field(:, 1:n);
Ey = electric_field(:, n+1:2*n);

figure
quiver(Ex, Ey)
hold on
title('Electric Field of Parallel Plate Capacitor')
plot([0,0],[0,6], 'DisplayName','Plate 1')
plot([6,6], [6,0], 'DisplayName','Plate 2')
axis([-0.5 6.5 0 6.5])
legend('show')