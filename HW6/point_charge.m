function outputArg1 = point_charge(q, divisions, density_matrix, delta)
% the is the charge denisty of a point chage
%x, y, z = 0; correspond to middle, middle, middle; in terms of i, j, k
%density is initialized as zeros for total volume
middle = (divisions+1)/2;
disp(middle);
density_matrix(middle, middle, middle) = q/(delta^3);
disp("pass2");
outputArg1 = density_matrix;
end