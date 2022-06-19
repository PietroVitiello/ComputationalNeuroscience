function [y, w, th] = BCM(x, w, th, eta, tau, y0, time_step)
    y = w' * x;
    
    w = eulerMethod(w, time_step, x*y*(y - th) + w, 1/eta);
    th = eulerMethod(th, time_step, y^2/y0, tau);
    
    w = w - ((w<0).*w);
end