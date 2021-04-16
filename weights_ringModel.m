function J = weights_ringModel(theta, j0, j2)
    N = length(theta);
    thetai = repmat(theta, N, 1);
    thetaj = repmat(theta', 1, N);
    J = -j0 + j2*cos(2*(thetai-thetaj));
end