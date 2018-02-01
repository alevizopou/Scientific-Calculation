function [x] = sum3(x)

x = sort(x);
i = 1;

for k = 1:(length(x)-1);
    x(i+1) = x(i+1) + x(i);
    x(i) = [];
    x = sort(x);
end

end

