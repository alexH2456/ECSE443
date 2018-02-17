function polynomial

format long;
simple = [];
expanded = [];
xAxis = 0.995 : 0.0001 : 1.005;

for x = 0.995 : 0.0001 : 1.005
    simpleEq = (x-1)^6;
    expandedEq = x^6 - 6*x^5 + 15*x^4 - 20*x^3 + 15*x^2 - 6*x + 1;
    
    simple = [simple simpleEq];
    expanded = [expanded expandedEq];
end

simple = simple./2*10^14;
expanded = expanded./2*10^14;

figure;
stem(xAxis, simple, 'r');
hold on
stem(xAxis, expanded, 'b');
legend('simple', 'expanded');
xlabel('x');
ylabel('y-scaled');
title('Comparison between simplified and expanded forms');

end
