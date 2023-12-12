close all
lambda = i;
odefun = @(t,y) lambda*y;
tspan=[0,100];
y0 = 1;

metodo = menu('scegli il metodo','EE','EI','CN','Heun');

h0 = -2*real(lambda)/abs(lambda)^2;

H = [0.01,0.1,0.5,1];
k = 0;
for h=H
    k = k +1;
    Nh = fix((tspan(2)-tspan(1))/h);
    if metodo == 1
        [tn,un] = eulero_esp(odefun,tspan,y0,Nh);
    elseif metodo == 2
        [tn,un] = eulero_imp(odefun,tspan,y0,Nh);
    elseif metodo == 3
        [tn,un] = crank_n(odefun,tspan,y0,Nh);
    elseif metodo == 4
        [tn,un] = heun(odefun,tspan,y0,Nh);
    end
    subplot(2,2,k)
    plot(tn,un,'.--');
    grid on
    xlabel('t');
    ylabel('u(n)');
    title(['h=',num2str(h)]);
end
