%Erwthma 2bi
disp('----------2bi----------');
 
for n = 1:64
    x(n) = -2*pi^(n-1)/factorial(n-1);
end

% double
d1 = sum1(x);
d2 = sum2(x);
d3 = sum3(x);
d4 = pichat(x);

% single
x_single = single(x);
s1 = sum1(x_single);
s2 = sum2(x_single);
s3 = sum3(x_single);
s4 = pichat(x_single);

diafora1 = norm(s1-d1,inf)
diafora2 = norm(s2-d2,inf)
diafora3 = norm(s3-d3,inf)
diafora4 = norm(s4-d4,inf)

%Erwthma 2bii
disp('----------2bii----------');

x = zeros(4096,1);
x(1:2047) = 1.0;
x(2048:2049) = 1.0e-18;
x(2050:4096) = -1.0;

% double
d1 = sum1(x);
d2 = sum2(x);
d3 = sum3(x);
d4 = pichat(x);

% single
x_single = single(x);
s1 = sum1(x_single);
s2 = sum2(x_single);
s3 = sum3(x_single);
s4 = pichat(x_single);

diafora1 = norm(s1-d1,inf)
diafora2 = norm(s2-d2,inf)
diafora3 = norm(s3-d3,inf)
diafora4 = norm(s4-d4,inf)

%Erwthma 2biii
disp('----------2biii----------');

x = linspace(1,2,4096);

% double
d1 = sum1(x);
d2 = sum2(x);
d3 = sum3(x);
d4 = pichat(x);

% single
x_single = single(x);
s1 = sum1(x_single);
s2 = sum2(x_single);
s3 = sum3(x_single);
s4 = pichat(x_single);

diafora1 = norm(s1-d1,inf)
diafora2 = norm(s2-d2,inf)
diafora3 = norm(s3-d3,inf)
diafora4 = norm(s4-d4,inf)

%Erwthma 2biv
disp('----------2biv----------');

for i = 1:4096
    x(i) = 1/(i^2);
end

% double
d1 = sum1(x);
d2 = sum2(x);
d3 = sum3(x);
d4 = pichat(x);

% single
x_single = single(x);
s1 = sum1(x_single);
s2 = sum2(x_single);
s3 = sum3(x_single);
s4 = pichat(x_single);

diafora1 = norm(s1-d1,inf)
diafora2 = norm(s2-d2,inf)
diafora3 = norm(s3-d3,inf)
diafora4 = norm(s4-d4,inf)