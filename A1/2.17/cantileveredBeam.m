function cantileveredBeam()

format long;

n = 100;

b = ones(n,1);

A = spdiags([b, -4*b, 6*b, -4*b, b], -2:2, n, n);
A(1,1) = 9;
A(n-1, n-1) = 5;
A(n,n) = 1;
A(n,n-1) = -2;
A(n-1,n) = -2;

tic;
xSparse = A\b;
tSparse = toc;

tic;
xDense = full(A)\b;
tDense = toc;

fprintf('\nPart A:\n\n');
fprintf('tSparse: %i\n', tSparse);
fprintf('tDense: %i\n', tDense);
fprintf('Norm xSparse-xDense: %i\n', norm(xSparse-xDense, inf));

n = 1000;

b = ones(n,1);
A = spdiags([b, -4*b, 6*b, -4*b, b], -2:2, n, n);
A(1,1) = 9;
A(n-1, n-1) = 5;
A(n,n) = 1;
A(n,n-1) = -2;
A(n-1,n) = -2;

R = spdiags([b -2*b b], 0:2, n, n);
R(1,1) = 2;

fprintf('\nPart B\n\n');
fprintf('Norm RR^T - A: %i\n', norm(R*R'-A, inf));
fprintf('cond(A): %i\n', condest(A));

xSparse = A\b;
rSparse = b-A*xSparse;
fprintf('resnormSparse: %i\n', norm(rSparse, inf));

xTri = R'\(R\b);
rTri = b-A*xTri;
fprintf('resnormTri: %i\n', norm(rTri, inf));

fprintf('errNorm: %i\n', norm(xSparse - xTri, inf));

end