%----------------------------------------------------------%
%-- FONCTION HS_Amm--%
% Construit le flot de déplacement entre deux images 
%
%	In : 
% 	- I1 : Une image
%	- I2 : Une seconde image légrement décalée de la première
%   	Les deux images doivent être de même dimensions
%   - alpha : le facteur pénalisant
%   - eps : la précision requise
%   - niter : le nombre maximal d'itération 
%
% 	Out : 
% 	- u : une matrice de la taille I1, donnant le champ de dépalcement horizontal en chaque point
%   - v : une matrice de la taille I1, donnant le champ de dépalcement vertical en chaque point
%
%	Auteurs : 
% 	- Timothée Schmoderer
%	- Emeric Quesnel
%
% TODO : 
%   - Ajouter un controle de la taille des parametres d'entrées 
%   
%	INSA de Rouen Normandie 2017	
%		
%----------------------------------------------------------%

function [u, v] = HS_Amm(I1,I2,alpha,eps,niter)

% Pour éviter la division par 0
gamma = 1000;

[Ix,Iy,It] = deriv(I1,I2);

Ix2 = Ix.^2;
Iy2 = Iy.^2;

C = ((Ix2+Iy2+2*gamma).^-1)*alpha^2*gamma + Ix2 + Iy2;

u = zeros(size(I1));
v = u;

norme = 1;
k=0;

while norme > eps && k < niter
uAvg = reduc(u);
vAvg = reduc(v);

tmp = ((Ix.*uAvg)+(Iy.*vAvg)+It)./C;
u0 = uAvg - Ix.*tmp;
v0 = vAvg - Iy.*tmp;

k=k+1;
norme = trace((u-u0)'*(u-u0)) + trace((v-v0)'*(v-v0));
u = u0;
v = v0;
end
end
