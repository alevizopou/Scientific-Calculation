n = 512;

disp('----------(a.i)----------');

A = randn(1024);
B = randn(1024);

% double mtimes
C = mtimes(A,B);

% single mtimes
CS = mtimes(single(A),single(B));
S1 = norm(CS-C,inf)/norm(C,inf)

% single Strassen
DS = strassen(single(A),single(B));
S2 = norm(DS-C,inf)/norm(C,inf)

disp('----------(a.ii)----------');

a = randn(1024,1);
b = randn(1024,1);
A = vander(a);
B = vander(b);

% double mtimes
C = mtimes(A,B);

% single mtimes
CS = mtimes(single(A),single(B));
S3 = norm(CS-C,inf)/norm(C,inf)

% single Strassen
DS = strassen(single(A),single(B));
S4 = norm(DS-C,inf)/norm(C,inf)

disp('----------(a.iii)----------');

I = eye(n);
M = 10^7;
II = [I zeros(n); zeros(n) I];
A1 = randn(n);
A2 = randn(n);
A3 = randn(n);
A4 = randn(n);
AA = [M*A1 A2; A3 A4];

% double mtimes
C = mtimes(II,AA);

% single mtimes
CS = mtimes(single(II),single(AA));
S5 = norm(CS-C,inf)/norm(C,inf)

% single Strassen
DS = strassen(single(II),single(AA));
S6 = norm(DS-C,inf)/norm(C,inf)

