function [ augNodeMatrix ] = genLandmask(nodeMatrix, numNodes)

augNodeMatrix = [nodeMatrix zeros(numNodes, 1)];

for i=1:numNodes
    if landmask(nodeMatrix(i, 2), nodeMatrix(i, 3))
        augNodeMatrix(i, 4) = true;
    end
end