function [x, xAns, resNorm, errNorm] = gaussian(mode, n)

format long;

A = randn(n);
b = randn(n,1);

disp(A);
disp(b);

[n,~] = size(A);
x = zeros(n,1);
xAns = linsolve(A,b);

switch mode
    
    case 'none'
        for i = 1 : n
            p = A(i,i);
            for j = i+1 : n
                A(j, i+1 : n) = A(j, i+1 : n) - A(i, i+1 : n)*A(j,i)/p;
                b(j) = b(j) - b(i)*A(j,i)/p;
            end
        end
        
    case 'partial'
        
        for i = 1 : n
            
            [~, maxNum] = max(abs(A(i:n,i)));
            maxNum = maxNum + i - 1;
            p = A(maxNum, i);
            
            if i ~= maxNum
                tempA = A(i, i:n);
                A(i, i:n) = A(maxNum, i:n);
                A(maxNum, i:n) = tempA;
                
                tempB = b(i);
                b(i) = b(maxNum);
                b(maxNum) = tempB;
            end
            
            for j = i+1 : n
                A(j, i+1 : n) = A(j, i+1 : n) - A(i, i+1 : n)*A(j,i)/p;
                b(j) = b(j) - b(i)*A(j,i)/p;
            end
        end
        
    case 'full'
        
        idx = 1:n;
        for i = 1:n
            [maxA, maxNum] = max(A(i:n, i:n));
            [~, maxPiv] = max(maxA);
            maxK = maxNum(maxPiv)+i-1;
            maxPiv = maxPiv+i-1;
            p = A(maxK,maxPiv);
            
            if i ~= maxPiv
                temp = A(:,i);
                A(:,i) = A(:,maxPiv);
                A(:,maxPiv) = temp;
                
                tempB = idx(i);
                idx(i) = idx(maxPiv);
                idx(maxPiv) = tempB;
            end
            
            if i ~= maxK
                temp = A(i,:);
                A(i,:) = A(maxK,:);
                A(maxK,:) = temp;
                
                tempB = b(i);
                b(i) = b(maxK);
                b(maxK) = tempB;
            end
            
            for j = i+1:n
                A(j,i+1:n) = A(j,i+1:n) - A(i,i+1:n)*A(j,i)/p;
                b(j) = b(j) - b(i)*A(j,i)/p;
            end
        end
end

x(n) = b(n)/A(n,n);
for i = n-1:-1:1
    x(i) = (b(i) - dot(x(i+1:n), A(i, i+1:n)))/A(i,i);
end

r = b-A*x;
resNorm = norm(r, inf);
errNorm = norm(x-xAns, inf);

end
