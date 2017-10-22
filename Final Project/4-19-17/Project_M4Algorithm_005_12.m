function [yl, yH, Tau, Ts] = Project_M4Algorithm_005_12(time, temperature)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 Program Description
% Program Description
%   Takes lower_bound_smoothing_indexer set of data from lower_bound_smoothing_indexer thermocouple detecting lower_bound_smoothing_indexer temperature
%   change and calculates the parameters ts, Tau, yH, and yL
%
% Function Call
%    Project_M2Algorithm_005_12(time, temperature).
%
% Input Arguments
%   1.  Time - The x-component of the thermocouple data that we are given.
%   2.  Temperature - The y-component of the thermocouple data that we are
%   given.
%
% Output Arguments
%   1. yl - The lowest temperature that is determined from the minimum
%   value of the clean data we create by finding multiple moving averages
%   of the data.
%   2. yH - The highest temperature that is determined from the maximum
%   value of the clean data we create by finding multiple moving averages
%   of the data.
%   3. Tau - The time constant value that is determined.
%   4. Ts - The time step value that is determined.
% Assignment Information:
%   Assignment:     Final Project
%   Author:         Team 5, Section 12
%   Team ID:        005-12
%
% MUST USE SOFTWARE REMOTE TO RUN ALGORITHM; CONTAINS SMOOTHING FUNCTION
% ALSO NOTE: IN THE EFFORT TO LOWER VARIABLE NAME LENGTH, Y IN 
% A VARIABLE IS REFERING TO TEMPERATURE. X IN A VARIABLE IS REFERING TO
% TIME. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%INITIALIZATION
%Initialize slope vector elements as zeros
%adjacent_points_slope_vec(1:4) = 0;
%Initialize the slope average between adjacent points as 0 
adjacent_points_slope_avg = 0;
%Initialize variables to index the data vectors within the slope-average loops
lower_bound_data_indexer=1;
upper_bound_data_indexer=5;
%Initialize variables to index the vectors within the second 'smoothing'
%loop

%Initialize counters and starting/ending points in first smoothing loops

iteration_counter = 0;
vec_dimension = 1;
x_data_final = zeros(1,512);
y_data_final = zeros(1,512);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CALCULATIONS
% This commented out section of code is used to assess the accuracy of our
% revised algorithm with the datasets given in milestone 2.
%     allData = csvread('M2_Data_COOLING_CleanCalibration.csv', 0, 0);
%     temperature = allData(:,2);
%     time = allData(:,1);

%CATEGORY 1: This while loop that smooths the data using the smooth
%function (Which is defined/explained below.) was improved considerably.
%The data given to us was chopped into smaller chunks of data, so instead
%of smoothing 200 points at a time, the program smooths 20 points at a
%time. This gives the part of the code that utilizes the moving average
%more points to work with when stepping through the slopes of the smoothed line
%As a result, we can be much more accurate when looking at the average
%slope of the smoothed curve we make.
%Additionally the final set of data determined by the final smoothing of
%the given dataset is utilized for the rest of the algorithm. This means
%instead of just being used to find yH, and yL, it is also now used to find
%Tau, and Ts. Before, in our milestone 3 algorithm, after the
%iteration_counter loop was finished, and yH and yL were determined, the
%original dataset was smoothed again in a less effective manner using a
%coded-out moving average. This unfortunately, didn't smooth the curve as
%much as the iteration_counter loop did, and as a result, our parameter values were
%more off than we wanted them to be. To aleviate this, we find these moving
%averages which assess whether the slope suddenly increases or decreases
%using the final smooth data found in the iteration_counter loop, and as a
%result, we can more accurately determine the exact point where it changes.
while iteration_counter < 5 % The while loop will run for as long as iteration is less than 4, meaning four iterations will be performed. 
                            % This number was found to be the best overall balance of run-time efficiency and accuracy. As the number of iterations
                            % Increases, the total run time of the  function increases as well, however, the accuracy of the data found increases also.
                            % Through numerous tests, we have found that
                            % when 4 iterations are performed, the run-time
                            % isn't too bad and the determined values are
                            % considerably accurate 
    starting_pt = 1;
    ending_pt = 20; %The range for individual steps in the for loop below are determined.
    for counter = 1:20:10240 % This for loop runs for all the data values.
        if iteration_counter < 1 % First iteration of the while loop
         y_smoothrng_pts = temperature(starting_pt:1:ending_pt); % The range for the smoothing points has lower_bound_smoothing_indexer length of 200 total points
         x_smoothrng_pts = time(starting_pt:1:ending_pt);
         smooth_y(starting_pt:1:ending_pt) = smooth(y_smoothrng_pts,'moving'); % The smooth function is used for the 200 data point range given. The smooth function is basically 
                                                                               % lower_bound_smoothing_indexer function that utilizes lower_bound_smoothing_indexer designated method of regression for lower_bound_smoothing_indexer given set of data. By stating 'moving' in the
                                                                               % smooth function, that designates that lower_bound_smoothing_indexer moving average will be used to smooth/clean the data set.
         smooth_x(starting_pt:1:ending_pt) = smooth(x_smoothrng_pts,'moving');
         starting_pt = starting_pt + 20; % Both starting point and ending point are incremented by 200 to move to the next 200 points.
         ending_pt = ending_pt + 20;
        elseif iteration_counter < 2 && iteration_counter > 0 % When the for loop finishes for the first iteration, the second iteration is stated here.
                y_smoothrng_pts = smooth_y(starting_pt:1:ending_pt);   % The second iteration had the same exact process as the first one, except it uses the smoothed data set
                                                                       % from iteration 1 and smooths it further using the same method.             
                                                                     
                                                                                                                                          
                x_smoothrng_pts = smooth_x(starting_pt:1:ending_pt);
                smoother_y(starting_pt:1:ending_pt) = smooth(y_smoothrng_pts,'moving');
                smoother_x(starting_pt:1:ending_pt) = smooth(x_smoothrng_pts,'moving');
                starting_pt = starting_pt + 20;
                ending_pt = ending_pt + 20;
         elseif  iteration_counter < 3 && iteration_counter > 1 %Designates iteration 3
                     y_smoothrng_pts = smoother_y(starting_pt:1:ending_pt); % Uses smooth function with iteration 2's smooth data 
                     x_smoothrng_pts = smoother_x(starting_pt:1:ending_pt);
                     smooth_y_third(starting_pt:1:ending_pt) = smooth(y_smoothrng_pts,'moving');
                     smooth_x_third(starting_pt:1:ending_pt) = smooth(x_smoothrng_pts,'moving');
                     starting_pt = starting_pt + 20;
                     ending_pt = ending_pt + 20;
        elseif iteration_counter < 4 && iteration_counter > 2
             y_smoothrng_pts = smooth_y_third(starting_pt:1:ending_pt); % Uses smooth function with iteration 2's smooth data 
                     x_smoothrng_pts = smooth_x_third(starting_pt:1:ending_pt);
                     smooth_y_fourth(starting_pt:1:ending_pt) = smooth(y_smoothrng_pts,'moving');
                     smooth_x_fourth(starting_pt:1:ending_pt) = smooth(x_smoothrng_pts,'moving');
                     starting_pt = starting_pt + 20;
                     ending_pt = ending_pt + 20; 
        elseif iteration_counter < 5 && iteration_counter > 3 % Designates final iteration of the while loop
             x_data_final(vec_dimension) = (sum(smooth_x_fourth(starting_pt:1:ending_pt))./(20)); % Creates an average of the smooth data from iteration 4 every 200 points of data. This greatly smooths out the curve, and the previous iterations helped lower any error that 
                                                                                                % might occur when finding an average.
             y_data_final(vec_dimension) = (sum(smooth_y_fourth(starting_pt:1:ending_pt))./(20));
             starting_pt = starting_pt + 20;
             ending_pt = ending_pt + 20;
             vec_dimension = vec_dimension + 1;  
        end
    end
     iteration_counter = iteration_counter + 1; 
end


%Plots data after first smoothing loop
%plot(x_data_final,y_data_final, 'b-');
%Sets yL to the minimum of the smoothed data, and yH to the maximum of the smoothed data 
yl = min(y_data_final);
yH = max(y_data_final);

%Ts = x_data_final(lower_bound_data_indexer)
%We have the second smoothing loop that replaces the values returned from
%the first smoothing loop. This is because we can use the data from the
%first loop to determine yL and yH, however it is still too noisy to
%determine Ts and Tau, therefore we must take an average of points from a
%larger pool to create a smoother data set.
%This loop takes the average between every one and two hundred points of
%the original data set, then assigns these averages into vectors


%Create updated data vectors from the averaged data in the for loop

%Computes the average slope of sets of four points at a time, moving through the data
%set according to indexers "upper/lower_bound_data_indexer" until the average exceeds 40, indicating a sharp rise in slope,
%and assigns the value where this increase is detected to lower_bound_data_indexer

while abs(adjacent_points_slope_avg) <= 35
    x_refined_data_set = x_data_final(lower_bound_data_indexer:upper_bound_data_indexer);%Pulls data from original set into refined sets
    y_refined_data_set = y_data_final(lower_bound_data_indexer:upper_bound_data_indexer);
    adjacent_points_slope_vec(1) = (y_refined_data_set(2)-y_refined_data_set(1))/(x_refined_data_set(2)- x_refined_data_set(1));%computes slope between the adjacent points
    adjacent_points_slope_vec(2) = (y_refined_data_set(3)-y_refined_data_set(2))/(x_refined_data_set(3)- x_refined_data_set(2));
    adjacent_points_slope_vec(3) = (y_refined_data_set(4)-y_refined_data_set(3))/(x_refined_data_set(4)- x_refined_data_set(3));
    adjacent_points_slope_vec(4) = (y_refined_data_set(5)-y_refined_data_set(4))/(x_refined_data_set(5)- x_refined_data_set(4));
    
    adjacent_points_slope_avg = mean(adjacent_points_slope_vec);%computes the average of the calculated slopes between adjaent points in the set
     lower_bound_data_indexer = lower_bound_data_indexer +1;%incriments the data indexers
     upper_bound_data_indexer = upper_bound_data_indexer +1;

end
%Calculates Ts by indexing the updated data vectors at point lower_bound_data_indexer,
%where the slope increase was detected
Ts = x_data_final(lower_bound_data_indexer);
%Initializes variables used in the next while loop
y_value_indexer = 1;
%Finds the location in the matrix where y exceeds 63.2% of yH, assigns to
%indexer y_value_indexer
while temperature(y_value_indexer) <= yH*.632 %Runs the loop while the current y value is less than 63.2%
    y_value_indexer = y_value_indexer + 1;
end
%Calculates Tau by indexing the x data vector at indexer y_value_indexer, found from the loop above, then subtracts
%ts from this x-coordinate
 Tau_x = time(y_value_indexer);
 Tau = Tau_x - Ts;
 Tau = abs(Tau);
%Computes the final value in the y data set

%Conditional statement for cooling data, if the final value of y is lower
%than the intial value, it recalculates the parameters for the cooling data
%The if statement runs through the 4 loops again, but changes loop 3 to
%detect when the slope rises above negative one, as the data will be
%trending downward for cooling data. This is the same exact process for the
%heating data, the parameters for the if statements and loops are just
%different.
length_temp = length(temperature);
y_finalvalue = temperature(length_temp);
if y_finalvalue < y_data_final(1) %Now it runs if the last value is less than the first.
     adjacent_points_slope_vec(1) = 0;
     adjacent_points_slope_vec(2) = 0;
     adjacent_points_slope_vec(3) = 0;
     adjacent_points_slope_vec(4) = 0;
 
     adjacent_points_slope_avg = 0;
     lower_bound_data_indexer = 1;
     upper_bound_data_indexer = 5;
   while abs(adjacent_points_slope_avg)<= 35 %Same exact while loop when compared to the heating one.
        x_refined_data_set = x_data_final(lower_bound_data_indexer:upper_bound_data_indexer);
        y_refined_data_set = y_data_final(lower_bound_data_indexer:upper_bound_data_indexer);
        adjacent_points_slope_vec(1) = (y_refined_data_set(2)-y_refined_data_set(1))/(x_refined_data_set(2)- x_refined_data_set(1));
        adjacent_points_slope_vec(2) = (y_refined_data_set(3)-y_refined_data_set(2))/(x_refined_data_set(3)- x_refined_data_set(2));
        adjacent_points_slope_vec(3) = (y_refined_data_set(4)-y_refined_data_set(3))/(x_refined_data_set(4)- x_refined_data_set(3));
        adjacent_points_slope_vec(4) = (y_refined_data_set(5)-y_refined_data_set(4))/(x_refined_data_set(5)- x_refined_data_set(4));
    
        adjacent_points_slope_avg = mean(adjacent_points_slope_vec);
        lower_bound_data_indexer = lower_bound_data_indexer+1;
        upper_bound_data_indexer = upper_bound_data_indexer+1;

    end

    Ts = x_data_final(lower_bound_data_indexer);
    
    while adjacent_points_slope_avg > -1 % Extra while loop is made for cooling to account of the negative slope. Everything within the loop is the same process as the previous while loops however.
        x_refined_data_set = x_data_final(lower_bound_data_indexer:upper_bound_data_indexer);
        y_refined_data_set = y_data_final(lower_bound_data_indexer:upper_bound_data_indexer);
        adjacent_points_slope_vec(1) = (y_refined_data_set(2)-y_refined_data_set(1))/(x_refined_data_set(2)- x_refined_data_set(1));
        adjacent_points_slope_vec(2) = (y_refined_data_set(3)-y_refined_data_set(2))/(x_refined_data_set(3)- x_refined_data_set(2));
        adjacent_points_slope_vec(3) = (y_refined_data_set(4)-y_refined_data_set(3))/(x_refined_data_set(4)- x_refined_data_set(3));
        adjacent_points_slope_vec(4) = (y_refined_data_set(5)-y_refined_data_set(4))/(x_refined_data_set(5)- x_refined_data_set(4));
    
        adjacent_points_slope_avg = mean(adjacent_points_slope_vec);
        lower_bound_data_indexer = lower_bound_data_indexer+1;
        upper_bound_data_indexer = upper_bound_data_indexer+1;
         
    
    end
    %current_yvalue = temperature(1); % Category 2: Variable initialization
                                      % is not necessary in order to improve over runtime of the algorithm
    y_value_indexer = 1;
   
    while temperature(y_value_indexer) >= yH*.328
        %current_yvalue = temperature(y_value_indexer); % Category 2:
                                                        % Variable operation is no necessary because the counter variable
                                                        % can be used to analyze individual parts of the vector
        y_value_indexer = y_value_indexer+1;
    end

    Tau_x = time(y_value_indexer);
    Tau = Tau_x - Ts;
    Tau = abs(Tau);
end
% This UDF call is used to assess the accuracy of our
% revised algorithm with the datasets given in milestone 2.
% Project_M4Calibration_005_12(yl, yH, Tau, Ts, temperature, time, counter)



  