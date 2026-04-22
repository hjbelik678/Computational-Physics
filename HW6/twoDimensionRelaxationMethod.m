function output = twoDimensionRelaxationMethod(row, column, potential_matrix)
    output = 1/4 * (potential_matrix(row-1, column)+potential_matrix(row+1, column)+potential_matrix(row, column-1)+potential_matrix(row, column+1));
end