function plotGroupedBarChart_paper(names, values, label_name)

numBars = length(names);[numVal_row,numVal_col] = size(values);
numVal_per_Bars = (numVal_row*numVal_col)/numBars;

% 定义内置颜色
defaultColors = [ 0 0.4470 1; 1 0 0;  0.5, 1, 0.0980];

figure;% 绘制分组柱状图
hold on;
barWidth = 0.8;  % 减小每个柱状图的宽度，以便它们更靠近
b = bar(1:numBars,values,'grouped','FaceColor','flat','BarWidth',barWidth);

for i = 1:numVal_col
    b(i).FaceColor = defaultColors(i,:); % 设置每个柱状图的颜色为内置颜色
end

grid on;
hold off;

% 标记柱状图顶端数值
for i = 1:numBars
    for j = 1:numVal_per_Bars
        text(i+(j-(numVal_per_Bars+1)/2)*0.4, values(i,j), num2str(values(i,j)), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom','FontSize',9);
    end
end

% 设置标签和绘图范围
xticks(1:numBars);
xticklabels(names);
ylim([0, max(max(values))+5]);

% 添加标题和标签
title(label_name.Title);
xlabel(label_name.X);
ylabel(label_name.Y);
legend(label_name.L1, label_name.L2, 'FontSize', 12);  % 添加图例，分别对应两个数据集

end
