function [xsum] = sum2(a)

x = sort(a);
xsum = 0;

for i=1:length(a);
    xsum = xsum + x(i);
end

end

