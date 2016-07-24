function genRelatedData(dirName)
clear
clc
close all

% dirName = 'E:\Work\Delta_dL_proj\test_test';

addpath(dirName)
res = ls(dirName);

siz = size(res);

num = siz(1) - 2;
for i = 3:siz(1)
    file = res(i,1:end);
    dataStruct = importdata(file);
    data = dataStruct.data;
    %     plot(data)
    if i == 3
        allData = zeros(length(data),1);
    end
    % method 1
    allData = allData+data;
    
    
end

allData = round(allData/num);
allData = allData-min(allData);

fid = fopen('./result.txt', 'w');
for i=1:length(allData)
    if mod(i,2) == 1
        fprintf(fid,'%d,',allData(i));
    end
end

fclose(fid);



end