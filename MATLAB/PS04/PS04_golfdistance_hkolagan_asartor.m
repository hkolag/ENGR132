%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%	...
%
% Assigment Information
%	Assignment:  	    PS 04, Problem 1
%	Author:             Harith Kolaganti, hkolagan@purdue.edu
%  	Team ID:            005-12
%  	Paired Programmer:  Andrew Sartorio, asartor@purdue.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% INITIALIZATION
golfDistance = dlmread('Data_GolfDistance.txt');

%% DESCRIPTIVE STATISTICS & FORMATTED TEXT
% a. Calculate descriptive statistics for the data: minimum, maximum, 
% range, mean, median, standard deviation. Note: See note at the beginning of PS03 regarding the range command.
distMean = mean(golfDistance);
distMed = median(golfDistance);
diststd = std(golfDistance);
distMin = min(golfDistance);
distMax = max(golfDistance);

%b. Display all of the results from the descriptive statistics calculations.
fprintf('Golf ball distance mean %.2f\n', distMean)
fprintf('Golf ball distance median %.2f\n', distMed)
fprintf('Golf ball distance standard deviation %.2f\n', diststd)
fprintf('Golf ball distance minimum %.2f\n', distMin)
fprintf('Golf ball distance maximum %.2f\n', distMax)

%% HISTOGRAM & CDP
% a. Generate a histogram using the histogramRight command that uses an 
% appropriate bin edge vector that makes the plot easy to interpret. 
% Use the descriptive statistics and the engineers’ requirements to help determine the vector.
figure(1)
histBinEdges = linspace(250,270, 26);
distHist = histogramRight(golfDistance, histBinEdges)
xlabel('Distance in Yards');
ylabel('Occurences');
title('Prototype Golf Ball Distance Frequency');
grid on;

% b. Determine the relative and cumulative fractional values of the data.
% Ensure your cumulative frequencies start from ‘0”.
bin_freq = distHist.Values;
dataSize = length(golfDistance);
freq_value = bin_freq / dataSize;
cum_frac= cumsum(freq_value);
cum_frac = [0 cum_frac];

% c. Create a cumulative distribution plot (CDP) using the same number of 
% bins and bin edges as in the histogram. Place the CDP as a subplot below the histogram in the same figure window.
figure(2)
plot(histBinEdges, cum_frac, 'bo-')
xlabel('Distance in Yards');
ylabel('Fractional Value of Occurences');
title('Cumulative Distribution of Golf Ball Distance')
grid on;


%% ANALYSIS

%% Q1
% The size range that the company wanted was +/- 4 yards from 260 yards. So
% the bin edges and bin width was specified by making the width 4, to make
% technical presentation better for the given range
% 

%% Q2
% The median was approximately 263 yards. We used the value of 0.5 on the y
% axis and saw where the graph reached that height on the x axis.

%% Q3
% The distribution displays a unimodal negative skew. On the CDP,the slope
% increases towards the right side of the graph. On the histogram, there is
% a single peak with the majority of the data clustered towards the right
% side of the graph. As for the descriptive statistics, the median is
% greater than the mean

%% Q4
% There is approximately a 49% likelihood that the distance will be between
% 256 and 264 yards. This is found by finding the difference in cumulative
% probability between the 2 intervals.

%% Q5
% They cannot moce forward with the next step in development because they 
% expected a 65% of the distances to be within the given range, but only 49% 
% was in the range.


%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.
%