clear all

%% BCM
T = 10;
dt = 1;
eta = 10^(-6);
y0 = 10;
tau = 50;
x = [20 0; 0 20]';
time = 0:dt/1000:T;

y1 = [10];
y2 = [10];
w1 = [0.5];
w2 = [0.5];
th = [5];

for t = time
    stimulus = randi(2);
    w = [w1(end) w2(end)]';
    [y_t, w_t, th_t] = BCM(x(:,stimulus), w, th(end), eta, tau, y0, dt);
    if stimulus == 1
        y1 = [y1 y_t];
        y2 = [y2 y2(end)];
    else
        y2 = [y2 y_t];
        y1 = [y1 y1(end)];
    end
    w1 = [w1 w_t(1)];
    w2 = [w2 w_t(2)];
    th = [th th_t];
end

figure()
subplot(3,1,1)
hold on
plot(time, y1(1:end-1))
plot(time, y2(1:end-1))

subplot(3,1,2)
hold on
plot(time, w1(1:end-1))
plot(time, w2(1:end-1))

subplot(3,1,3)
plot(time, th(1:end-1))

%% STDP
A_pre = 1;
A_post = 1;
tau_pre = 10;
tau_post = 20;
dt = 1;
dw = [];

lags = -50:5:50;
tf_pre = (1:60)*1000;

for lag = lags
    tf_post = tf_pre - lag;
    t = min([tf_pre(1) tf_post(1)]);
    t_stop = max([tf_pre(end) tf_post(end)]);
    
    w = 1;
    x = 0;
    y = 0;
    while t <= t_stop
        [x, y, w] = STDP(x, y, w, tau_pre, tau_post, t, tf_pre, tf_post, A_pre, A_post, dt);
        t = t + dt;
    end
    dw = [dw w-1];
end

figure()
plot(lags, dw)



