%r = 2.5;
%r = 3.3;
r = 4;


x_gain_in = [0:0.01:1];
x_loss_in = r*x_gain_in.^2;

x_gain_out = x_loss_in;
x_loss_out = sqrt(r*x_loss_in) - x_loss_in;
         

set(0,'defaultAxesFontSize',20)
t = tiledlayout(1,2,'TileSpacing','Compact');

plot(x_gain_out, x_gain_in, '--', x_loss_in, x_loss_out, 'linewidth', 4)
xlabel({'x_{in}^{loss}, x_{out}^{gain}'})
ylabel({'x_{out}^{loss}, x_{in}^{gain}'})
hold on

x_loss = zeros(1,200);
x_gain = x_loss;

x_loss(1) = 0.01;
x_gain(1) = r*x_loss(1)^2;

for i = 1:length(x_loss)-1
    
   x_loss(i+1) = sqrt(r*x_gain(i)) - x_gain(i);
   x_gain(i+1) = r*x_loss(i+1)^2;
         
   plot([x_gain(i), x_gain(i+1)], [x_loss(i+1), x_loss(i+1)], [x_gain(i), x_gain(i)], [x_loss(i), x_loss(i+1)], 'Color', [0.15,0.15,0.15])
   hold on
    
end

hold off
