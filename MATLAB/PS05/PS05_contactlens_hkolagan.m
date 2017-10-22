function[] = PS05_contactlens_hkolagan()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%	Calls a statistics UDF from PS04 Problem 2 to determine mean and 
%   standard deviation for the contact lens measurements and calls the 
%   p-code to determine the acceptability of the lens designs.
%
% Function Call
% 	PS05_contactlens_hkolagan()
%
% Input Arguments
%	NONE
%
% Output Arguments
%	NONE
%
% Assigment Information
%   Assignment:    PS 05, Problem 1
%   Author:        Harith Kolaganti, hkolagan@purdue.edu
%  	Team ID:       005-12
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
% 3. In the INTIALIZATION section, load all values that need to be 
% hardcoded in the function.
all_data = csvread('Data_contactlens.csv',2,0);
LX18rad = all_data(:,1);
LX18dia = all_data(:,2);
LF54rad = all_data(:,3);
LF54dia = all_data(:,4);
LL107rad = all_data(:,5);
LL107dia = all_data(:,6);
LA66rad = all_data(:,7);
LA66dia = all_data(:,8);

lens_18 = 'LX18';
lens_54 = 'LF54';
lens_107 = 'LL107';
lens_66 = 'LA66';

threshold = 0.02;
%% ____________________
%% LENS DESIGN PLOT
% 4. In the LENS DESIGN PLOT section, create a single plot with multiple 
% datasets on one figure window to show the diameter versus base curve 
% radius for each lens. Plot each lens design with a different color marker.
plot(LX18dia, LX18rad,'bx')
xlabel('Diameter in mm')
ylabel('Radius in mm')
title('Diamater vs radius base curve of contact lenses')
hold on;
plot(LF54dia, LF54rad,'co')
plot(LL107dia, LL107rad,'r+')
plot(LA66dia, LA66rad,'g.')
legend('LX18', 'LF54', 'LL107', 'LA66')


%% ____________________
%% FUNCTION CALLS
% a. Call your input-output stats UDF from PS04 to calculate the required 
% statistics for each lens parameter. Revise this function so that it does 
% not display anything to the Command Window.
[mean18rad, mean18dia, std18rad, std18dia] = PS04_stats_io_hkolagan(LX18rad, LX18dia);
[mean54rad, mean54dia, std54rad, std54dia] = PS04_stats_io_hkolagan(LF54rad, LF54dia);
[mean107rad, mean107dia, std107rad, std107dia] = PS04_stats_io_hkolagan(LL107rad, LL107dia);
[mean66rad, mean66dia, std66rad, std66dia] = PS04_stats_io_hkolagan(LA66rad, LA66dia);

% b. Call contactlens_decision.p using
% i. the appropriate lens design batch ID value, as a string variable
% ii. the calculated mean and standard deviation of both parameters for 
% each lens in the dataset
% iii. a threshold value of epsilon = 0.02.
contactlens_decision(lens_18, mean18rad, std18rad, mean18dia, std18dia, threshold);
contactlens_decision(lens_54, mean54rad, std54rad, mean54dia, std54dia, threshold);
contactlens_decision(lens_107, mean107rad, std107rad, mean107dia, std107dia, threshold);
contactlens_decision(lens_66, mean66rad, std66rad, mean66dia, std66dia, threshold);
%% ____________________
%% ANALYSIS 

%% -- Q1
% For an acceptable lens design, the values should be closer together
% because the ratio of the threshold vale and standard deviation should be
% very low, symbolzing a smaller range of values. For and unacceptable lens
% design, the values would span a longer range because the standard
% deviation will much higher in these type of designs. 


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.
%