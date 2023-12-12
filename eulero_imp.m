function [tn,un] = eulero_imp(odefun,tspan,y0,Nh,varargin)

t0 = tspan(1);
T = tspan(2);
tn = linspace(t0,T,Nh+1)';
un = zeros(Nh+1,1);

if nargin == 4
    tol = 1e-8;
    kmax = 20;
elseif nargin==5
    tol = varargin{1};
    kmax = 20;
else
    tol = varargin{1};
    kmax = varargin{2};
end

un(1) = y0;
h = (T-t0)/Nh;
r = @(x) x - un(1) - h*odefun(tn(2),x);
zero = secant(r,un(1),un(1)+h,tol,kmax);
un(2) = zero;

for n=2:Nh
    r = @(x) x-un(n)-h*odefun(tn(n+1),x);
    un(n+1) = secant(r,un(n),un(n-1),tol,kmax);
end

