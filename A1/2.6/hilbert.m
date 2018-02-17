function [resNorm, errorNorm, HCond] = hilbert(n)

%Populate H and X with ones
H = ones(n,n);
x = ones(n,1);

%Generate Hilbert matrix
for i = 1 : n
    for j = 1 : n
        H(i,j) = 1/(i+j-1);
    end
end

b = H*x;

gauH = rref(H);

xApprox = b.'/gauH;

resNorm = norm(b - H*xApprox.', inf);
errorNorm = norm(xApprox - x.', inf);

HCond = cond(H);

end