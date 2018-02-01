tic;
toc;
t = zeros(30,1);
for i = 1:30
    tic;
    t(i) = toc;
end
time = sum(t)./30
