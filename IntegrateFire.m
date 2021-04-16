function v_next = IntegrateFire(v, time_step, I, v_threshold, tao, R)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %{
    Integrated-and-Fire Model
    
    Input
    -v : current voltage at time t
    -time_step : delta t in ms between the current voltage and the voltage
                 at the next time point in the series
    -I : current
    -v_threshold : reset voltage threshold
    -tao : time constant in ms
    -R : resistance
    
    Output
    -v_next : voltage at the next time step
    
    %}
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if nargin < 5
        R = 1;
        tao = 10;
    end
    if nargin < 4
        v_threshold = 10;
    end
    
    tao = tao / 1000;
    time_step = time_step / 1000;
    
    % Euler method to model neuron dynamics
    v_next = v + (time_step/tao)*(-v + R*I);
    
    if v_next > v_threshold
        v_next = [v_threshold, 0];
    end
    
end