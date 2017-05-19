warning('off','all')
clc
clear all
close all

z = double(imread('data/Teddy/frame10.png'));
I2 = double(imread('data/Teddy/frame11.png'));

alpha = 15;
eps = 0.1;
niter = 2000;

tic;
[u v] = HS(z,I2,alpha,eps,niter);
toc;

n = size(z);
exagere = 1;
u =  exagere*u;
v = exagere*v;

for i=1:n(1)
    z1(i,:) = linearInterp(z(i,:),u(i,:));
end
for i=1:n(2)
    z1(:,i) = linearInterp(z1(:,i)',v(:,i)')'; 
end

figure; 
subplot(1,2,1)
imshow(I2,[0,255]); 
title('Image 2 de la paire originale');
subplot(1,2,2)
imshow(z1,[0,255]); 
title('Image 2 interpolée');

max(max(abs(I2-z1)))