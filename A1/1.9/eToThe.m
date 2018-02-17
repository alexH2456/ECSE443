function exponent = eToThe(x)

format long;
i = 1;
rem = 1;
exponent = 1;
negative = false;

while(abs(rem) > 10^-6)
    if (x < 0)
        x = abs(x);
        negative = true;
    end
    exponent = exponent + x^i/factorial(i);
    i = i + 1;
    rem = (exponent*x)^i / factorial(i);
end

real = exp(x);

if (negative)
    x = abs(x);
    exponent = 1 / exp(x);
end

end
    

