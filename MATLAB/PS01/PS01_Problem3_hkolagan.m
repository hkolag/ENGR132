%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 Program Description 
%	This script ...
%
% Assignment Information
%	Assignment:         PS 01, Problem 3
%	Author:             Harith Kolaganti, hkolagan@purdue.edu
%  	Team ID:            005
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%% INITIALIZATION ---
total_points = 790.15; % total points earned at the end of semester
  total_abs = 5.0;       % total absences for the semester
 penalty = -50;         % penalty for each absence
%% CALCULATIONS ---
total_deduction = (total_abs - 3.0) * 2 * penalty; % lost points
final_points = total_points + total_deduction;     % final total


%% FORMATTED TEXT & FIGURE DISPLAYS ---
fprintf('Total points = %.0f\n', total_points)
fprintf('Total absences = %.1f\n', total_abs)
fprintf('The final student score is %.1f\n', final_points)

%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.
%


