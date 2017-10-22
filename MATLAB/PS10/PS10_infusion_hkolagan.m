function [totTime, adminDose] = PS10_infusion_hkolagan(patW, medDose)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%   Calculates how long an infusion will last given a patient�s weight and 
%   medication dosage.
%
% Function Call
% 	[totTime, adminDose] = PS10_infusion_hkolagan(patW, medDose)
%
% Input Arguments
%   1. patW       % Patient's weight
%   2. medDose    % Medication Dose 
%
% Output Arguments
%   1. totTime    % Total time for infusion
%   2. adminDose  % Total administered dose 
%
% Assigment Information
%   Assignment:  	    PS 10, Problem 3
%   Author:             Harith Kolaganti, hkolagan@purdue.edu
%   Team ID:            005-12
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% ____________________
%% INITIALIZATION
y = 0;
numberRateInc = round(0.05 * patW) + 1;
infRate = 75; 
adminDose = 75;
totTime = 1;

% Input Validity Check
if (patW > 175 || patW < 40)
    fprintf('Weight is out of boundaries\n');
    y = 1;
end

if(medDose > 100 || medDose < 25)
    fprintf('Dosage is out of boundaries\n');
    y = 1;
end
%% ____________________
%% CALCULATIONS
if y ~= 1
    % First Phase of Infusion
    for totTime = 2:numberRateInc
        infRate = infRate + round(0.5 * infRate);
        adminDose = adminDose + infRate;
    end
    
    % Second Phase of Infusion
    while(adminDose <= (patW * medDose))
        infRate = infRate + round(0.1 * infRate);
        adminDose = adminDose + infRate;
        totTime = totTime + 1;
    end
%% ____________________
%% FORMATTED TEXT DISPLAYS
    fprintf('Administered Dose = %d mg\n', adminDose);
    fprintf('Total Time for Infusion = %d minutes\n', totTime);
end
%% ____________________
%% COMMAND WINDOW OUTPUTS
% PS10_infusion_hkolagan(60, 25)
% Administered Dose = 1543 mg
% Total Time for Infusion = 7 minutes


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.