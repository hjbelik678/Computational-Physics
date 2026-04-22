 clear all
 close all
 
 n = 40;
 epsilon = 8.85E-12;

 side = 2; 
 divisions = 21;
 delta = side / (divisions-1);
 middle = (divisions+1)/2;
 
 Voltage_matrix = zeros(divisions, divisions, divisions);
 denisty_matrix = zeros(divisions, divisions, divisions);

 q = epsilon;
 charge_density = point_charge(q, divisions, denisty_matrix, delta);
 Voltage_matrix = point_charge(q, divisions, Voltage_matrix, delta);

 for w = 1:n
    for k = 2:divisions-1
        for j = 2:divisions-1
            for i = 2:divisions-1
                %check this more
                if i == middle && j == middle && k == middle
                    Voltage_matrix(i, j, k) = q;
                else
                    Voltage_matrix(i, j, k) = three_d_relaxation(Voltage_matrix, i, j, k, delta, charge_density);
                end
            end
        end
    end
    Voltage_matrix;
 end
 
 twod_v = Voltage_matrix(:, :, 11);

 %for plotting
 voltage = twod_v;
 field = electricfield(voltage, delta);
 Ex = field(:, 1:divisions);
 Ey = field(:, divisions+1:2*divisions);
 figure
 quiver(Ex, Ey)
 axis_range = 0.40;
 axis([middle - axis_range*middle middle + axis_range*middle, middle-axis_range*middle middle + axis_range*middle]);
 title('electric field on xy plane')
 xlabel('x index')
 ylabel('y index')

 figure
 mesh(voltage)
 colorbar;
 title('Single Positive Charge')
 xlabel('x index')
 ylabel('y index')
 zlabel('z index')

 figure
 contour(twod_v)
 colorbar('eastoutside');
 title('Contour Plot on xy plane')
 xlabel('x index')
 ylabel('y index')
