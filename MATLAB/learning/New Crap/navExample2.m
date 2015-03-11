waypoints = [36 -5; 36 -2; 38 5; 38 11; 35 13; 33 30; 31.5 32];
load coast
% axesm('MapProjection','globe')
ax = axesm('globe');
ax.Position = [0 0 1 1];
axis off, gridm on, framem on;

plotm(lat,long)

[lttrk,lntrk] = track(waypoints);
plotm(lttrk,lntrk,'r')