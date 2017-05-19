function y = mereSpline(z)
y = zeros(size(z));
z=z';
for i=1:size(z)
    x=z(i);
    if (x>=-2) && (x<-1)
        y(i)=(x+2)^3;
    else if (x>=-1) && (x<0)
            y(i)=-3*x^2*(x+2)+4;
        else if (x>=0) && (x<1)
                y(i)=3*(x-2)*x^2+4;
            else if (x>=1) && (x<2)
                    y(i)=(2-x)^3;
                else
                    y(i)=0;
                end
            end
        end
    end
end
end