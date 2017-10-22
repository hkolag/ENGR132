%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%	Analyzes the performance (time to failure) of three different types of 
%   deburring media – New Age Stone, Triangle, and Ever Last.
%
% Assigment Information
%	Assignment:  	    PS 07, Problem 3
%	Author:             Harith Kolaganti, hkolagan@purdue.edu
%  	Team ID:            005-12
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% ____________________
%% INITIALIZATION 
% Load the data into the INITIALIZATION section of your program.
allData = csvread('Data_DeburringMediaPerformance.csv',2,1);
nasData = allData(:,1);
tData = allData(:,2);
eData = allData(:,3);


%% ____________________
%% MEAN TIME TO FAILURE
% Calculate the mean time to failure (MTTF) for each media type. The MTTF is the average of all
% failure times.
nasMean = mean(nasData);
tMean = mean(tData);
eMean = mean(eData);

% Display the MTTF to the Command Window for each media type.
fprintf('The MTTF for the deburring of New Age Stone is %.4f\n', nasMean);
fprintf('The MTTF for the deburring of Triangle is %.4f\n', tMean);
fprintf('The MTTF for the deburring of Ever Last is %.4f\n', eMean);

%% ____________________
%% HISTOGRAMS & CDPS
% Histograms
histBinEdges = linspace(35,65,30)
figure(1)
subplot(3,1,1)
nasHist = histogramRight(nasData,histBinEdges);
xlabel('Time to Failure in Hours');
ylabel('Frequency');
title('Frequency of TTF of New Age Stone');

subplot(3,1,2)
tHist = histogramRight(tData,histBinEdges);
xlabel('Time to Failure in Hours');
ylabel('Frequency');
title('Frequency of TTF of Triangle');

subplot(3,1,3)
eHist = histogramRight(eData,histBinEdges);
xlabel('Time to Failure in Hours');
ylabel('Frequency');
title('Frequency of TTF of Ever Last');

% CDPs
figure(2)
% NAS plot data
nasbin_freq = nasHist.Values;
nasdataSize = length(nasData);
nasfreq_value = nasbin_freq / nasdataSize;
nascum_frac= cumsum(nasfreq_value);
nascum_frac = [0 nascum_frac];
plot(nasHist.BinEdges, nascum_frac, 'b.-');
hold on;

% E plot data
ebin_freq = eHist.Values;
edataSize = length(eData);
efreq_value = ebin_freq / edataSize;
ecum_frac= cumsum(efreq_value);
ecum_frac = [0 ecum_frac];
plot(eHist.BinEdges, ecum_frac, 'r.-');
hold on;

% T plot data
tbin_freq = tHist.Values;
tdataSize = length(tData);
tfreq_value = tbin_freq / tdataSize;
tcum_frac= cumsum(tfreq_value);
tcum_frac = [0 tcum_frac];
plot(tHist.BinEdges, tcum_frac, 'k.-');

legend('New Age Stone','Ever Last','Triangle');
xlabel('Frequency in Hours');
ylabel('Fractional Value of Occurences');
title('Cumulative Distribution of Deburring')
grid on;

%% ____________________
%% ANALYSIS

%% Q1
% The MTTF of New Age Stone is around 50, for Ever Last it is around 46,
% and for Triangle it is around 49. By looking at where each line hits the
% y value of .5 determine its median on the x-axis as well.

%% Q2
% Triangle has the least variability because of it less slant slope, which
% means that it has a lower rate of change over time.

%% Q3
% BY looking at the median of the data as shown as the values corelating
% with the 0.5 value on the y-axis, the New Age Stone and Triangle have
% values closer to 50 than Ever Last.Therefore these media types closer to
% 50 will have a higher likelihood of performing effectively for at least
% 50 hours.

%% Q4
% I would recommend the New Age Stone and Triangle media types due to their
% higher average MTTF as compared to the Ever Last media type. Looking at
% the histograms, the 2 aforementioned media types have more frequencies
% closer to 50 hours, and thus will most likely perform effectively at that
% time requirement. I would not recommend Ever Last because it has a mean
% of around 46 hours which is far less than what is required. Also this
% media type has less frequencies at the 50th hour in the histogram, which
% demonstrates that many cases of the using the media type have failed.

%% Q5
% The size, shape, thickness, and cost of the media types are
% considerations that should also be taken into consideration to have an
% even and fair judegement of all the media types. Having an efficient, but
% low cost media type that can be replaced easily is far better than a ver
% expensive one, that is difficult to replace even if it lasts a little
% longer than its cheaper alternative.


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.
%