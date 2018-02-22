function [x,xAns] = gaussian(mode, A, b)

format long;
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
        % Working but need to refactor code
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
        % NOT WORKING
        for k = 1:n-1
            [maxc, rowidx] = max(abs(A(k:n, k:n)));
            [maxm, colidx] = max(maxc);
            row = rowidx(colidx) + k - 1;
            col  = colidx + k - 1;
            A([k,row],:) = A([row,k],:);
            A(:,[k,col]) = A(:,[col,k]);
            if A(k,k) == 0
                break
            end
        end
end

x(n) = b(n)/A(n,n);
for i = n-1:-1:1
    x(i) = (b(i) - dot(x(i+1:n), A(i, i+1:n)))/A(i,i);
end

end
