function i = simpsonc(f,a,b,M)
i = 0;
x = linspace(a,b,M+1);
for k=2:length(x)
    i = i + (x(k)-x(k-1))/6*(f(x(k-1)) + 4*f((x(k-1)+x(k))/2) + f(x(k)));
end