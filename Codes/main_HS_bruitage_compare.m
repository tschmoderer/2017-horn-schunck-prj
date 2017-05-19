warning('off','all')
clc
clear all
close all

I1 = double(imread('data/Teddy/frame10.png'));
I2 = double(imread('data/Teddy/frame11.png'));

range = 50;
T = 1;
dt = 0.2;

I1b = bruitage(I1,range);
I2b = bruitage(I2,range);

I1bc = chaleur(I1b,T,dt);
I2bc = chaleur(I2b,T,dt);

alpha = 15;
gamma = 1000;
eps = 0.1;
niter = 2000;

tic; % mesure performance
[u1, v1] = HS(I1,I2,alpha,eps,niter);
%[u1b, v1b] = HS(I1b,I2b,alpha,eps,niter);
[u1bc, v1bc] = HS(I1bc,I2bc,alpha,eps,niter);
[u2, v2] = HS_Amm(I1,I2,alpha,gamma,eps,niter);
%[u2b, v2b] = HS_Amm(I1b,I2b,alpha,gamma,eps,niter);
[u2bc, v2bc] = HS_Amm(I1bc,I2bc,alpha,gamma,eps,niter);
toc;

tic;
%plotFlow(u1,v1,I1,4);
%plotFlow(u2,v2,I1,4);
%plotFlow(u1-v2,v1-v2,I1,4);
toc;

max(max(u2-u1)) + max(max(v2-v1))