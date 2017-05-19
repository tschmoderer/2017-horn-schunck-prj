%----------------------------------------------------------%
%-- FONCTION SPLINEINTERP --%
% Procède à l'interpolation lin"aire de données. 
%
%	In : 
% 	- H : Un vecteur ligne de données connues
%	- u : Un vecteur ligne où l'on veut une évaluation Spline
%       Les deux vecteurs doivent avoir la même longueur
%
% Out : 
% 	- Hu : Le vecteur des données interpolées linéairement aux aux points
%      H(x+u(x));
%
%	Auteurs : 
% 	- Timothée Schmoderer
%	- Emeric Quesnel
%
% Test : 
%
% TODO : 
%   - Ajouter un controle de la taille des parametres d'entrées 
%   - Trouver une manière d'optimiser la boucle centrale
%
%	INSA de Rouen Normandie 2017	
%		
%----------------------------------------------------------%

function Hu = splineInterp(H,u)

m = size(H,2);
B = full(gallery('tridiag',m,1,4,1));
c = (B\H')';

u = [1:m] + u;
p = round(u);
xi = u-p;

q = p-2;
r = p-1;
s = p+1;
t = p+2;

% Gestion des dépacements de capacités 
% ...
for i=1:length(u)
    if q(i) <=0
        q(i) = 1;
    end
    if q(i)>m
        q(i) = m;
    end
    if r(i) <= 0
        r(i) = 1;
    end
    if r(i) > m
        r(i) = m;
    end
    if p(i) <= 0 
        p(i) = 1;
    end
    if p(i) > m
        p(i) = m;
    end
    if s(i) <= 0
        s(i) = 1;
    end
    if s(i) > m
        s(i) = m;
    end
    if t(i) <=0
        t(i) = 1;
    end
    if t(i) > m 
        t(i) = m;
    end    
end
% Fin gestion des dépacements de capacités

Hu = c(q).*mereSpline(xi+2)+c(r).*mereSpline(xi+1)+c(p).*mereSpline(xi)+c(s).*mereSpline(xi-1)+c(t).*mereSpline(xi-2);
end
