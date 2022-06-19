clear all
b = 1;
alpha = 1;

%% OR gate
x = [0 0 1 1; 0 1 0 1];
y = [0 1 1 1];

E = perceptron(y, x, b, alpha, 10);
figure()
plot(E)

%% XOR gate
y = [0 1 1 0];

E = perceptron(y, x, b, alpha, 10);
figure()
plot(E)

%% Random sequence
n = 100;
p = 50; %if p<n the assured convergence

x = randi(2, n, p)-1;
y = randi(2, 1, p)-1;

E = perceptron(y, x, b, alpha, 50);
figure()
plot(E)