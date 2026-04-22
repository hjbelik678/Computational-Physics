function output = orbital_data(initial_x, initial_y, initial_x_v, initial_y_v, B, N, time_step)
    %constants
    GMs = 4 * pi^2;

    %set indexes
    position = 1;
    velocity = 2;
    
    %set initial data structures
    x_data = zeros(N,2);
    y_data = zeros(N,2);
    r = zeros(N, 1);

    %set initial conditions
    x_data(1, position) = initial_x;
    x_data(1, velocity) = initial_x_v;
    y_data(1, position) = initial_y;
    y_data(1, velocity) = initial_y_v;

    
    for i = 1:N
        %radius
        r(i, 1) = sqrt(x_data(i, position)^2 + y_data(i, position)^2);

        %calculate x position an velocity
        x_data(i+1, velocity) = x_data(i, velocity) - (GMs * x_data(i, position) / r(i,1)^(B+1)) * time_step;
        x_data(i+1, position) = x_data(i, position) + x_data(i+1, velocity) * time_step;

        %calculate y position and velocity
        y_data(i+1, velocity) = y_data(i, velocity) - (GMs * y_data(i, position) / r(i,1)^(B+1)) * time_step;
        y_data(i+1, position) = y_data(i, position) + y_data(i+1, velocity) * time_step;
    end
    data = [x_data y_data];
    output = data;
end

