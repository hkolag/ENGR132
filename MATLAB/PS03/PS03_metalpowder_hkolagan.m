%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%   ... 
%
% Assigment Information
%   Assignment:  	    PS 03, Problem 2
%   Author:             Harith Kolaganti, @purdue.edu
%  	Team ID:            005-12
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INTITIALIZATION 
data_powder = csvread('Data_metalpowder.csv',2);
powder1 = data_powder([1:106],1);
powder2 = data_powder([1:106],2);
%% ____________________
%% STATISTICS & FORMATTED DISPLAY 
% a. Calculate the descriptive statistics for each powder sample: minimum, maximum, range,
% mean, median, and standard deviation.
mean_146 = mean(powder1);
median_146 = median(powder1);
max_146 = max(powder1);
min_146 = min(powder1);
range_146 = range(powder1);
std_146 = std(powder1);

mean_172 = mean(powder2);
median_172 = median(powder2);
max_172 = max(powder2);
min_172 = min(powder2);
range_172 = range(powder2);
std_172 = std(powder2);

% b. Use print commands to display all of the descriptive statistics to the Command Window.
fprintf('Powder 146 mean = %.2f\n', mean_146);
fprintf('Powder 146 median = %.2f\n', median_146);
fprintf('Powder 146 range = %.2f\n', range_146);
fprintf('Powder 146 max = %.2f\n', max_146);
fprintf('Powder 146 min = %.2f\n', min_146);
fprintf('Powder 146 standard deviation = %.2f\n', std_146);

fprintf('Powder 172 mean = %.2f\n', mean_172);
fprintf('Powder 172 median = %.2f\n', median_172);
fprintf('Powder 172 range = %.2f\n', range_172);
fprintf('Powder 172 max = %.2f\n', max_172);
fprintf('Powder 172 min = %.2f\n', min_172);
fprintf('Powder 172 standard deviation = %.2f\n', std_172);
%% ____________________
%% HISTOGRAMS
% a. Create a 2x1 (row x col) subplot with two histograms. Each histogram in the subplot should
% have the same number of bins and edges, which must be managed appropriately so the
% histograms can be used for meaningful comparisons.
% i. The top histogram will be the particle size distribution for CSIB-146.
subplot(2,1,1)
powder1hist = histogram(powder1);
powder1hist.BinLimits = [0 90];
powder1hist.BinWidth = 9
xlabel('Particle size in micrometers');
ylabel('Occurences in Sample');
title('Frequency of CSIB146 Particle Size');
grid on;

% ii. The bottom histogram will be the particle size distribution for CSIB-172.
subplot(2,1,2)
powder2hist = histogram(powder2);
powder2hist.BinLimits = [0 90];
powder2hist.BinWidth = 9
xlabel('Particle size in micrometers');
ylabel('Occurences in Sample');
title('Frequency of CSIB172 Particle Size');
grid on;
%% ____________________
%% CALCULATIONS & FORMATTED DISPLAY
% i. The percent of particles that are outside the required size range. See the hint in Step
% 5.a. Note: Do not report percentage as a decimal, e.g. 0.12; instead say 12%.
percent_172 = (powder2hist.Values(1,1) + powder2hist.Values(1,10)) / 106 * 100;
percent_146 = (powder1hist.Values(1,1) + powder1hist.Values(1,10)) / 106 * 100;

% ii. The difference between the sample median and sample mean and whether the mean
% is greater than the median or less than the median.
mean_dif146 = mean_146 - median_146;
mean_dif172 = mean_172 - median_172;

% iii. The difference between the sample mean and the baseline mean.
mean_baseDif146 = 41.5 - mean_146;
mean_baseDif172 = 41.5 - mean_172;

% b. For both samples, print the results of the above calculations to the Command Window.
fprintf('Percent of particles outside size range (CSIB146) = %.2f\n', percent_146)
fprintf('Percent of particles outside size range (CSIB172) = %.2f\n', percent_172)

fprintf('Difference between sample median and sample mean (CSIB146) = %.2f\n', mean_dif146) 
fprintf('Difference between sample median and sample mean (CSIB172) = %.2f\n', mean_dif172)

fprintf('Difference between baseline mean and sample mean (CSIB146) = %.2f\n', mean_baseDif146)
fprintf('Difference between baseline mean and sample mean (CSIB172) = %.2f\n', mean_baseDif172)
%% ____________________
%% ANALYSIS

%% --- Q1
% Q1: Are the particle size distributions of the samples similar or different? Justify your answer by
% comparing the two histograms, making reference to the shape and skew of the distributions. 

% The sample size distributions are very similar, the only difference
% showing up in the number of particles outside of the desired range. Both
% of their graphs represent a unimodial trend, with a peak at a size around
% 40 micrometers.
%% --- Q2
% Q2: Is the powder meeting the quality control requirements? Justify your answer based on the powder
% specifications provided above.

% The powder is meeting the quality control requirements because the
% percent of particles outside the size range is under 8%, and the
% difference between sample median and sample mean, and the difference
% between baseline mean and sample mean, are both under the regulation of
% 2.5%.
%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.