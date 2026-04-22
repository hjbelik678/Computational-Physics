function [output1, output2, output3] = electricfieldthreeD(P, delta)
    [rows, columns, height] = size(P);
    Ex = zeros(rows);
    Ey = zeros(columns);
    Ez = zeros(height);
    for i = 1:rows
        %loop over rows
        for j = 1:columns
            %loop over columns
            for k = 1:height
                if i ~= 1 && i ~= rows && j ~= 1 && j~= columns && k ~= 1 && k ~= height
                    %only if its not an outside row or column
                    %middle points
                    %centered approximation
                    Ex(i, j) = -(P(i, j+1, k) - P(i, j-1, k))/(2*delta);
                    Ey(i, j) = -(P(i+1, j, k) - P(i-1, j, k))/(2*delta);
                    Ez(i, j) = -(P(i, j, k+1) - P(i, j, k-1))/(2*delta);
                else
                    if j==1
                        %left boundary x
                        %foreward centered
                        Ex(i, j) = -(P(i, j+1, k) - P(i, j, k))/delta;
                    end
                    if i==1
                        %top boundary y
                        %foreward centered
                        Ey(i, j, k) = -(P(i+1, j, k) - P(i, j, k))/delta;
                        if j ~= 1 && j~=columns && i ~= rows 
                            %top row, middle points
                            %centered approximation
                            Ex(i, j, k) = -(P(i, j+1, k) - P(i, j-1, k))/(2*delta);
                        end
                    end
                    if j == columns
                        %right boundary x
                        %back approx
                        Ex(i, j) = -(P(i, j, k) - P(i, j-1, k))/delta;
                    end
                    if i == rows
                        %bottom boundary y
                        %back approx
                        Ey(i, j) = -(P(i, j, k) - P(i-1, j, k))/delta;
                        if j ~= 1 && j~=columns && i ~= 1
                            %bottom row, middle points
                            %centered approximation
                            Ex(i, j) = -(P(i, j+1, k) - P(i, j-1, k))/(2*delta);
                        end
                    end
                end
            end
        end
    end
    output1 = Ex;
    output2 = Ey;
    output3 = Ez;
end

                
