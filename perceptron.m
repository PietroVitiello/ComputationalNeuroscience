function E = perceptron(yt, x, b, alpha, iterations)
    E = [];
    p = size(x,2);
    w = zeros(size(x, 1), 1);
    for i = 1:iterations
        y = zeros(1,p);
        for p = 1:p
            %heavyside
            input = (w' * x(:,p)) - b;
            y(p) = input >= 0;

            w = w + alpha*(yt(p)-y(p))*x(:,p);
        end
        E = [E (yt-y)*(yt-y)'];
    end
end