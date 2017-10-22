function [] = Project_M3AlgExec_005_12()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 Program Description 
%	This script ...
%
% Assignment Information
%	Assignment:         PS 01, Problem 5
%	Author:             Harith Kolaganti, hkolagan@purdue.edu
%  	Team ID:            005
%  	Contributor:        Name, login@purdue [repeat for each contributor]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% INITIALIZATION ---
allData = csvread('fos_time_histories.csv', 0, 0);
timeLabel = allData(:,1);
counter = 2;
dataSize = length(timeLabel) - 1;
dataSet = 1;


%% CALCULATIONS ---
%First Order Parameter
for counter = 2:1:21
[yl, yh, tau, ts] = Project_M3Algorithm_005_12(timeLabel, allData(:,counter));
tauAv1(dataSet) = tau;
%Calibration Plot Figure 1
[SSE] = Project_M2Calibration_005_12(yl,yh,tau,ts,allData(:,counter), timeLabel, counter);
SSEAv(dataSet) = SSE;
dataSet = dataSet + 1;
end

sseMean1 = mean(SSEAv)
tauMean1 = mean(tauAv1)
stdtau1 = std(tauAv1)
dataSet = 1;

for counter = 22:1:41
[yl, yH, tau, Ts] = Project_M3Algorithm_005_12(timeLabel, allData(:,counter));
%Calibration Plot Figure 1
[SSE] = Project_M2Calibration_005_12(yl,yH,tau,Ts,allData(:,counter), timeLabel, counter);
tauAv2(dataSet) = tau;
SSEAv(dataSet) = SSE;
dataSet = dataSet + 1;
end
sseMean2 = mean(SSEAv)
tauMean2 = mean(tauAv2)
stdtau2 = std(tauAv2)
dataSet = 1;

for counter = 42:1:61
[yl, yH, tau, Ts] = Project_M3Algorithm_005_12(timeLabel, allData(:,counter));
%Calibration Plot Figure 1
[SSE] =Project_M2Calibration_005_12(yl,yH,tau,Ts,allData(:,counter), timeLabel, counter);
tauAv3(dataSet) = tau;
SSEAv(dataSet) = SSE;
dataSet = dataSet + 1;
end
sseMean3 = mean(SSEAv)
tauMean3 = mean(tauAv3)
stdtau3 = std(tauAv3)
dataSet = 1;

for counter = 62:1:81
[yl, yH, tau, Ts] = Project_M3Algorithm_005_12(timeLabel, allData(:,counter));
%Calibration Plot Figure 1
[SSE] =Project_M2Calibration_005_12(yl,yH,tau,ts,allData(:,counter), timeLabel, counter);
tauAv4(dataSet) = tau;
SSEAv(dataSet) = SSE;
dataSet = dataSet + 1;
end
sseMean4 = mean(SSEAv)
tauMean4 = mean(tauAv4)
stdtau4 = std(tauAv4)
dataSet = 1;

for counter = 82:1:101
[yl, yh, tau, ts] = Project_M3Algorithm_005_12(timeLabel, allData(:,counter));
%Calibration Plot Figure 1
[SSE] = Project_M2Calibration_005_12(yl,yh,tau,ts,allData(:,counter), timeLabel, counter);
tauAv5(dataSet) = tau;
SSEAv(dataSet) = SSE;
dataSet = dataSet + 1;
end
sseMean5 = mean(SSEAv)
tauMean5 = mean(tauAv5)
stdtau5 = std(tauAv5)
dataSet = 1;
%% FORMATTED TEXT & FIGURE DISPLAYS ---
Project_M3_Regression_005_12(tauAv1,tauAv2,tauAv3,tauAv4,tauAv5)

%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.
%


