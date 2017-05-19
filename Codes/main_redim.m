warning('off','all')
clc
clear all
close all

z = double(imread('data/Teddy/frame10.png'));
nu = 0.3;

z1 = redim(z,nu);
figure; 
subplot(1,2,1) 
imshow(z,[0,255])
title(['Image originale de taille : ',num2str(size(z))])
subplot(1,2,2) 
imshow(z1,[0,255])
title(['Image agrandie d''un facteur 1.3 de taille : ',num2str(size(z1))])