function I = I_ringModel(theta0, theta, c, epsilon)
    I = c * ((1-epsilon) + epsilon*cos(2*(theta - theta0)));
end