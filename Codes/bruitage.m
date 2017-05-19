%----------------------------------------------------------%
%-- FONCTION BRUITAGE --%
% Applique un bruit uniforme à chaque pixel de l'image 
% Renvoie une image bruitée
% 
%	In : 
% 	- I : une image 
%	- range : la plage d'application de bruit uniforme 
%
% Out : 
% 	- J : l'image bruitée
%
%	Auteurs : 
% 	- Timothée Schmoderer
%	- Emeric Quesnel
%
% Test : 
%	I = 100*ones(100,100);
%	range = 50;
%	imshow(bruitage(I,range),[0,255]);
%
%	INSA de Rouen Normandie 2017	
%		
%----------------------------------------------------------%

function J = bruitage(I,range)
J = I + round(2*range*rand(size(I))-range);
end 