function gaussianElim()

xExact = ones(2,1);
rNormA = [];
rNormB = [];
errNormA = [];
errNormB = [];

for k = 1 : 10
    eps = 10^(-2*k);
    A = ones(2,2);
    A(1,1) = eps;
    b = [1+eps; 2];
    x = zeros(2,1);
    
    A(2,:) = A(2,:) - A(1,:)/eps;
    b(2,:) = b(2,:) - b(1,:)/eps;
    
    x(2) = b(2,1) / A(2,2);
    x(1) = (b(1,1) - A(1,2) * x(2)) / eps;
    
    % Part A
    r = b-A*x;
    rNormA = [rNormA, norm(r, inf)];
    errNormA = [errNormA, norm(x-xExact, inf)];
    
    % Part B
    r(2) = r(2)- r(1)/eps;
    iter = zeros(2,1);
    iter(2) = r(2)/A(2,2);
    iter(1) = (r(1)-A(1,2)*iter(2))/eps;
    
    x = x + iter;
    r = b-A*x;
    rNormB = [rNormB, norm(r, inf)];
    errNormB = [errNormB, norm(x-xExact, inf)];
end

k = 1 : 10;
figure
plot(k, rNormA);
hold on
plot(k, errNormA);
xlabel('K');
ylabel('Norm');
title('Part A');
% legend('residual', 'error');

figure
plot(k, rNormB);
hold on
plot(k, errNormB);
xlabel('K');
ylabel('Norm');
title('Part B');
% legend('residual', 'error');

end

