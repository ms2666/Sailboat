function [] = plotGreatCircle(place1, place2)

geoshow(place1(1),place1(2),'DisplayType','point','markeredgecolor','k','markerfacecolor','k','marker','o')
geoshow(place2(1),place2(2),'DisplayType','point','markeredgecolor','k','markerfacecolor','k','marker','o')

gcpts = track2('gc',place1(1),place1(2),place2(1),place2(2));
geoshow(gcpts(:,1),gcpts(:,2),'DisplayType','line','color','red','linestyle','-')

end