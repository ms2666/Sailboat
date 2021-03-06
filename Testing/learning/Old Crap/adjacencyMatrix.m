% uses biograph toolkit
W = [.41 .99 .51 .32 .15 .45 .38 .32 .36 .29 .21];
DG = sparse([6 1 2 2 3 4 4 5 5 6 1],[2 6 3 5 4 1 6 3 4 3 5],W);
% make undirected
temp = full(DG);
DG = sparse(temp + temp');
% calculate shortest path
[dist, path, ~] = graphshortestpath(DG, 1, 6, 'Method', 'Dijkstra');