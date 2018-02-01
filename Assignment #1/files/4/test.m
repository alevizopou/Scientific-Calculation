function [ output_args ] = test(p, col)

n = 2.^[8:11];

for i = 1:length(n)
    u = rand(n(i),1);
    v = rand(n(i),1);
    
    %time using col
    f = @() my_func(p,u,v,col);
    tcol(i) = timeit(f);
    
	%Mflop/s using col
    m1(i) = (2*n(i)^2 + p*n(i)*(2*n(i)-1))/(tcol(i)*10^6);
    
    %time without col
    f = @() my_func(p,u,v);
    t(i) = timeit(f);
        
	%Mflop/s without col
    m2(i) = (2*n(i)^2 + (2*n(i)-1)*n(i)^2*(p-1))/(t(i)*10^6);
end

tcol
t
m1
m2

figure(1);
%plot(n,tcol,'rx-',n,t,'bo-','linewidth',1,'markersize',10);
semilogy(n,tcol,'rx-',n,t,'bo-','linewidth',1,'markersize',10);
legend ('using col', 'without col', 'Location', 'NorthWest')
xlabel('Matrix Dimensions')
ylabel('Time (sec)')
title ('Execution Time of my_func')
grid on
print(gcf, '-djpeg', 'ex4da.jpg')
hold off

figure(2);
plot(n,m1,'rx-',n,m2,'bo-','linewidth',1,'markersize',10);
legend ('using col', 'without col', 'Location', 'NorthWest')
xlabel('Matrix Dimensions')
ylabel('Mflop/s')
title ('Mflop/s')
grid on
print(gcf, '-djpeg', 'ex4db.jpg')
hold off
