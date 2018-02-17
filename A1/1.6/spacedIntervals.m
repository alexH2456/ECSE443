function x = spacedIntervals(a, b, n)

format long;
h = (b - a) / n;

x = [];

interval = 'b';

switch interval
    
    case 'a'
        x = [x a];
        
        for k = 2 : (n + 1)
            next = x(k - 1) + h;
            x = [x next];
        end
        
    case 'b'
        for k = 0 : n
            next = a + k * h;
            x = [x next];
        end
end

end
