f = 21;
c = (f - 32) * (5/9);

A = [1 3 5];
max(A);

B = [2 4 6];
max(A, B);

[a,b] = max(A);

disp('hello world');
x = 0:pi/100:2*pi;
y = sin(x);
plot(x, y, 'b--');
xlabel('x')
ylabel('sin(x)')
title('Plot of the Sine Function')

hold on

y2 = cos(x);
plot(x,y2,'r:');
legend('sin','cos');

hold off

[X,Y] = meshgrid(-2:.2:2);
Z = X .* exp(-X.^2 - Y.^2);
surf(X,Y,Z);

t = 0:pi/10:2*pi;
[X,Y,Z] = cylinder(4*cos(t));
subplot(2,2,1); surf(X); title('X');
subplot(2,2,2); surf(Y); title('Y');
subplot(2,2,3); surf(Z); title('Z');
subplot(2,2,4); mesh(X,Y,Z); title('X,Y,Z');