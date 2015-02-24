filename = 'uv20150102rt.nc';

flowData = readCDF(filename);

[x,y] = meshgrid(flowData.lon,flowData.lat);
x = x'; y = y';

u = flowData.u(:,:,1,1);
v = flowData.u(:,:,1,1);

u(isnan(u)) = 0;
v(isnan(v)) = 0;

hold on
coast=load('coast');
plot(coast.long,coast.lat)
quiver(x,y,u,v);