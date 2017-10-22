function [SSE] = Project_M2Calibration_005_12(yl, yH, Tau, Ts, data, timeLabel, counter)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 Program Description 
%	Recieves the parameters determined by our algorithms and graphs the
%	piecewise function 
%
% Function Call
% 	Project_M2Calibration_005_12(Tau, yH, yl, ts)
%
% Input Arguments
%	1. Tau
%   2. yH
%   3. yl
%   4. ts
%
% Output Arguments
%	1. 
%
% Assignment Information
%	Assignment:         Type ##
%	Author:             Name, login@purdue.edu
%  	Team ID:            ###-##     
%  	Paired Programmer:  Name, login@purdue.edu
%  	Contributor:        Name, login@purdue [repeat for each contributor]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% INITIALIZATION ---
if counter < 21
    figureCounter = 1;
elseif counter >= 21 && counter < 41
    figureCounter = 2;
elseif counter >= 41 && counter < 61
    figureCounter = 3;
elseif counter >= 61 && counter < 81
    figureCounter = 4;
elseif counter >= 81 && counter < 101
    figureCounter = 5;
end
temp = data(:,1);

%% CALCULATIONS --
if temp(1) > temp(10240)
approximation = 0;
counter = 1;
while timeLabel(counter) < Ts
    approximation(counter) = yH;
    counter = counter + 1;
end
while timeLabel(counter:end) >= Ts
    approximation(counter) = yl + (yH - yl) * (exp(- (timeLabel(counter)-Ts) ./ Tau));
    counter = counter + 1;
end
%figure(figureCounter)
%plot(timeLabel,temp,'b-')
%xlabel('Time (sec)')
%ylabel('Temperature(Celsius)')
%hold on
%plot(timeLabel(1:1:counter-1),approximation,'r-')
%axis([0 10, -50 150])
%legend('Original Data','Piecewise')
%grid on;

elseif temp(1) < temp(10240)
approximation = 0;
counter = 1;
while timeLabel(counter) < Ts
    approximation(counter) = yl;
    counter = counter + 1;
end
while timeLabel(counter:end) >= Ts
    approximation(counter) = yl + (yH - yl) * (1 - exp(- (timeLabel(counter)-Ts) ./ Tau));
    counter = counter + 1;
end
%figure(figureCounter)
%plot(timeLabel,temp,'b-')
%xlabel('Time (sec)')
%ylabel('Temperature(Celsius)')
%hold on
%plot(timeLabel(1:1:counter-1),approximation,'r-')
%axis([0 10, -50 150])
%legend('Original Data','Piecewise')
%grid on;
end

num = sum((temp - approximation').^2);
denom = 10240;
SSE = num/denom;
%% FORMATTED TEXT & FIGURE DISPLAYS ---


%% COMMAND WINDOW OUTPUTS ---


%% ACADEMIC INTEGRITY STATEMENT ---
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.
%