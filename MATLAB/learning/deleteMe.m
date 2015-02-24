N = 400;
x = -83:5:2;
y = 13:5:64;

% Horizontal grid 
for k = 1:length(y)
  line([x(1) x(end)], [y(k) y(k)])
end

% Vertical grid
for k = 1:length(x)
  line([x(k) x(k)], [y(1) y(end)])
end