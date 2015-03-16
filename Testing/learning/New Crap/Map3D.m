figure('Renderer','opengl')
% ax = axesm('globe','Geoid',[1 0],'Grid','on', ...
%     'GLineWidth',1,'GLineStyle','-',...
%     'Gcolor',[0.9 0.9 0.1],'Galtitude',100);
ax = axesm('globe');
% ax.Position = [0 0 1 1];
axis equal off
view(3)

load topo
geoshow(topo,topolegend,'DisplayType','texturemap')
demcmap(topo)
land = shaperead('landareas','UseGeoCoords',true);
plotm([land.Lat],[land.Lon],'Color','black')
rivers = shaperead('worldrivers','UseGeoCoords',true);
plotm([rivers.Lat],[rivers.Lon],'Color','blue')


waypoints = [36 -5; 36 -2; 38 5; 38 11; 35 13; 33 30; 31.5 32];
[lttrk,lntrk] = track(waypoints);
plotm(lttrk,lntrk,'r')

place1 = [37,-76];
place2 = [37, -9];
geoshow(place1(1),place1(2),'DisplayType','point','markeredgecolor','k','markerfacecolor','k','marker','o')
geoshow(place2(1),place2(2),'DisplayType','point','markeredgecolor','k','markerfacecolor','k','marker','o')

gcpts = track2('gc',place1(1),place1(2),place2(1),place2(2));
geoshow(gcpts(:,1),gcpts(:,2),'DisplayType','line','color','red','linestyle','-')