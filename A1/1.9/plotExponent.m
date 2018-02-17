function plotExponent

exponent = [];
expReal = [];

values = [-1,1,-5,5,-10,10,-15,15,-20,20];

for i = 1 : length(values)
    exponent = [exponent, eToThe(values(i))];
    expReal = [expReal, exp(values(i))];
end

figure;
a1 = subplot(2,1,1);
a2 = subplot(2,1,2);
scatter(a1, values, log10(exponent));
scatter(a2, values, log10(expReal), 'filled', 'd');
xlabel('x');
ylabel('exp(x)');
title('Series vs built-in function');

end



    