function systemSolver()
format long;

A = [21.0, 67.0, 88.0, 73.0; 76.0, 63.0, 7.0, 20.0; 0.0, 85.0, 56.0, 54.0; 19.3, 43.0, 30.2, 29.4];
b = [141.0; 109.0; 218.0; 93.7];

invA = inv(A);

% Found by computing inverse of A and multiplying by b.
fprintf('Solution A');
x = invA*b

fprintf('Residual B');
r = b - A*x

fprintf('Solution C');
z = invA*r;
newSolution = x + z

while(r ~= 0)
    z = invA*r;
    x = x+z;
    r = b - A*x;
end

fprintf('Solution D');
x
z
r

end