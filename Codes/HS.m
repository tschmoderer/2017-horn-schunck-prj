%----------------------------------------------------------%
%-- FONCTION HS--%
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


function [u v] = HS(I1,I2,alpha,eps,niter)

% Calcul des dérivées spatiales et temporel de l'intensité
[Ix,Iy,It] = deriv(I1,I2);

% Intialisation
u = zeros(size(I1));
v = u;
erreur = 1;
k = 0;
C = alpha^2+Ix.^2+Iy.^2;

while erreur > eps && k < niter
    % Calcul de ubar et vbar pour l'approximation du laplacien
    uAvg = reduc(u);
    vAvg = reduc(v);
    
    % Sauvegarde du second membre qui apparait dans les deux 
    %	équations du système
    tmp = ((Ix.*uAvg)+(Iy.*vAvg)+It)./C;
   
    % Calcul de l'itération suivante
    u0 = uAvg - Ix.*tmp;
    v0 = vAvg - Iy.*tmp;
    
    k = k + 1;
    % Calcul de la norme de l'erreur
    erreur = trace((u-u0)'*(u-u0)) + trace((v-v0)'*(v-v0));
    u = u0;
    v = v0;
end
k
end
