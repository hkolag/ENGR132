function[] = PS11_infusion_exec_hkolagan()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%   Produces a plot of total administered medication over time of the 
%   infusion.
%
% Function Call
% 	PS11_infusion_exec_hkolagan()
%
% Input Arguments
%   NONE
%
% Output Arguments
%   NONE
%
% Assigment Information
%   Assignment:  	    PS 11, Problem 1
%   Author:             Harith Kolaganti, hkolagan@purdue.edu
%   Team ID:            005-12
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% ____________________
%% INITIALIZATION
% Initialize the patient’s weight and dose
patW = 75;
medDose = 85;

%% ____________________
%% CALCULATIONS
% Call the sub-UDF to get the time and administered medication vectors
[time, totDose] = PS11_infusion_hkolagan(patW, medDose);


%% ____________________
%% FIGURE DISPLAYS
% Plot the vectors
plot(time, totDose)
xlabel('Time in Seconds');
ylabel('Total Administered Dose in mg');
title('Medication Infusion Over Time');
grid on;


%% ____________________
%% COMMAND WINDOW OUTPUTS



%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.