function x = gaussian(mode, A, b)

n = size(A);

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
        
    case 'full'
        
end

x(n) = b(n)/A(n,n);
for i = n-1:-1:1
    x(i) = (b(i) - dot(x(i+1:n), A(i, i+1:n)))/A(i,i);
end

r = b-A*x;

end
