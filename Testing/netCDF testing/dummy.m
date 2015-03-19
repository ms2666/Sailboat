figure('Renderer','opengl')
axesm('globe')
axis equal off
view(3)

% Make up some data:
load wind u v
u = squeeze(u(:,:,1));
v = squeeze(v(:,:,1));
u(1:30,:) = u(1:30,:)+5;
u(31:end,:) = u(31:end,:)-3;
lat = repmat((20:-1:-14)',1,41);
lon = repmat(-160:-120,35,1);

% Initialize a map:
% worldmap([min(lat(:))-1 max(lat(:))+1],[min(lon(:))-1 max(lon(:))+1]);
% worldmap world
% cla;
% axesm('globe')


% Use the quivermc function:
quiverm(lat,lon,u,v)