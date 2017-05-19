warning('off','all')
clc
clear all
close all

I1 = double(imread('data/Teddy/frame10.png'));
I2 = double(imread('data/Teddy/frame11.png'));

alpha = 15;
eps = 0.1;
niter = 2000;
range = 50;
T = 1;
dt = 0.2;


I1b = bruitage(I1,range);
I2b = bruitage(I2,range);

I1bc = chaleur(I1b,T,dt);
I2bc = chaleur(I2b,T,dt);

[u v] = HS_Amm(I1,I2,alpha,eps,niter);
[ub vb] = HS_Amm(I1b,I2b,alpha,eps,niter);
[ubc vbc] = HS_Amm(I1bc,I2bc,alpha,eps,niter);

plotFlow(u,v,I1,4);
plotFlow(ub,vb,I1b,4);
plotFlow(ubc,vbc,I1bc,4);
