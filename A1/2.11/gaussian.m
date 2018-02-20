function x = gaussian(mode, A, b)

format long;
[n,~] = size(A);
x = zeros(n,1);

switch mode
    
    case 'none'
        for i = 1 : n
            p = A(i,i);
            for j = i+1 : n
                A(j, i+1 : n) = A(j, i+1 : n) - A(i, i+1 : n)*A(j,i)/p;
                b(j) = b(j) - b(i)*A(j,i)/p;
            end
        end
        
        x(n) = b(n)/A(n,n);
        
        for i = n-1:-1:1
            x(i) = (b(i) - dot(x(i+1:n), A(i, i+1:n)))/A(i,i);
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
        
end

x(n) = b(n)/A(n,n);
for i = n-1:-1:1
    x(i) = (b(i) - dot(x(i+1:n), A(i, i+1:n)))/A(i,i);
end

end
