format longE
xa = 3e-4; xb = 14e-4; T = 213;
f = @(x) 2.39e-11./(x.^5.*(exp(1.432./(T*x))-1));

x = linspace(xa,xb,51);
y = f(x);

It = trapz(x,y)

H = (xb-xa)/50;
syms x
fs = 2.39e-11./(x.^5.*(exp(1.432./(T*x))-1));
fs2 = diff(fs,2);
f2 = matlabFunction(fs2);
x1 = linspace(xa,xb,1000);
y2 = f2(x1);
maxf2 = norm(y2,'inf');
stima = (xb-xa)/12*H^2*maxf2

Hstar = sqrt(12e-10/((xb-xa)*maxf2));
Mstar = ceil((xb-xa)/Hstar);

x2 = linspace(xa,xb,Mstar);
y3 = f(x2);
It2 = trapz(x2,y3)
ys = f2(x2);
maxf3 = norm(ys,'inf');
stimas = (xb-xa)/12*Hstar^2*maxf3





