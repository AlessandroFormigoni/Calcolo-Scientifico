function i = pmc(f,a,b,M)
i = 0;
H = (b-a)/M;
x = linspace(a,b,M+1);
for k=2:length(x)
    i = i + f((x(k-1)+x(k))/2)*(x(k)-x(k-1));
end
