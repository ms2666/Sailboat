% open file
filename = 'Data/uv20150102rt.nc';
 
% read file
flowData = readFile(filename);
 
% plot meshgrid of longitude and lattitude data
[x,y] = meshgrid(flowData.lon,flowData.lat);
x = x'; y = y';
 
% vectors
u = flowData.u(:,:,1,1);
v = flowData.u(:,:,1,1);
 
% change null values to 0
u(isnan(u)) = 0;
v(isnan(v)) = 0;
 
% % plot the quiver map
% hold on
% coast=load('coast');
% % plot(coast.long,coast.lat)
% quiver(x,y,u,v);

