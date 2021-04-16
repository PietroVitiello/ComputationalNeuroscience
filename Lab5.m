%% Current
n_neurons = 50;
theta0 = 0;
neur_angles = -pi/2 : pi/(n_neurons-1) : pi/2;

theta0 = ones(size(neur_angles))*theta0;
Is = I_ringModel(theta0, neur_angles, 3, 0.1);

figure()
plot(neur_angles, Is)
xlabel('preferred angle (rad)')
ylabel('input current')

%% Sigmoid
T = 0;
beta = 0.1;
h = -15 : 0.25 : 15;
g = non_linearity(beta, h, T);
plot(h, g)

%% Integrate and fire model when input is only thalamus
n_neurons = 8;
theta0 = 0;
neur_angles = -pi/2 : pi/(n_neurons-1) : pi/2;
T = 0;
beta = 0.3;

theta0 = ones(size(neur_angles))*theta0;
Is = I_ringModel(theta0, neur_angles, 3, 0.1);
g = non_linearity(beta, Is, T);

v0 = 0;
figure()
for i = 1:n_neurons
    j = 1;
    v = v0;
    subplot(4, 2, i)
    while j < 100
        v = [v IntegrateFire(v(end), 1, g(i), 0.7)];
        j = j + (length(v) -1 - j);
    end
plot(0:100, v)
end

%% rate based model when input is only thalamus
c = [1.2 1.5 4];
for i = 1:length(c)
    ringModel_thalamus(0, 0, 50, 30, 0.9, c(i));
end

%% Connections weight matrix
n_neurons = 50;
neur_angles = -pi/2 : pi/(n_neurons-1) : pi/2;
J = weights_ringModel(neur_angles, 86, 112);
image(J)

%% rate based model when input is only thalamus
c = [1.2 1.5 4];
for i = 1:length(c)
    out = ringModel(0, 0, 50, 30, 0.1, c(i));
end

%% Changing the stimulus
c = 100;
epsilon = 0.8;
act = ringModel(0, 0, 50, 30, epsilon, c);
ringModel(act(:,end), 2*pi/3, 50, 500, epsilon, c);

%% Remove the stimulus
c = 1.2;
epsilon = 0.1;
act = ringModel(0, 0, 50, 30, epsilon, c);
ringModel(act(:,end), 0, 50, 30, epsilon, c, 0);




