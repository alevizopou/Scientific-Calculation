% Preallocation
time = zeros(4,3);
k = 0;

% for-loop for matrices with size 2.^[7:10]
for n = 7:1:10
    
    % variable k is used in order to access matrix time
    k = k + 1;
    
   	A = rand(2.^n);
    b = rand(2.^n,1);
	
	% for random matrices
	f = @() mldivide(A, b);
    time(k,1) = timeit(f,1);
	
	% for lower triangular matrices
	L = tril(A);
    f = @() mldivide(L,b);
    time(k,2) = timeit(f,1);
	
	% for psychologically lower triangular matrices
	P = L(:,randperm(end));
    f = @() mldivide(P,b);
    time(k,3) = timeit(f,1);

end

time

T = [128 256 512 1024];
figure
semilogy(T,time(:,1),'go-','linewidth',1,'markersize',10);
hold on
semilogy(T,time(:,2),'rx-','linewidth',1,'markersize',10);
hold on
semilogy(T,time(:,3),'b*-','linewidth',1,'markersize',10);
legend ('Random', 'Lower', 'Psychologically lower', 'Location', 'NorthWest')
xlabel('Matrix Dimensions')
ylabel('Time (sec)')
title ('3a')
grid on
print(gcf, '-djpeg', 'ex3a.jpg')
hold off