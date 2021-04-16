function g = non_linearity(beta, h, T)
%     g = h <= (T + 1/beta);
%     g = beta*(h-T) .* (g - (h < T));
%     g = g + (h > (T + 1/beta));
    
    g = (h>T).*(beta*(h - T));
    g = (g<1).*(g-1)+1;
end