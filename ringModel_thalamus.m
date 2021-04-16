function activity = ringModel_thalamus(m, theta0, N, n_i, epsilon, c)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %{
    Ring model considering only input from the thalamus
    
    Input
    -m : activity of the neuron at t=0
    -theta0 : angle of the visual stimulus
    -N : number of neurons
    -n_i : number of iterations
    -epsilon : how strong the input is modulated
    -c : stimulus contrast
    
    Output
    -activity : N x n_i matrix of the activity of each neuron at each
                iteration
    
    %}
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    neur_angles = -pi/2 : pi/(N-1) : pi/2;
    theta0 = ones(size(neur_angles))*theta0;
    activity = ones(N, n_i)*m;
    for i = 2:n_i
        Is = I_ringModel(theta0, neur_angles, c, epsilon);
        activity(:,i) = rate_baseMdodel(activity(:,i-1), Is');
    end
    
    figure()
    image(activity*100)
    
end




