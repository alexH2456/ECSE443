function plotErrors

errors = [];
h = [];

for i = 1 : 10
    h = [h 1/(2^i)];
    errors = [errors divError(1/(2^i))];
end

min(errors);
figure;
plot(log10(h), log10(errors));
title('Error Plot Method B');
xlabel('h');
ylabel('error');

end