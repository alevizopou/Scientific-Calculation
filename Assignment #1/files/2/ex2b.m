% Preallocation
time1 = zeros(4,1);
time2 = zeros(4,1);
k = 0;

% for-loop for matrices with size 2.^[7:10]
for n = 7:1:10
    
    % variable k is used in order to access matrix time
    k = k + 1;
    
   	A = rand(2.^n);
    b = rand(2.^n,1);
	
	% These executions are not considered
    tic;
    toc;
	[L,U] = lu(A);
    y = A*b;
   
    % counting the execution time of lu(X)
    elapsed = 0;
    for i = 1:1:20
        % counting lu(X)
        tic;
        [L,U] = lu(A);
        elapsed = elapsed + toc;
    end
    time1(k) = elapsed/20;
    
	% counting the execution time of A*b
    elapsed = 0;
    for i = 1:1:30
        % counting A*b
        tic;
        y = A*b;
        elapsed = elapsed + toc;
    end
    time2(k) = elapsed/30;
end

time1
time2

T = [128 256 512 1024];
figure
semilogy(T,time1,'go-','linewidth',1,'markersize',10);
%plot(T,time1,'go-','linewidth',1,'markersize',10);
hold on
semilogy(T,time2,'rx-','linewidth',1,'markersize',10);
%plot(T,time2,'rx-','linewidth',1,'markersize',10);
legend('lu(A)','A*b','Location','NorthWest')
xlabel('Matrix Dimensions')
ylabel('Time (sec)')
title('2.ii.b')
grid on
print(gcf, '-djpeg', 'ex2iib.jpg')
hold off