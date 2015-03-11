function [] = drawGlobe()

% Set figure window to a globe and view in 3D
figure('Renderer','opengl')
axesm('globe')
axis equal off
view(3)

% Load topology data and plot onto a globe
load topo
geoshow(topo,topolegend,'DisplayType','texturemap')
demcmap(topo)
land = shaperead('landareas','UseGeoCoords',true);
plotm([land.Lat],[land.Lon],'Color','black')
rivers = shaperead('worldrivers','UseGeoCoords',true);
plotm([rivers.Lat],[rivers.Lon],'Color','blue')

end