warning('off','all')
clc
clear all
close all

z = double(imread('data/Teddy/frame10.png'));
I2 = double(imread('data/Teddy/frame11.png'));

alpha = 15;
gamma = 1000;
eps = 0.1;
niter = 2000;

tic;
[u v] = HS_Amm(z,I2,alpha,gamma,eps,niter);
toc;

n = size(z);

exagere = 30;
u =  exagere*u;
v = exagere*v;

for i=1:n(1)
    z1(i,:) = linearInterp(z(i,:),u(i,:));
    z2(i,:) = splineInterp(z(i,:),u(i,:));  
end
for i=1:n(2)
   z1(:,i) = linearInterp(z(:,i)',v(:,i)')'; 
   z2(:,i) = splineInterp(z(:,i)',v(:,i)')';
end

figure; 
subplot(2,2,1);
imshow(z1,[0,255])
title('linear');
subplot(2,2,2);
imshow(z2,[0,255])
title('spline');
subplot(2,2,3);
imshow(255-z1+I2,[0,255])
title(['linear error ',num2str(max(max(abs(z1-I2))))]);
subplot(2,2,4);
imshow(255-z2+I2,[0,255])
title(['spline error ',num2str(max(max(abs(z2-I2))))]);

