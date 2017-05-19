function plotFlow(u,v,I1,scale)

x = [1:scale:size(u,1)];
y = [1:scale:size(u,2)];

uAff = zeros(size(u));
vAff = zeros(size(v));

uAff(x,y)=scale*u(x,y);
vAff(x,y)=scale*v(x,y);

figure;
imshow(I1,[0,255]); 
hold on; 
quiver(uAff,vAff,20)
set(gca,'YDir','reverse');

end