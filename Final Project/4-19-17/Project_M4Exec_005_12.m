function [] = Project_M4Exec_005_12()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 Program Description 
%	This script acts as the excecutive funtion for our thermocouple
%	algorithm in that it calls our algorithm UDF, Calibration UDF and
%	Regression UDF for all the data sets given, plots the data sets as a
%	function of price, and finds the average tau and SSE values all in one
%	function call.
%
% Assignment Information
%	Assignment:         Final Project
%	Author:             Team 5, Section 12
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% INITIALIZATION ---
tic
allData = csvread('fos_time_histories.csv', 0, 0); %Imports the data of 100 thermocouples
timeLabel = allData(:,1); %Separates the time history into its own variable.
dataSet = 1; %Initialize dataset at 1
tauAv1 = zeros(1,20); %By preallocating vectors that change size within a loop decreases the runtime for a program significantly. 
                      %This is because if a vector changes dimension size overtime, MATLAB has to make a completely new vector and replace the old one 
                      %with the updated size. By already establishing the
                      %maximum size a vector is going to get, instead of
                      %replacing the vector each iteration, MATLAB can
                      %instead just replace the preallocated zeros, with
                      %the determined number
tauAv2 = zeros(1,20);
tauAv3 = zeros(1,20);
tauAv4 = zeros(1,20);
tauAv5 = zeros(1,20);
SSEAv1 = zeros(1,20);
SSEAv2 = zeros(1,20);
SSEAv3 = zeros(1,20);
SSEAv4 = zeros(1,20);
SSEAv5 = zeros(1,20);
%% CALCULATIONS ---
%First Order Parameter
for counter = 2:1:21 %This counter runs for when we are looking at the first model number.
[yl, yH, Tau, Ts] = Project_M4Algorithm_005_12(timeLabel, allData(:,counter)); %Calls alg UDF, inputs alldata which has it's column designated as counter. This will make each iteration of the for loop run this UDF with a different column of alldata each time.
tauAv1(dataSet) = Tau; %Designates tauAv1 as tau. This will be used to find the average. Tau is 
%Calibration Plot Figure 1
[SSE] = Project_M4Calibration_005_12(yl,yH,Tau,Ts,allData(:,counter), timeLabel, counter); %Calls the calibration UDF. Which will find the SSE value for each column. alldata is inputed the same way as the algorithm UDF
SSEAv1(dataSet) = SSE;%The SSE aberage will be found using this variable right here.
dataSet = dataSet + 1; %By incrementing data set, after each run of the for loop, we will add a dimension to SSEAv and tauAv each run.
end

sseMean1 = mean(SSEAv1)%The mean of all of the dimensions of SSEAv found in the previous for loop is found and designated as the first SSE mean. (Or the mean for the first model number.) 
tauMean1 = mean(tauAv1)%The mean of all of the dimensions of tauAv found in the previous for loop is found and designated as the first tau mean. (Or the mean for the first model number.)
stdtau1 = std(tauAv1)%The standard deviation of all of the dimensions of tauAv found in the previous for loop is found and designated as the first tau standard deviation. (Or the standard deviation for the first model number.)
dataSet = 1; %Dataset is reinitialized as 1

for counter = 22:1:41 %Same process as last loop but with for loop parameters equaling those of the second model number.
[yl, yH, Tau, Ts] = Project_M4Algorithm_005_12(timeLabel, allData(:,counter));
%Calibration Plot Figure 1
[SSE] = Project_M4Calibration_005_12(yl,yH,Tau,Ts,allData(:,counter), timeLabel, counter);
tauAv2(dataSet) = Tau;
SSEAv2(dataSet) = SSE;
dataSet = dataSet + 1;
end
sseMean2 = mean(SSEAv2)%The mean of all of the dimensions of SSEAv found in the previous for loop is found and designated as the second SSE mean. (Or the mean for the second model number.)
tauMean2 = mean(tauAv2)%The mean of all of the dimensions of tauAv found in the previous for loop is found and designated as the second tau mean. (Or the mean for the second model number.)
stdtau2 = std(tauAv2)%The standard deviation of all of the dimensions of tauAv found in the previous for loop is found and designated as the second tau standard deviation. (Or the standard deviation for the second model number.)
dataSet = 1;

for counter = 42:1:61 %Same process as last loop but with for loop parameters equaling those of the third model number.
[yl, yH, Tau, Ts] = Project_M4Algorithm_005_12(timeLabel, allData(:,counter));
%Calibration Plot Figure 1
[SSE] =Project_M4Calibration_005_12(yl,yH,Tau,Ts,allData(:,counter), timeLabel, counter);
tauAv3(dataSet) = Tau;
SSEAv3(dataSet) = SSE;
dataSet = dataSet + 1;
end
sseMean3 = mean(SSEAv3)%The mean of all of the dimensions of SSEAv found in the previous for loop is found and designated as the third SSE mean. (Or the mean for the third model number.)
tauMean3 = mean(tauAv3)%The mean of all of the dimensions of tauAv found in the previous for loop is found and designated as the third tau mean. (Or the mean for the third model number.)
stdtau3 = std(tauAv3)%The standard deviation of all of the dimensions of tauAv found in the previous for loop is found and designated as the third tau standard deviation. (Or the standard deviation for the third model number.)
dataSet = 1;

for counter = 62:1:81 %Same process as last loop but with for loop parameters equaling those of the fourth model number.
[yl, yH, Tau, Ts] = Project_M4Algorithm_005_12(timeLabel, allData(:,counter));
%Calibration Plot Figure 1
[SSE] =Project_M4Calibration_005_12(yl,yH,Tau,Ts,allData(:,counter), timeLabel, counter);
tauAv4(dataSet) = Tau;
SSEAv4(dataSet) = SSE;
dataSet = dataSet + 1;
end
sseMean4 = mean(SSEAv4)%The mean of all of the dimensions of SSEAv found in the previous for loop is found and designated as the fourth SSE mean. (Or the mean for the fourth model number.)
tauMean4 = mean(tauAv4)%The mean of all of the dimensions of tauAv found in the previous for loop is found and designated as the fourth tau mean. (Or the mean for the fourth model number.)
stdtau4 = std(tauAv4)%The standard deviation of all of the dimensions of tauAv found in the previous for loop is found and designated as the fourth tau standard deviation. (Or the standard deviation for the fourth model number.)
dataSet = 1;

for counter = 82:1:101 %Same process as last loop but with for loop parameters equaling those of the fifth model number.
[yl, yH, Tau, Ts] = Project_M4Algorithm_005_12(timeLabel, allData(:,counter));
%Calibration Plot Figure 1
[SSE] = Project_M4Calibration_005_12(yl,yH,Tau,Ts,allData(:,counter), timeLabel, counter);
tauAv5(dataSet) = Tau;
SSEAv5(dataSet) = SSE;
dataSet = dataSet + 1;
end
sseMean5 = mean(SSEAv5)%The mean of all of the dimensions of SSEAv found in the previous for loop is found and designated as the fifth SSE mean. (Or the mean for the fifth model number.)
tauMean5 = mean(tauAv5)%The mean of all of the dimensions of tauAv found in the previous for loop is found and designated as the fifth tau mean. (Or the mean for the fifth model number.)
stdtau5 = std(tauAv5)%The standard deviation of all of the dimensions of tauAv found in the previous for loop is found and designated as the fifth tau standard deviation. (Or the standard deviation for the fifth model number.)

%% FORMATTED TEXT & FIGURE DISPLAYS ---
Project_M4_Regression_005_12(tauAv1,tauAv2,tauAv3,tauAv4,tauAv5) %The regression UDF is ran with all five tauAvs being inputed.
toc
%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.
%


