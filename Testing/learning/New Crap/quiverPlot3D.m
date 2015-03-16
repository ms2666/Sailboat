figure('Renderer','opengl')
axesm('globe')
axis equal off
view(3)

land = shaperead('landareas','UseGeoCoords',true);
plotm([land.Lat],[land.Lon],'Color','black');

geoshow([-1.680666976164238e+02,-53.816712272901405],[-34.819957184945000,71.720533802932540], 'DisplayType', 'multipoint');

lighting phong