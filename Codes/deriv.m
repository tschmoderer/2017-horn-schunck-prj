%----------------------------------------------------------%
%-- FONCTION DERIV --%
% 	Calcul les gradients d'intensité en espace et en temps entre deux images
% 	[Ix,Iy,It] = des matrics dont les composantes sont des approximations des dérivées partielles d'intensité. 
% 
%	In : 
% 	- I1, I2 : deux images de memes dimensions 
%
% 	Out : 
% 	- Ix : approximation de la dérivée partielle de l'intensité suivant x
% 	- Iy : approximation de la dérivée partielle de l'intensité suivant y
% 	- It : approximation de la dérivée partielle de l'intensité dans le temps
%
%	Auteurs : 
% 	- Timothée Schmoderer
%	- Emeric Quesnel
%
% 	Test : 
%		I1, I2 : deux images de même dimensions
%		[Ix,Iy,It] = deriv(I1,I2);
%
%	TODO : 
%	- Creer un test pour gérer l'erreur en cas d'entrées de deux images de tailles diférentes
%
%	INSA de Rouen Normandie 2017	
%		
%----------------------------------------------------------%

function [Ix,Iy,It] = deriv(I1,I2)
    Ix = conv2(I1+I2,0.25* [-1 1; -1 1],'same');
    Iy = conv2(I1+I2,0.25*[-1 -1; 1 1], 'same');
    It = conv2(I1-I2,0.25*ones(2),'same');
end
