function [xsum] = sum1(x)

xsum = 0;

for i=1:length(x);
    xsum = xsum + x(i);
end

end