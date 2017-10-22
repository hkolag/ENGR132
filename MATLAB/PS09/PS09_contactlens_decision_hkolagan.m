function [dec] = PS09_contactlens_decision_hkolagan(lens_ID,bc_mean,bc_std,d_mean,d_std,threshold)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 Program Description 
% Program Description 
%   Accepts the same inputs as contactlens_decision.p and returns the same 
%   output argument and printed results.
%
% Function Call
% 	[dec] = contactlens_decision_hkolagan(lens_ID,bc_mean,bc_std,d_mean,d_std,threshold)
%
% Input Arguments
%   1. lens_ID: The lens design batch ID (string)
%   2. bc_mean: mean of a lens design's base curve radius (mm)
%   3. bc_std: standard deviation of a lens design's base curve radius (mm)
%   4. d_mean: mean of a lens design's diameter (mm)
%   5. d_std: standard deviation of a lens design's diameters (mm)
%   6. threshold: acceptability ratio between a mean measurement and its
%    standard deviation (dimensionless)
%
% Output Arguments
%   1. dec: numerical indicator (1 for acceptable; 0 for unacceptable)
% 
% Assigment Information
%   Assignment:  	    PS 09, Problem 3
%   Author:             Harith Kolaganti, hkolagan@purdue.edu
%   Team ID:            005-12
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% ____________________
%% CALCULATIONS & FORMATTED TEXT
LRbcr = bc_std / bc_mean;

LRd = d_std / d_mean;

if(LRbcr < threshold && LRd < threshold)
    dec = 1;
    fprintf('Lens Design %s is ACCEPTABLE at a threshold ratio %.2f.\n', lens_ID, threshold)
elseif(LRbcr > threshold || LRd > threshold)
    dec = 0;
    fprintf('Lens Design %s is UNACCEPTABLE at a threshold ratio %.2f.\n', lens_ID, threshold)
end

%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.