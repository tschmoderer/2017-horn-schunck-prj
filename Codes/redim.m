function I2 = redim(z,nu)

m = size(z);
row = m(1);
col = m(2);

if nu > 1
    new_size = round(nu*m);
    tmp = zeros(new_size);
    tmp(1:row,1:col) = z;
    z = tmp;
    m = size(z);
    row = m(1);
    col = m(2);
    new_row = m(1);
    new_col = m(2);
else
    new_row = round(nu*row);
    new_col = round(nu*col);
end

z1 = zeros(m);
u = zeros(m);
v = zeros(m);

for i=0:row-1
    for j=0:col-1
        u(i+1,j+1) = (j)*(1-nu)/nu;
        v(i+1,j+1) = (i)*(1-nu)/nu;
    end
end

for i=1:m(1)
    z1(i,:) = splineInterp(z(i,:),u(i,:));
end
for i=1:m(2)
	z1(:,i) = splineInterp(z1(:,i)',v(:,i)')'; 
end

I2 = z1(1:new_row,1:new_col);

end

