flowData = readFile('uv20150102rt.nc');
[x,y] = meshgrid(flowData.lat,flowData.lon);
x = double(x);
y = double(y);

u = flowData.u(:,:,1,1); u(isnan(u)) = 0;
v = flowData.v(:,:,1,1); v(isnan(v)) = 0;
magU = 20*u;
magV = 20*v;

lx = 1000;
hx = 1400;
ly = 400;
hy = 700;
%
% drawGlobe();
% quiverm(x(lx:hx, ly:hy), y(lx:hx, ly:hy), magU(lx:hx, ly:hy), magV(lx:hx, ly:hy), 'r') ;
% pause(3)
% quiverm(x(lx:hx, ly:hy), y(lx:hx, ly:hy), magU(lx:hx, ly:hy), magV(lx:hx, ly:hy), 'k') ;

colorVec = ['r' 'b' 'k' 'r' 'k'];
drawGlobe();
quiverm(x(lx:hx, ly:hy), y(lx:hx, ly:hy), magU(lx:hx, ly:hy), magV(lx:hx, ly:hy), colorVec(1i)) ;