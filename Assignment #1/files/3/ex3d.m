% Preallocation
time = zeros(4,2);
k = 0;

% for-loop for matrices with size 2.^[7:10]
for n = 7:1:10
    
    % variable k is used in order to access matrix time
    k = k + 1;
    
   	A = rand(2.^n);
    b = rand(2.^n,1);
	I = eye(2.^n);
	
	f = @() I*A;
    time(k,1) = timeit(f, 1);
    
    f = @() A*A;
    time(k,2) = timeit(f, 1);
	
end

time

T = [128 256 512 1024];
figure
%semilogy(T,time(:,1),'go-','linewidth',1,'markersize',10);
plot(T,time(:,1),'go-','linewidth',1,'markersize',10);
hold on
%semilogy(T,time(:,2),'rx-','linewidth',1,'markersize',10);
plot(T,time(:,2),'rx-','linewidth',1,'markersize',10);
legend ('IA', 'AA', 'Location', 'NorthWest')
xlabel('Matrix Dimensions')
ylabel('Time (sec)')
title ('3d')
grid on
print(gcf, '-djpeg', 'ex3d.jpg')
hold off