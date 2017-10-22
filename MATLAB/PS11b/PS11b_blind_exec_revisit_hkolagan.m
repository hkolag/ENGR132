function [] = PS11b_blind_exec_revisit_hkolagan()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%	Calculate the absorption fraction of the blind for a range of slat 
%   angles at given shadow angles.
%
% Function Call
% 	PS11b_blind_exec_revisit_hkolagan()
%
% Input Arguments
%	NONE
%
% Output Arguments
%	NONE
%
% Assigment Information
%   Assignment:    PS 11b, Problem 1
%   Author:        Harith Kolaganti, hkolagan@purdue.edu
%  	Team ID:       005-12
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
row = 1;
column = 1;

%% ____________________
%% CALCULATIONS
for slatAng = 10:10:170
    for shadAng = 15:15:45
        blind_para = [90 100 deg2rad(slatAng) deg2rad(shadAng) 0.5];
        M = (blind_para(1) * cos(blind_para(4))) / sin(blind_para(3) + blind_para(4));
    
        %Executes first UDf function
        [Fvec] = PS11b_all_fracs(blind_para,M);
    
        %Executes second UDF Function
        if M >= blind_para(2)
            [absorption] = PS11b_full_illum(Fvec, blind_para);
        end
    
        %Executes third UDF Function
        if M < blind_para(2)
            [absorption] = PS11b_part_illum(Fvec, blind_para(5));
        end
        
        matrix(row, column) = absorption;
        row = row + 1;
    end
    
    column = column + 1;
    row = 1;
end
%% ____________________
%% FORMATTED TEXT DISPLAY
plot(10:10:170, matrix(1,:),'r-')
hold on;
plot(10:10:170, matrix(2,:),'b-')
plot(10:10:170, matrix(3,:),'k-')
grid on;
legend('15 Degrees', '30 Degrees', '45 Degrees')
xlabel('Slat Angle in Degrees')
ylabel('Absorbtion Value')
title('Absorption Values at Various Slat Angles and Shadow Angles')

%% ____________________
%% COMMAND WINDOW OUTPUTS

%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.
%