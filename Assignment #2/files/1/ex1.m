format long

k = [15:2:25];
values = zeros(6,2);

for i = 1:length(k)
    
    % Ypologismos suntelestwn apo tis gnwstes rizes
    coefficients = poly(1:k(i));
    solutions = [1:k(i)];
    disp(strcat('Coefficients for k= ', num2str(k(i))));
    coefficients'
    disp(strcat('Roots for k= ', num2str(k(i))));
    disp('............');
    r = roots(coefficients)
    
    % Ypologismos timwn tou ka8e polywnumoy sta x = 1, x = n
    values(i, [1 2]) = polyval(coefficients,[1 k(i)]);
    
    figure
    subplot(2,1,1), plot([1:k(i)], 'k*', 'Markersize', 5)
    title('theoritical solutions')
    xlabel('solution number')
    ylabel('values')
    subplot(2,1,2), plot(real(r), imag(r), 'r*')
    title('solutions computed by roots')
    xlabel('real part')
    ylabel('imaginary part')
    
end
