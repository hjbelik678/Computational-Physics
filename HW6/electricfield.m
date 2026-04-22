function output = electricfield(P, delta)
    [rows, columns] = size(P);
    Ex = zeros(rows);
    Ey = zeros(columns);
    for i = 1:rows
        %loop over rows
        for j = 1:columns
            %loop over columns
            if i ~= 1 && i ~= rows && j ~= 1 && j~= columns
                %only if its not an outside row or column
                %middle points
                %centered approximation
                Ex(i, j) = -(P(i, j+1) - P(i, j-1))/(2*delta);
                Ey(i, j) = -(P(i+1, j) - P(i-1, j))/(2*delta);
            else
                if j==1
                    %left boundary x
                    %foreward centered
                    Ex(i, j) = -(P(i, j+1) - P(i, j))/delta;
                end
                if i==1
                    %top boundary y
                    %foreward centered
                    Ey(i, j) = -(P(i+1, j) - P(i, j))/delta;
                    if j ~= 1 && j~=columns && i ~= rows
                        %top row, middle points
                        %centered approximation
                        Ex(i, j) = -(P(i, j+1) - P(i, j-1))/(2*delta);
                    end
                end
                if j == columns
                    %right boundary x
                    %back approx
                    Ex(i, j) = -(P(i, j) - P(i, j-1))/delta;
                end
                if i == rows
                    %bottom boundary y
                    %back approx
                    Ey(i, j) = -(P(i, j) - P(i-1, j))/delta;
                    if j ~= 1 && j~=columns && i ~= 1
                        %bottom row, middle points
                        %centered approximation
                        Ex(i, j) = -(P(i, j+1) - P(i, j-1))/(2*delta);
                    end
                end
            end
        end
    end
    output = [Ex Ey];
end

                
