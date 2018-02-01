%format long

n = 512;
P = zeros(6,3);
%P(:,1) ---> Deiktis katastasis
%P(:,2) ---> Empros sxetiko sfalma
%P(:,3) ---> Pisw sfalma

% case 1
A = randn(n);
P(1,1) = cond(A,inf); 

% case 2
B = tril(A);
P(2,1) = cond(B,inf);

% case 3
[L,U] = lu(A);
P(3,1) = cond(U,inf);

% case 4
UC = U;
UC(n,:) = [];
UC(:,n) = [];
C = gfpp(UC);
P(4,1) = cond(C,inf);

% case 5i
d = linspace(-1,1,n);
D = vander(d);
P(5,1) = cond(D,inf);

% case 5ii
e = cos([1:n]*pi/(n+1));
E = vander(e);
P(6,1) = cond(E,inf);

%pragmatiki lusi
x = ones(n,1); 
b = A*x;

%lusi pou vrisko

% case 1
x1 = mldivide(A,b);
P(1,2) = norm(x1-x,inf)/norm(x,inf);
P(1,3) = norm((A*x1-b),inf)/(norm(A,inf)*norm(x1,inf)+norm(b,inf));

% case 2
b = B*x;
x2 = mldivide(B,b);
P(2,2) = norm(x2-x,inf)/norm(x,inf);
P(2,3) = norm((B*x2-b),inf)/(norm(B,inf)*norm(x2,inf)+norm(b,inf));

% case 3
b = U*x;
x3 = mldivide(U,b);
P(3,2) = norm(x3-x,inf)/norm(x,inf);
P(3,3) = norm((U*x3-b),inf)/(norm(U,inf)*norm(x3,inf)+norm(b,inf));

b = C*x;
x4 = mldivide(C,b);
P(4,2) = norm(x4-x,inf)/norm(x,inf);
P(4,3) = norm((C*x4-b),inf)/(norm(C,inf)*norm(x4,inf)+norm(b,inf));

b = D*x;
x5 = mldivide(D,b);
P(5,2) = norm(x5-x,inf)/norm(x,inf);
P(5,3) = norm((D*x5-b),inf)/(norm(D,inf)*norm(x5,inf)+norm(b,inf));

b = E*x;
x6 = mldivide(E,b);
P(6,2) = norm(x6-x,inf)/norm(x,inf);
P(6,3) = norm((E*x6-b),inf)/(norm(E,inf)*norm(x6,inf)+norm(b,inf));

p1 = P(:,1)
p2 = P(:,2)
p3 = P(:,3)

P(1,2)<P(1,1)*P(1,3)
P(2,2)<P(2,1)*P(2,3)
P(3,2)<P(3,1)*P(3,3)
P(4,2)<P(4,1)*P(4,3)
P(5,2)<P(5,1)*P(5,3)
P(6,2)<P(6,1)*P(6,3)
