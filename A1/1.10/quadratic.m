function roots = quadratic(a,b,c)

format long;

if (a == 0)
    roots = -c/b;
elseif ((-b + sqrt(b^2 - 4*a*c)) ~= 0 || (-b - sqrt(b^2 - 4*a*c)) ~= 0)
    xPos = (2*c) / (-b + sqrt(b^2 - 4*a*c));
    xNeg = (2*c) / (-b - sqrt(b^2 - 4*a*c));
    roots = [xNeg, xPos];
else
    xPos = (-b + sqrt(b^2 - 4*a*c)) / (2*a);
    xNeg = (-b - sqrt(b^2 - 4*a*c)) / (2*a);
    roots = [xNeg, xPos];
end

end
        