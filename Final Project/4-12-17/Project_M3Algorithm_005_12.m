function [yl, yH, Tau, Ts] = Project_M3Algorithm_005_12(time, temperature)
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
%   Assignment:     Project, Milestone III
%   Author:         Andrew Sartorio, asartor
%   Team ID:        125-12
%   Contributers:   Tyler Huter, thuter@purdue.edu, Harith Kolaganti,
%                   hkolag@purdue.edu
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
lower_bound_smoothing_indexer = 1;
upper_bound_smoothing_indexer = 200;
smoothed_vector_indexer=1;
%Initialize counters and starting/ending points in first smoothing loops
starting_pt = 1;
ending_pt = 200;
veca_to_b = [starting_pt:1:ending_pt];
iteration_counter = 0;
vec_dimension = 1;
%For loop to take the average between every 200 data points, this allows
%the parameters to be calculated more effectively
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CALCULATIONS

while iteration_counter < 4 % The while loop will run for as long as iteration is less than 4, meaning four iterations will be performed. 
                            % This number was found to be the best overall balance of run-time efficiency and accuracy. As the number of iterations
                            % Increases, the total run time of the  function increases as well, however, the accuracy of the data found increases also.
                            % Through numerous teses, we have found that
                            % when 4 iterations are performed, the run-time
                            % isn't too bad and the determined values are
                            % considerably accurate 
    starting_pt = 1;
    ending_pt = 200; %The range for individual steps in the for loop below are determined.
    for counter = 1:200:10200 % This for loop runs for all the data values.
        if iteration_counter < 1 % First iteration of the while loop
         y_smoothrng_pts = temperature(starting_pt:1:ending_pt); % The range for the smoothing points has lower_bound_smoothing_indexer length of 200 total points
         x_smoothrng_pts = time(starting_pt:1:ending_pt);
         smooth_y(starting_pt:1:ending_pt) = smooth(y_smoothrng_pts,'moving'); % The smooth function is used for the 200 data point range given. The smooth function is basically 
                                                                               % lower_bound_smoothing_indexer function that utilizes lower_bound_smoothing_indexer designated method of regression for lower_bound_smoothing_indexer given set of data. By stating 'moving' in the
                                                                               % smooth function, that designates that lower_bound_smoothing_indexer moving average will be used to smooth/clean the data set.
         smooth_x(starting_pt:1:ending_pt) = smooth(x_smoothrng_pts,'moving');
         starting_pt = starting_pt + 200; % Both starting point and ending point are incremented by 200 to move to the next 200 points.
         ending_pt = ending_pt + 200;
        elseif iteration_counter < 2 && iteration_counter > 0 % When the for loop finishes for the first iteration, the second iteration is stated here.
                y_smoothrng_pts = smooth_y(starting_pt:1:ending_pt);   % The second iteration had the same exact process as the first one, except it uses the smoothed data set
                                                                       % from iteration 1 and smooths it further using the same method.             
                                                                     
                                                                                                                                          
                x_smoothrng_pts = smooth_x(starting_pt:1:ending_pt);
                smoother_y(starting_pt:1:ending_pt) = smooth(y_smoothrng_pts,'moving');
                smoother_x(starting_pt:1:ending_pt) = smooth(x_smoothrng_pts,'moving');
                starting_pt = starting_pt + 200;
                ending_pt = ending_pt + 200;
         elseif  iteration_counter < 3 && iteration_counter > 1 %Designates iteration 3
                     y_smoothrng_pts = smoother_y(starting_pt:1:ending_pt); % Uses smooth function with iteration 2's smooth data 
                     x_smoothrng_pts = smoother_x(starting_pt:1:ending_pt);
                     smooth_y_third(starting_pt:1:ending_pt) = smooth(y_smoothrng_pts,'moving');
                     smooth_x_third(starting_pt:1:ending_pt) = smooth(x_smoothrng_pts,'moving');
                     starting_pt = starting_pt + 200;
                     ending_pt = ending_pt + 200;
        elseif iteration_counter < 4 && iteration_counter > 2 % Designates final iteration of the while loop
             x_data_final(vec_dimension) = (sum(smooth_x_third(starting_pt:1:ending_pt))./(200)); % Creates an average of the smooth data from iteration 4 every 200 points of data. This greatly smooths out the curve, and the previous iterations helped lower any error that 
                                                                                                % might occur when finding an average.
             y_data_final(vec_dimension) = (sum(smooth_y_third(starting_pt:1:ending_pt))./(200));
             starting_pt = starting_pt + 200;
             ending_pt = ending_pt + 200;
             vec_dimension = vec_dimension + 1; 
        end
    end
    iteration_counter = iteration_counter + 1; 
end
   

%Plots data after first smoothing loop
%plot(x_data_final, y_data_final, 'upper_bound_smoothing_indexer-')
%Sets yL to the minimum of the smoothed data, and yH to the maximum of the smoothed data 
yl = min(y_data_final);
yH = max(y_data_final);
%We have the second smoothing loop that replaces the values returned from
%the first smoothing loop. This is because we can use the data from the
%first loop to determine yL and yH, however it is still too noisy to
%determine Ts and Tau, therefore we must take an average of points from a
%larger pool to create a smoother data set.
%This loop takes the average between every one and two hundred points of
%the original data set, then assigns these averages into vectors
for counter = 1:200:10200
    new_smoothed_x_data(smoothed_vector_indexer) = (time(lower_bound_smoothing_indexer)+time(upper_bound_smoothing_indexer))/2;
    new_smoothed_y_data(smoothed_vector_indexer) = (temperature(lower_bound_smoothing_indexer)+temperature(upper_bound_smoothing_indexer))/2;
    smoothed_vector_indexer = smoothed_vector_indexer+ 1;
    lower_bound_smoothing_indexer = lower_bound_smoothing_indexer + 200;
    upper_bound_smoothing_indexer = upper_bound_smoothing_indexer + 200;
    
end

%Create updated data vectors from the averaged data in the for loop

%Computes the average slope of sets of four points at a time, moving through the data
%set according to indexers "upper/lower_bound_data_indexer" until the average exceeds 40, indicating a sharp rise in slope,
%and assigns the value where this increase is detected to lower_bound_data_indexer

while abs(adjacent_points_slope_avg) <= 35   
    x_refined_data_set = new_smoothed_x_data(lower_bound_data_indexer:upper_bound_data_indexer);%Pulls data from original set into refined sets
    y_refined_data_set = new_smoothed_y_data(lower_bound_data_indexer:upper_bound_data_indexer);
    adjacent_points_slope_vec(1) = (y_refined_data_set(2)-y_refined_data_set(1))/(x_refined_data_set(2)- x_refined_data_set(1));%computes slope between the adjacent points
    adjacent_points_slope_vec(2) = (y_refined_data_set(3)-y_refined_data_set(2))/(x_refined_data_set(3)- x_refined_data_set(2));
    adjacent_points_slope_vec(3) = (y_refined_data_set(4)-y_refined_data_set(3))/(x_refined_data_set(4)- x_refined_data_set(3));
    adjacent_points_slope_vec(4) = (y_refined_data_set(5)-y_refined_data_set(4))/(x_refined_data_set(5)- x_refined_data_set(4));
    
    adjacent_points_slope_avg = mean(adjacent_points_slope_vec);%computes the average of the calculated slopes between adjaent points in the set
     lower_bound_data_indexer = lower_bound_data_indexer +1;%incriments the data indexers
     upper_bound_data_indexer = upper_bound_data_indexer +1;
     %Terminates loop if indexer exceeds the length of the matrix to avoid
     %exceeding matrix dimensions
     if upper_bound_data_indexer >= length(new_smoothed_x_data)
         adjacent_points_slope_avg = 50;
     end
end
%Calculates Ts by indexing the updated data vectors at point lower_bound_data_indexer,
%where the slope increase was detected
Ts = new_smoothed_x_data(lower_bound_data_indexer);
%Initializes variables used in the next while loop
current_yvalue = 0;
y_value_indexer = 1;
%Finds the location in the matrix where y exceeds 63.2% of yH, assigns to
%indexer y_value_indexer
while current_yvalue <= yH*.632 %Runs the loop while the current y value is less than 63.2%
    current_yvalue = temperature(y_value_indexer); %Assigns the current value of y to the o
    y_value_indexer = y_value_indexer+1;
end
%Calculates Tau by indexing the x data vector at indexer y_value_indexer, found from the loop above, then subtracts
%ts from this x-coordinate
Tau_x = time(y_value_indexer);
Tau = Tau_x - Ts;
Tau = abs(Tau);
%Computes the final value in the y data set
y_length = length(temperature);
y_finalvalue = temperature(y_length);
%Conditional statement for cooling data, if the final value of y is lower
%than the intial value, it recalculates the parameters for the cooling data
%The if statement runs through the 4 loops again, but changes loop 3 to
%detect when the slope rises above negative one, as the data will be
%trending downward for cooling data. This is the same exact process for the
%heating data, the parameters for the if statements and loops are just
%different.
if y_finalvalue < temperature(1) %Now it runs if the last value is less than the first.
    adjacent_points_slope_vec(1) = 0;
    adjacent_points_slope_vec(2) = 0;
    adjacent_points_slope_vec(3) = 0;
    adjacent_points_slope_vec(4) = 0;

    adjacent_points_slope_avg = 0;
    lower_bound_data_indexer=1;
    upper_bound_data_indexer=5;
    lower_bound_smoothing_indexer = 1;
    upper_bound_smoothing_indexer = 200;
    smoothed_vector_indexer = 1;

    for counter = 1:200:10200 %Same process as the heating for loop
        new_smoothed_x_data(smoothed_vector_indexer) = (sum(time(lower_bound_smoothing_indexer:upper_bound_smoothing_indexer))./200);
        new_smoothed_y_data(smoothed_vector_indexer) = (sum(temperature(lower_bound_smoothing_indexer:upper_bound_smoothing_indexer))./200);
        smoothed_vector_indexer = smoothed_vector_indexer+ 1;
        lower_bound_smoothing_indexer= lower_bound_smoothing_indexer + 200;
        upper_bound_smoothing_indexer = upper_bound_smoothing_indexer + 200;
    end
  
    while abs(adjacent_points_slope_avg)<= 35 %Same exact while loop when compared to the heating one.
        x_refined_data_set = new_smoothed_x_data(lower_bound_data_indexer:upper_bound_data_indexer);
        y_refined_data_set = new_smoothed_y_data(lower_bound_data_indexer:upper_bound_data_indexer);
        adjacent_points_slope_vec(1) = (y_refined_data_set(2)-y_refined_data_set(1))/(x_refined_data_set(2)- x_refined_data_set(1));
        adjacent_points_slope_vec(2) = (y_refined_data_set(3)-y_refined_data_set(2))/(x_refined_data_set(3)- x_refined_data_set(2));
        adjacent_points_slope_vec(3) = (y_refined_data_set(4)-y_refined_data_set(3))/(x_refined_data_set(4)- x_refined_data_set(3));
        adjacent_points_slope_vec(4) = (y_refined_data_set(5)-y_refined_data_set(4))/(x_refined_data_set(5)- x_refined_data_set(4));
    
        adjacent_points_slope_avg = mean(adjacent_points_slope_vec);
        lower_bound_data_indexer = lower_bound_data_indexer+1;
        upper_bound_data_indexer = upper_bound_data_indexer+1;
        %Terminates loop if indexer exceeds the length of the matrix to avoid
        %exceeding matrix dimensions
        if upper_bound_data_indexer >= length(new_smoothed_x_data)
         adjacent_points_slope_avg = 50;
     end
    end

    Ts = new_smoothed_x_data(lower_bound_data_indexer);
    
    while adjacent_points_slope_avg < -1 % Extra while loop is made for cooling to account of the negative slope. Everything within the loop is the same process as the previous while loops however.
        x_refined_data_set = new_smoothed_x_data(lower_bound_data_indexer:upper_bound_data_indexer);
        y_refined_data_set = new_smoothed_y_data(lower_bound_data_indexer:upper_bound_data_indexer);
        adjacent_points_slope_vec(1) = (y_refined_data_set(2)-y_refined_data_set(1))/(x_refined_data_set(2)- x_refined_data_set(1));
        adjacent_points_slope_vec(2) = (y_refined_data_set(3)-y_refined_data_set(2))/(x_refined_data_set(3)- x_refined_data_set(2));
        adjacent_points_slope_vec(3) = (y_refined_data_set(4)-y_refined_data_set(3))/(x_refined_data_set(4)- x_refined_data_set(3));
        adjacent_points_slope_vec(4) = (y_refined_data_set(5)-y_refined_data_set(4))/(x_refined_data_set(5)- x_refined_data_set(4));
    
        adjacent_points_slope_avg = mean(adjacent_points_slope_vec);
        lower_bound_data_indexer = lower_bound_data_indexer+1;
        upper_bound_data_indexer = upper_bound_data_indexer+1;
         
    end

    current_yvalue = 0;
    y_value_indexer = 1;
    while current_yvalue <= yH*.632
        current_yvalue = temperature(y_value_indexer);
        y_value_indexer = y_value_indexer+1;
    end

    Tau_x = time(y_value_indexer);
    Tau = Tau_x - Ts;
    Tau = abs(Tau);

end




  