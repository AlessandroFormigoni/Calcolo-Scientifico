function [tn,un] = eulero_esp_sys(odefun,tspan,y0,Nh)

d = length(y0);
tn=linspace(tspan(1),tspan(2),Nh+1);
un = zeros(Nh+1,d);
un(1,:) = y0.' % realizza la trasposta anche sui complessi

for n=1:Nh
    wn = un(n,:).';
    w = wn + h*odefun(tn(n),wn);
    un(n+1,:) = w.';
end
end
