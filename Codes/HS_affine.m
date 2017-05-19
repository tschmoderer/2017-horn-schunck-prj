function [u v] = HS_affine(I1,I2,N,sigma,nu,alpha,eps,niter)

n = size(I1);

% Filtre
I1 = gauss(I1,N,sigma);
I2 = gauss(I2,N,sigma);
[tmpu tmpv] = HS(I1,I2,alpha,eps,niter);

% Redimensionnement
I1r = redim(I1,nu);
I2r = redim(I2,nu);

% Calcul flot h réduit
[ur vr] = HS(I1r,I2r,alpha,eps,niter);
% Remise du flot à taille
uh = redim(ur,1/nu);
vh = redim(vr,1/nu);

% Précaution dans les erreurs d'arrondi 
uh = uh(1:n(1),1:n(2));
vh = vh(1:n(1),1:n(2));

% Décalage de l'image2
I3 = I2;
for i=1:n(1)
    I3(i,:) = linearInterp(I2(i,:),-uh(i,:));
end
for i=1:n(2)
    I3(:,i) = linearInterp(I3(:,i)',-vh(:,i)')'; 
end

% Calcul de k
[uk vk] = HS(I1,I3,alpha,eps,niter);

u = uh + uk;
v = vh + vk;

plotFlow(u,v,I1,4);
title('Flot affiné');
plotFlow(tmpu,tmpv,I1,4);
title('Flot initial');
plotFlow(u-tmpu,v-tmpv,I1,4);
title('Différence des flots');
end

