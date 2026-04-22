%calculates velocity based on the input parameters, includes air resistance
function output = calculate_velocity(time_step, drag_coefficient, density, mass, power, initial_velocity, number_of_data_points, frontal_area)
    %initialize variables
    velocity = zeros(number_of_data_points + 1, 1);
    velocity(1, 1) = initial_velocity;
    %compute velocity for each iteration

    for i = 1:number_of_data_points
    f_drag = - (drag_coefficient * density * frontal_area * velocity(i, 1) ^ 2 * time_step / ( 2 * mass));
    velocity(i + 1, 1) = velocity(i, 1) + ((power * time_step) / (mass * velocity(i, 1))) + f_drag;
    end

    %output column vector with velocites on row per timestep
    output = velocity;
end