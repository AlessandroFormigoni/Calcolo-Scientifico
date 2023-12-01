function [tn,un] = eulero_esp(odefun,tspan,y0,Nh)
% Eulero_esp: metodo di eulero in avanti x approx di ODE
 t0 = tspan(1);
 T = tspan(2);
 tn = linspace(t0,T,Nh+1)';  %N passi + istante iniziale
 un = zeros(Nh+1,1);

 un(1) = y0;
 h = (T-t0)/Nh;

 for n=1:Nh
     un(n+1) = un(n)+h*odefun(tn(n),un(n));
 end
 


