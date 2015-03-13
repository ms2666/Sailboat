function [retVal] = scratchAdjMat( nodeMatrix, resolution )

x = size(nodeMatrix, 1)
adjMatrix = zeros(x,x);

for i=1:x
    iLat = nodeMatrix(i, 2);
    iLon = nodeMatrix(i, 3);
    
    for j=i:x
        jLat = nodeMatrix(j, 2);
        jLon = nodeMatrix(j, 3);
        
        if abs(iLat - jLat) <= resolution && abs(iLon - jLon) <= resolution
            adjMatrix(i, j) = 1;
        end
    end
end

retVal = sparse(adjMatrix);

end

