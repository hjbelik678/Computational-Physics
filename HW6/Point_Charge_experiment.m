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
 position_x = zeros(divisions, divisions, divisions);
 position_y = zeros(divisions, divisions, divisions);
 position_z = zeros(divisions, divisions, divisions);

 for k = 1:divisions
     for j = 1:divisions
         for i = 1:divisions
             position_x(i, j, k) = i;
             position_y(i, j, k) = j;
             position_z(i, j, k) = k;
         end
     end
 end

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
 [Ex, Ey, Ez] = electricfieldthreeD(voltage, delta);

 figure
 quiver(Ex, Ey)
 axis_range = 0.40;
 axis([middle - axis_range*middle middle + axis_range*middle, middle-axis_range*middle middle + axis_range*middle]);

 figure
 mesh(voltage)
 colorbar;

 figure 
 contour(twod_v)
 colorbar;

 figure 
 quiver3(position_x, position_y, position_z, Ex, Ey, Ez)
