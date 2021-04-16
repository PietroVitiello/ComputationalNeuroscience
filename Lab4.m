
v0 = 0;
seq_length = 100;
I = [9 11 15];
v_threshold = 10;
tao = 10;
R = 1;

figure()
hold on
xlabel('time (ms)')
ylabel('voltage')

for i = 1:length(I)
    j = 1;
    v = v0;
    while j < seq_length
        v = [v IntegrateFire(v(end), 1, I(i))];
        j = j + (length(v) -1 - j);
    end
plot(0:seq_length, v)
end