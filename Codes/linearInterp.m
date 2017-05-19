%----------------------------------------------------------%
%-- FONCTION LINEARINTERP --%
% Procède à l'interpolation lin"aire de données. 
%
%	In : 
% 	- H : Un vecteur ligne de données connues
%	- u : Un vecteur ligne donnant le champ de déplacement
%       Les deux vecteurs doivent avoir la même longueur
%
% Out : 
% 	- Hu : Le vecteur des données interpolées linéairement aux aux points
%     H(x+u(x));
%
%	Auteurs : 
% 	- Timothée Schmoderer
%	- Emeric Quesnel
%
% TODO : 
%   - Ajouter un controle de la taille des parametres d'entrées 
%   - Trouver une manière d'optimiser la boucle centrale
%
%	INSA de Rouen Normandie 2017	
%		
%----------------------------------------------------------%

function Hu = linearInterp(H,u)
H = [H(1),H,H(end)];
m = size(H,2);
u = [0,u,0];
j = [1:m] + u;
p = floor(j);
Xi = j - p;

% Gestion des dépacements de capacités 
% ...
for i=1:length(u)
    if p(i)+1<=0
        p(i) = 0;
    end
    if p(i)+1 > m
        p(i) = m-1;
    end
    if p(i)>m
        p(i) = (m);
    end
    if p(i)<=0
       p(i) = 1;  
    end
end
% Fin Gestion des dépacements de capacités

Hu = H(p).*(1-Xi)+H(p+1).*Xi;
Hu = Hu(2:end-1);
end

