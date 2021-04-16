function m_next = rate_baseMdodel(m, h)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %{
    Integrated-and-Fire Model
    
    Input
    -m : activity of the neuron at t
    -h : input to the neuron
    
    Output
    -m_next : activity of the neuron at next time point
    
    %}
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % Euler method to model neuron dynamics
    in = non_linearity(0.1, h, 0);
    m_next = eulerMethod(m, 1, in, 5);
    
end