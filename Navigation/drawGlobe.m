function [] = drawGlobe()

% Set up figure
figure('Renderer','opengl')
axesm('globe')
axis equal off
view(3)
shading interp
lighting flat
camlight right
camlight left
material metal

% Lower the samplefactor, the higher the resolution
samplefactor = 15;
[Z, zleg] = etopo('/Volumes/Macintosh Extension/Documents Extension/GitHub/Sailboat-Data/Topology', samplefactor);
geoshow(Z,zleg,'DisplayType','texturemap')

% dark color first, then light color
cmapsea  = interpColor([5 32 144]/255, [50 155 255]/255);
cmapland = interpColor([0 118 68]/255, [146 82 16]/255);
demcmap(Z, 32, cmapsea', cmapland')

% plots outlines
land = shaperead('landareas','UseGeoCoords',true);
plotm([land.Lat],[land.Lon],'Color','black')
rivers = shaperead('worldrivers','UseGeoCoords',true);
plotm([rivers.Lat],[rivers.Lon],'Color','blue')

function [output] = interpColor(a, b)
    space = 10;
    output = zeros(3, space);
    increment = (b - a) / (space - 1);
    for i = 1:space
        output(:, i) = a + increment * (i - 1);
    end
end

end