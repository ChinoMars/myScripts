function [a0 a1]=linearfit(x, y, whetherplot)
% x and y are coloumn vectors

n = length(y);

if length(x) ~= n
    display('unmatched length');
end

a1 = (n*x'*y-sum(x)*sum(y))/(n*sum(x.^2)-sum(x)*sum(x));
a0 = sum(y)/n-a1*sum(x)/n;

if whetherplot > 0
    figure;
    scatter(x,y);
    hold on;
    yy = a0 + a1*x;
    plot(x,yy,'linewidth', 2);
    hold off;
end
