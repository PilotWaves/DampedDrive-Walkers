%r = 2.5;
%r = 3.3;
r = 4;


x = [0:0.01:1];
y = r*x-r*x.^2;

set(0,'defaultAxesFontSize',20)
t = tiledlayout(1,2,'TileSpacing','Compact');

plot(x, x, '--', x, y, 'linewidth', 4)
xlabel({'x_{n}'})
ylabel({'x_{n+1}'})
hold on

x = zeros(1,200);
y = x;

x(1) = 0.01;
y(1) = r*x(1) - r*x(1)^2;

for i = 1:length(x_loss)-1
    
   x(i+1) = y(i);
   y(i+1) = r*x(i+1) - r*x(i+1)^2;
         
   plot([x(i), x(i+1)], [y(i), y(i)], [x(i+1), x(i+1)], [y(i), y(i+1)], 'Color', [0.15,0.15,0.15])
   hold on
    
end

hold off
