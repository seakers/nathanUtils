function drawCirc(handle, center, radius)
th=linspace(0,2*pi,128);
for indx=1:size(center,1)
    x=radius.*cos(th)+center(indx,1);
    y=radius.*sin(th)+center(indx,2);
    plot(handle, x,y);
end