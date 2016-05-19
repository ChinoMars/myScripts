close all
%%
hCircle = figure('visible', 'off');
set(hCircle, 'NumberTitle', 'off');
% set(hCircle, 'MenuBar','none');
set(hCircle, 'visible', 'on');
A=linspace(0, 2*pi, 360);

ridus = 8;
x1=ridus*cos(A);
y1=ridus*sin(A);
plot(x1,y1, 'k', 'linewidth',2)
hold on
fill(0.1*cos(A),0.1*sin(A),'k');
axis off
axis([-ridus*1.2 ridus*1.2 -ridus*1.2 ridus*1.2])
axis equal

%% define axis
for k = 0:359
    param = ridus*0.9;
    flag = false;
    if mod(k,5) == 0
        param = ridus*0.1;
%     param = 0;
    end
    if mod(k,10) == 0
        flag = true;
    end
    xk=ridus*cos(-2*pi/360*k+pi/2);
    yk=ridus*sin(-2*pi/360*k+pi/2);
    plot([xk xk/ridus*param],[yk yk/ridus*param],'k', 'linewidth',2)
%     plot([xk 0],[yk 0],'k', 'linewidth',2)
    if flag
        h=text(xk*1.05,yk*1.05,num2str(k),'fontsize',16,'color',[0 0 0],'HorizontalAlignment','center');
    end
end




