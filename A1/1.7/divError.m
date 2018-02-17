function error = divError(h)

format long;
method = 'a';
size = 100;

f = [];
fDiv = [];
thVal = [];

for x = 1 : h : size
    f = [f sin(x)];
end

for x = 1 : h : size
    thVal = [thVal cos(x)];
end

switch method
    
    case 'a'
        for x = 1 : length(f) - 1
            div = (f(x+1) - f(x)) / h;
            fDiv = [fDiv div];
        end
        
    case 'b'
        for x = 2 : length(f) - 1
            div = (f(x+1) - f(x-1)) / (2*h);
            fDiv = [fDiv div];
        end
end

error = 0;

for i = 1 : length(fDiv)
    error = error + abs(thVal(i) - fDiv(i));
end

error = error / size;

end




