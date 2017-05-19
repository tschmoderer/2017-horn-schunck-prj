%----------------------------------------------------------%
%-- FONCTION GAUSS --%
% Applique un flitre gaussien à une image
% Renvoie une image filtrée
% 
%	In : 
% 	- I : une image 
%	- N : la taille du filtre
% 	- sigma : la variance du filtre
%
% Out : 
% 	- J : l'image filtrée
%
%	Auteurs : 
% 	- Timothée Schmoderer
%	- Emeric Quesnel
%
% Test : 
%	I = 100*ones(100,100);
%	N = 10;
% 	sigma = 2.5;
%	imshow(gauss(I,N,sigma),[0,255]);
%
%	INSA de Rouen Normandie 2017	
%		
%----------------------------------------------------------%



function J = gauss(I,N,sigma) 
%%% Création du noyau de convolution %%%
[x y]=meshgrid(round(-N/2):round(N/2), round(-N/2):round(N/2));
f=exp(-x.^2/(2*sigma^2)-y.^2/(2*sigma^2));
f=f./sum(f(:));

%%% Application du filtre %%%
J = conv2(I,f,'same');
end