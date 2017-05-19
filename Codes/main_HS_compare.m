warning('off','all')
clc
clear all
close all

I1 = double(imread('data/Teddy/frame10.png'));
I2 = double(imread('data/Teddy/frame11.png'));

alpha = 15;
gamma = 1000;
eps = 0.1;
niter = 2000;

tic; % mesure performance
[u1, v1] = HS(I1,I2,alpha,eps,niter);
[u2, v2] = HS_Amm(I1,I2,alpha,gamma,eps,niter);
toc;

tic;
plotFlow(u1,v1,I1,4);
plotFlow(u2,v2,I1,4);
plotFlow(u1-v2,v1-v2,I1,4);
toc;
max(max(u2-u1))+max(max(v2-v1))