%----------------------------------------------------------%
%-- FONCTION CHALEUR --%
% Applique l'équation de la chaleur à une image
% dI/dt - Nabla u = 0
% I(t=0) = I0
%	Conditions de Neumann au bords
%   Renvoie une image floutée
% 
%	In : 
% 	- I : une image 
%	- T : le temps final
% 	- dt : le pas de temps
%
% Out : 
% 	- J : l'image floutée
%
%	Auteurs : 
% 	- Timothée Schmoderer
%	- Emeric Quesnel
%
% Test : 
%	I = 100*ones(100,100);
%	T = 2;
% 	dt = 0.2;
%	imshow(chaleur(I,T,dt),[0,255]);
%
%	INSA de Rouen Normandie 2017	
%		
%----------------------------------------------------------%


function J = chaleur(I,T,dt)
J = I;
t = 0:dt:T;
% pour la discétisation du lalacien
s = [0 1 0;1 0 1;0 1 0];

for k=1:length(t)-1
J = J + dt*(conv2(J,s,'same')-4*J);
end
end