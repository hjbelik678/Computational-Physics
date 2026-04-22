function output = three_d_relaxation(p, row, column, height, delta, charge_density)
    %initial charge term, is when the total charge enclosed in the arbitrary
    %box is not zero
    epsilon = 8.85E-12;
    output = 1/6*(p(row-1, column, height) + p(row +1, column, height) + p(row, column-1, height) + p(row, column+1, height) + p(row, column, height-1) + p(row, column, height+1))+charge_density(row, column, height)*((delta^2)/(6*epsilon));
end