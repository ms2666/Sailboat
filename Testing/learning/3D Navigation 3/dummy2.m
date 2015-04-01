%% Initialization
resolution = 10;

timeFactor = 2;

% bounds transformations
bounds = [-83.2,22.0,0.3,58.8];
bounds = [bounds(2), bounds(1), bounds(4), bounds(3)];
bounds1 = bounds;
bounds = bounds + [0, 180, 0, 180];

dataFile = 'uv20150102rt.nc';

drawGlobe()

% round bounds to the resolution specified
res = 1/resolution;
bounds = round(bounds*res)/res;

%% Fetch data from netCDF file
% read the netCDF file
flowData = readFile(dataFile);
% convert latitudes and longitudes to floats
lats = double(flowData.lat);
lons = double(flowData.lon);

% generate a meshgrid of lats and lons
[latData, lonData] = meshgrid(lats, lons);

u = flowData.u(:,:,1,timeFactor); u(isnan(u)) = 0;
v = flowData.v(:,:,1,timeFactor); v(isnan(v)) = 0;


%% Slice data
ind1 = find(latData>bounds(1) & latData<bounds(3));
ind2 = find(lonData(ind1)>bounds(2) & lonData(ind1)<bounds(4));
[I,J] = ind2sub(size(latData),ind1(ind2));

% slice x, y, u and v
latData = latData(min(I):max(I),min(J):max(J));
lonData = lonData(min(I):max(I),min(J):max(J));
u = u(min(I):max(I),min(J):max(J));
v = v(min(I):max(I),min(J):max(J));

%% Display stuff
% display vector data
quiverm(latData, lonData, u, v, 'y');

% geoshow(bounds(1), bounds(2), 'DisplayType','point','markeredgecolor','y','markerfacecolor','r','marker','o')
geoshow([bounds(1) bounds(3)], [bounds(2) bounds(4)], 'DisplayType','point','markeredgecolor','y','markerfacecolor','r','marker','o')