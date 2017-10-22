%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%  ...
%
% Assigment Information
%   Assignment:  	    PS 03, Problem 1
%   Author:             Harith Kolaganti, hkolagan@purdue.edu
%   Team ID:            005-12
%  	Paired Programmer:  Tyle Huter, thuter@purdue.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INTITIALIZATION
% Open PS03_daylight_template.m and complete the header information. 
% Save the file with the name PS03_daylight_yourlogin1_yourlogin2.m.
sun_rise_set = csvread('2016_sunrise_sunset_times.csv',8,0);
day_year = sun_rise_set([1:365], 1);
sunrise = sun_rise_set([1:365], 2);
sunset = sun_rise_set([1:365], 3);
%% ____________________
%% DAYLIGHT CALCULATION
% Calculate the hours of daylight in each day of the year:
% Your data is in clock time. Convert clock time to decimal hours 
% (e.g., 8:45am = 8.75 decimal hours). Then, calculate the hours of daylight in a day.
hours = fix((sunset - sunrise)/100);
minutes = ((sunset - sunrise) - hours * 100)/60;
daylight = round(hours + minutes, 2);

% Create a vector that contains only the daylight data for the proposed season of April 1 to August 31
april_aug = daylight([90:242],1);    

%% ____________________
%% STATISTICS & FORMATTED TEXT DISPLAY
% a. Calculate the minimum, maximum, range, mean, median, and standard deviation for
% i. The number of hours of daylight per day for the whole year
year_mean = mean(daylight);
year_median = median(daylight);
year_max = max(daylight);
year_min = min(daylight);
year_range = range(daylight);
year_std = std(daylight);

% i. The number of hours of daylight per day for the proposed tournament season
aa_mean = mean(april_aug);
aa_median = median(april_aug);
aa_max = max(april_aug);
aa_min = min(april_aug);
aa_range = range(april_aug);
aa_std = std(april_aug);

% b. Use print commands to display all of the descriptive statistics results to the Command Window.
fprintf('Mean year = %.2f\n', year_mean)
fprintf('Median year = %.2f\n', year_median)  
fprintf('Max year = %.2f\n', year_max)
fprintf('Min year = %.2f\n', year_min)
fprintf('Range year = %.2f\n', year_range)
fprintf('Standard Deviation year = %.2f\n', year_std)
fprintf('Mean April-Aug = %.2f\n', aa_mean)
fprintf('Median April-Aug = %.2f\n', aa_median)  
fprintf('Max April-Aug = %.2f\n', aa_max)
fprintf('Min April-Aug = %.2f\n', aa_min)
fprintf('Range April-Aug = %.2f\n', aa_range)
fprintf('Standard Deviation April-Aug = %.2f\n', aa_std)
%% ____________________
%% HISTOGRAMS
%a. In Figure 1, use the histogram command to create a histogram of the number of hours of daylight per day for the whole year. Use the histogram command defaults (i.e., do not set the number of bins or the edge values).
figure(1)
daylight_year = histogram(daylight)
xlabel('Hours per Day')
ylabel('# of days')
title('Frequency of Hours of Daylight') 
grid on
%b. Use the resulting histogram properties to determine the bin edges and frequencies in each bin for this histogram. Name the bin edges vector edges_all and name the frequency vector freq_all.
edges_all = daylight_year.BinEdges;
freq_all = daylight_year.Values;
%c. Create a vector of bin edges that can be used to create a histogram with 20 evenly-spaced bins that include the full range of daylight hours for the entire year. Name this vector edges_rule.
edges_rule = linspace(9,16,21)
%d. In Figure 2, create a histogram that uses the edges_rule vector to set the bin edges.
figure(2)
daylight_twentyBins = histogram(daylight, edges_rule)
xlabel('Hours per Day')
ylabel('# of days')
title('Frequency of Hours of Daylight') 
grid on
%e. In Figure 3, create a histogram that shows the distribution of daylight hours during the proposed tournament season (April 1 to 31 August) with the number of bins set to 8.
figure(3)
april_aug_hist = histogram(april_aug, 8);
xlabel('Hours per Day')
ylabel('# of days')
title('Frequency of Hours of Daylight From April 1st to August 31st') 
grid on
%f. Ensure that all histograms are formatted for technical presentation.


%% ____________________
%% ANALYSIS

%% --- Q1
% The bin edges could be changeed to between 18 and 20 in order to eliminate
% the white spaces at 9 and 16 in order to improve technical presentation.

%% --- Q2
% The data in the second histogram respresnts a bimodal set because of the
% existence of 2 maximum peaks on the graph.

%% --- Q3
% The skew seems to be more positively skewed than negatively skewed
% overall.

%% --- Q4
% As seen in the histogram, there are no recorded values of daylight ever
% being under 12 hours a day. The descriptive statistics during these times
% also support this claim.

%% --- Q5
% 30 days can be added to proposed season because the average daylight
% between April and august is 14.5 hours. The calculated deviation per
% month is 2.0 hours, which would show that the next 30 days would have an
% average of a little above 12 hours of daylight

%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.