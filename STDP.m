% Spike Timing Dependent Plasticity

function [x, y, w] = STDP(x, y, w, tau_x, tau_y, t, tf_pre, tf_post, A_pre, A_post, dt)
    %dirac delta function
    delta_pre = 0;
    delta_post = 0;
    if any(tf_pre == t)
        delta_pre = 1;
    end
    if any(tf_post == t)
        delta_post = 1;
    end
    
    %update spike distance function
    x = eulerMethod(x, dt, delta_pre, tau_x);
    y = eulerMethod(y, dt, delta_post, tau_y);
    
    %update synaptic weight
    dwdt = A_pre*x*delta_post - A_post*y*delta_pre;
    w = w + (dt/1000)*(dwdt);
end