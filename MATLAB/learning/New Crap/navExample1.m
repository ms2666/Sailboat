figure('color','w');
% ha = axesm('mapproj','mercator','maplatlim',[25 55],'maplonlim',[-80 0]);
ha = axesm('mapproj','mercator');
axis off, gridm on, framem on;
setm(ha,'MLineLocation',15,'PLineLocation',15);
mlabel on, plabel on;
load coast;
hg = geoshow(lat,long,'displaytype','line','color','b');

place1 = [40.7, -74.0];
place2 = [51.5, -0.1];
geoshow(place1(1),place1(2),'DisplayType','point','markeredgecolor','k','markerfacecolor','k','marker','o')
geoshow(place2(1),place2(2),'DisplayType','point','markeredgecolor','k','markerfacecolor','k','marker','o')

% Compute and draw 100 points for great circle
gcpts = track2('gc',place1(1),place1(2),place2(1),place2(2));
geoshow(gcpts(:,1),gcpts(:,2),'DisplayType','line','color','red','linestyle','-')

% Compute and draw 100 points for rhumb line
% rhpts = track2('rh',place1(1),place1(2),place2(1),place2(2));
% geoshow(rhpts(:,1),rhpts(:,2),'DisplayType','line','color',[.7 .1 0],'linestyle','-.')
% [latpts,lonpts] = gcwaypts(place1(1),place1(2),place2(1),place2(2),3);   % Compute 3 waypoints
% geoshow(latpts,lonpts,'DisplayType','line','color',[.4 .2 0],'linestyle','-')