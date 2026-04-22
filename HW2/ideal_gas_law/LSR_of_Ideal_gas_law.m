%Henry Belik
clear all
close all

%Raw data
T = 233.15:40:433.15; %K
p = 6900:1200:12900; %pa or Nm^-2
t = 200:10:500;

%components of LSG
sigmax = sum(T); 
sigmay = sum(p);
sigmaxy = sum(T .* p); 
sigmaxsquared = sum(T .^ 2);
N = length(T);
y = zeros(1,length(t));

%were y = ax + b
a = (N * sigmaxy - sigmax * sigmay) / (N * sigmaxsquared - sigmax ^ 2);
b = 1/N * sigmay - a * sigmax / N;

%graphing the LSR line
for i = 1:length(t)
    y(i) = a * t(i) + b;
end

%graph
figure
plot(T, p,'. r','MarkerSize',15)
hold on
plot(t, y, 'b')
xlabel('Temperature (K)');
ylabel('Pressure (Pa)');
title('Ideal Gas Law Linear Regression')
legend('Data',['p = ' num2str(a) 'T ' num2str(b)])
