% per leggere l’immagine dal file
filename ='mozilla-logo-617';
type ='png';

A = imread ( filename , type );

figure(1); clf
image(A)
axis equal
%% converto in doppia precisione i canali
R = double(A(:,:,1));
G = double(A(:,:,2));
B = double(A(:,:,3));

%visualizzo i rossi
[n,m] = size(R);
figure(2); clf
p = surf(R(n:-1:1,:));
set(p,'Edgecolor','none')
%Definiamo una mappa di colori di solo rosso
color = zeros(64,3);
color(:,1) = linspace(0,1,64);
colormap(color)
colorbar

%% visualizzo i verdi
[n,m] = size(G);
figure(3); clf
p = surf(G(n:-1:1,:));
set(p,'Edgecolor','none')
%Definiamo una mappa di colori di solo rosso
color = zeros(64,3);
color(:,2) = linspace(0,1,64);
colormap(color)
colorbar

%% visualizzo i blu
[n,m] = size(B);
figure(4); clf
p = surf(B(n:-1:1,:));
set(p,'Edgecolor','none')
%Definiamo una mappa di colori di solo rosso
color = zeros(64,3);
color(:,3) = linspace(0,1,64);
colormap(color)
colorbar

%% costruisco una funzione intensità di colore uguale alla media dei tre colori
Z = (R+G+B)/3;
figure(5); clf
p = surf(Z(n:-1:1,:));
set(p,'Edgecolor','none');
colorbar; colormap('cool')

%% calcolo le derivate parziali
sel = 1;

%Metodo derivate parziali
if sel == 0
    gx = zeros(n,m);
    gy = zeros(n,m);
    
    for i=2:n-1
        for j=2:m-1
            gx(i,j) = (Z(i,j+1)-Z(i,j-1))/2; %df/dx
            gy(i,j) = -(Z(i+1,j)-Z(i-1,j))/2;   %Righe orientate dall'alto verso il basso
        end
    end
    
    %calcolo la norma del gradiente
    normaGrad = sqrt(gx.^2+gy.^2);
    %calcolo il valore medio della norma del gradiente
    mediaGrad = sum(sum(normaGrad))/(n*m);
            
    %selezione di pixel in cui normaGrad > 1.5*mediaGrad
    edgeGrad = 255*uint8(ones(n,m));

    for j = 1:m
        for i = 1:n
            if(normaGrad(i,j)>1.5*mediaGrad)
                edgeGrad(i,j) = 0;
            end
        end
    end

%Metodo Laplaciano
elseif sel == 1
    lap = zeros(n,m);
    for i=2:n-1
        for j=2:m-1
            lap(i,j) = abs(Z(i+1,j) - 2*Z(i,j) + Z(i-1,j) + Z(i,j+1) - 2*Z(i,j) + Z(i,j-1));
        end
    end

     %calcolo il valore medio della norma del gradiente
     mediaGrad = sum(sum(lap))/(n*m);
            
     %selezione di pixel in cui normaGrad > 1.5*mediaGrad
     edgeGrad = 255*uint8(ones(n,m));

for j = 1:m
    for i = 1:n
        if(lap(i,j)>1.5*mediaGrad)
            edgeGrad(i,j) = 0;
        end
    end
end

end

%visualizzo
figure(6);
image(edgeGrad); colormap(gray(256));

%visualizzo normaGrad
figure(7); clf
p = surf(normaGrad(n:-1:1,:));
set(p,'Edgecolor','none');
view([0 90])