function x_next = eulerMethod(x, time_step, A, tao)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %{
    Integrated-and-Fire Model
    
    Input
    -x : current value at time t
    -time_step : delta t in ms between the current voltage and the voltage
                 at the next time point in the series
    -A : bias
    -tao : time constant in ms
    -R : resistance
    
    Output
    -x_next : voltage at the next time step
    
    %}
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    tao = tao / 1000;
    time_step = time_step / 1000;
    
    % Euler method to model neuron dynamics
    x_next = x + (time_step/tao)*(-x + A);
    
end