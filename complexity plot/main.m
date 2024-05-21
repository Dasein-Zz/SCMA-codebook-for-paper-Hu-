% by Yangjunxiang 2024-5
% Comparison of Log-MPA Performance across Diverse SCMA Systems
clc
clear
close all;
%% SCMA system parameters
M = [4,4,4,4,4];  % codebook rate : M
K = [2,4,2,3,5];  % resource : K
J = [3,6,4,6,10]; % usernumber : J
Iter_times = [4,4,4,4,4]; % MPA iteration times
df = [3,3,4,4,4]; % factor graph's row weight
dv = [2,2,2,2,2]; % factor graph's col weight
names  = {'2K3J(df=3)','4K6J(df=3)','2K4J(df=4)','3K6J(df=4)','5K10J(df=4)'};

%% 每种解码器复杂度计算
values = LOG_MPA_add(Iter_times,K,M,J,df,dv);

%% 绘图
label_name.X = '';
label_name.Y = 'Times';
label_name.Title = '';
label_name.L1 = 'Add';
label_name.L2 = 'Multi';
plotGroupedBarChart_paper(names, values, label_name);

%% LOGMPA
function complexity_LOGMPA = LOG_MPA_add(Iter_times,K,M,J,df,dv)

N = length(Iter_times);
complexity_LOGMPA = zeros(N,2);

for i = 1:N
    % add
    complexity_LOGMPA(i,1) = J(i)*dv(i)*(M(i)^df(i))*(Iter_times(i)*df(i)+1) + ...
        J(i)*M(i)*(Iter_times(i)*dv(i)+1)*(dv(i)-1);

    % multi
    complexity_LOGMPA(i,2) = Iter_times(i)*J(i)*dv(i)*(M(i)^df(i)) + K(i)*(M(i)^df(i)) - Iter_times(i)*M(i)*J(i)*dv(i);

end

end