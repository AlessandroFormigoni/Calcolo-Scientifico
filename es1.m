%Eq diff
%definisco i dati
odefun = @(t,y) t-y;

tspan = [-1,3];
y0 = 1;
h = 0.01;

Nh = fix((tspan(2)-tspan(1))/h);

[tn,un] = eulero_esp(odefun,tspan,y0,Nh);

figure(1); clf
plot(tn,un,'o--')
grid on
xlabel('t');
ylabel('u');

%sol esatta
yex = @(t) t-1+3*exp(-(t+1));
hold on
fplot(yex,tspan);

%calcolo errore
err = max(abs(yex(tn)-un));
fprintf('h=%f, errore = %e \n', h, err);