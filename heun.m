function [tn,un] = heun(odefun,tspan,y0,Nh)

t0 = tspan(1);
 T = tspan(2);
 tn = linspace(t0,T,Nh+1)';  %N passi + istante iniziale
 un = zeros(Nh+1,1);

 un(1) = y0;
 h = (T-t0)/Nh;

 for n=1:Nh
     ustar = un(n)+h*odefun(tn(n),un(n));
     un(n+1) = un(n) + h/2*(odefun(tn(n),un(n))+odefun(tn(n+1),ustar));
 end
 


