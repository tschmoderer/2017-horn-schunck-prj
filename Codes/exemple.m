%----------------------------------------------------------%
%-- PROGRAMME EXEMPLE --%
% Programme effectuant les tests des fonctions : 
% 	- gauss
% 	- chaleur
% 	- bruitage 
%
%	Auteurs : 
% 	- Timothée Schmoderer
%	- Emeric Quesnel
%
%	INSA de Rouen Normandie 2017	
%		
%----------------------------------------------------------%

clc 
clear all 
close all 
%%% Programme Exemple %%%

%%% Définition des constantes %%%
I = double(imread('data/Teddy/frame10.png'));
Im = floor(255*rand(100));
% Filtre Gaussien 
N = 10;
sigma = 2.5; 
%
% Equation de la Chaleur
T = 2;
dt = 0.2;
%
% Bruitage Images
range = 50;
%

% Exemple Filtre Gaussien 
figure; 
subplot(2,2,1), imshow(I,[0,255]);
title('Image Originale');
subplot(2,2,2), imshow(gauss(I,N,sigma),[0,255]);
title('Image Filtrée');
subplot(2,2,3), imshow(Im,[0,255])
title('Image aléatoire');
subplot(2,2,4), imshow(gauss(Im,N,sigma),[0,255]);
title('Image aléatoire filtrée');

% Exemple Equation de la chaleur 
I = double(imread('data/Teddy/frame10.png'));
Im = floor(255*rand(100));

T = 2;
dt = 0.2;

figure; 
subplot(2,2,1), imshow(I,[0,255]);
title('Image Originale');
subplot(2,2,2), imshow(chaleur(I,T,dt),[0,255]);
title('Image Chaleurisée');
subplot(2,2,3), imshow(Im,[0,255])
title('Image aléatoire');
subplot(2,2,4), imshow(chaleur(Im,T,dt),[0,255]);
title('Image aléatoire chaleurisée');

figure; 
subplot(1,2,1), imshow(I,[0,255]);
title('Image Originale');
subplot(1,2,2), imshow(chaleur(I,T,dt),[0,255]);
title('Image "chaleurisée"');

% Exemple Bruitage 
I = double(imread('data/Teddy/frame10.png'));
range = 50;

figure; 
subplot(1,2,1), imshow(I,[0,255]);
title('Image Originale');
subplot(1,2,2), imshow(bruitage(I,range),[0,255]);
title('Image Bruitée');