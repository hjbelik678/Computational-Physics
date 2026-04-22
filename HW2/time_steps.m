

function output = time_steps(number_of_steps, time_step)
    %initialize time steps
    t = zeros(1, number_of_steps + 1)'; % time

    for i = 1:number_of_steps + 1
    t(i, 1) = (i + 1) * time_step;
    end
    output = t;
end