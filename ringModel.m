function activity = ringModel(m, theta0, N, n_i, epsilon, c, with_stimulus)
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
    if nargin < 7
        with_stimulus = 1;
    end
    if length(m) == 1
        m = ones(N, 1)*m;
    end
    
    neur_angles = -pi/2 : pi/(N-1) : pi/2;
    theta0 = ones(size(neur_angles))*theta0;
    J = weights_ringModel(neur_angles, 86, 112);
    
    activity = repmat(m, 1, n_i);
    Is = zeros(1, N);
    for i = 2:n_i
        if with_stimulus
            Is = I_ringModel(theta0, neur_angles, c, epsilon);
        end
        conncetivity_input = J * activity(:,i-1);
        h = conncetivity_input + Is';
        activity(:,i) = rate_baseMdodel(activity(:,i-1), h);
    end
    
    figure()
    image(activity*100)
    
end