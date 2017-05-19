warning('off','all')
clc
clear all
close all

I1 = double(imread('data/Teddy/frame10.png'));
I2 = double(imread('data/Teddy/frame11.png'));

N = 10;
sigma = 0.8;
nu = 0.7;
alpha = 15;
eps = 0.1;
niter = 2000;

[u v] = HS_affine(I1,I2,N,sigma,nu,alpha,eps,niter);


