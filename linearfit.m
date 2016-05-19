function beta = linearfit(x, y, rank, whetherplot)
% x and y are coloumn vectors
close all;

%% pre-judge
[rx cx] = size(x);
[ry cy] = size(y);

if rx ~= ry
    display('not equal dimension');
    return;
end

n = rx;

%% generate X matrix
xx = zeros(rx,1);
for i = 0:rank-1
    tmpx = x.^i;
    xx = [xx tmpx];
end

%% qr
[Q R] = qr(xx);

%% get coefficient vector
beta = R\(Q\y);

%% plot
if whetherplot > 0
    yy = xx*beta;
    
    figure;
    scatter(x,y);
    hold on;
    plot(x,yy,'linewidth', 2);
    hold off;
end
