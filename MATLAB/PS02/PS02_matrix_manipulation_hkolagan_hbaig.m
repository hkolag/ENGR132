%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%   ...
%
% Assigment Information
%   Assignment:  	    PS 02, Problem 1
%   Author:             Harith Kolaganti, hkolagan@purdue.edu
%   Team ID:            005
%  	Paired Programmer:  Hyder Ali Baig, hbaig@purdue.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
A([1:7],[1:7]) = 10; %a. Use the built-in MATLAB function ones to create a 7x7 matrix filled with 10s.
A([2:6], [2:6]) = 9; %b. Using matrix manipulations, replace the inner 5x5 matrix with 9s.
A([3:5], [3:5]) = 8; %c. Using matrix manipulations, replace the inner 3x3 matrix with 8s.
A(4,4) = 7;          %d. Using matrix manipulations, replace the innermost value with a 7.
%% ____________________
%% COPY VECTORS
B = A(4,[4:7]);  %a. Copy from A, a 4-element row vector that counts up from 7 to 10 and assign it to B.
C = A(4, [2:4]); %b. Copy from A, a 3-element row vector that counts down from 9 to 7 and assign it to C.
D = A([4:7],4);  %c. Copy from A, a 4-element column vector that counts up from 7 to 10 and assign it to D
E = A([2:4], 4); %d. Copy from A, a 3-element column vector that counts down from 9 to 7 and assign it to E.

%% ____________________
%% REPLACE MATRIX ELEMENTS
% a. Use only vectors B-E, as appropriate, to replace the first row of A as shown below. Continue
% to use only vectors B-E, as appropriate, to replace the first column of A, the last row of A, and
% the last column of A as shown below.
A([1:4], 1) = D;
A(1, [1:4]) = B;
A(1,[5:7]) = C;
A([1:4], 7) = D;
A([5:7], 7) = E;
A([5:7], 1) = E;
A(7, [1:4]) = B;
A(7, [5:7]) = C;

% b. In the top left corner of A, replace the 7 with the sum of the three values adjacent to it using
% array indexing. See PS01, Problem 5 “Useful MATLAB Commands” in the green box for help
% with array indexing.
% Repeat for the top right corner of A, the bottom right corner of A, and the bottom left corner of
% A.
A(1) = A(2) + A(8) + A(9);
A(7) = A(6) + A(13) + A(14);
A(43) = A(36) + A(37) + A(44);
A(49) = A(41) + A(42) + A(48);

% c. Replace the center value of A with the sum of the eight surrounding values.
A(25) = A(17) + A(18) + A(19) + A(24) + A(26) + A(31) + A(32) + A(33);
%% ____________________
%% CONCATENATION
%a. Create a vector X that contains the sums of the columns of A.
X(:,1) = sum(A([1:7],1));
X(:,2) = sum(A([1:7],2));
X(:,3) = sum(A([1:7],3));
X(:,4) = sum(A([1:7],4));
X(:,5) = sum(A([1:7],5));
X(:,6) = sum(A([1:7],6));
X(:,7) = sum(A([1:7],7));

% b. Concatenate vector X to the bottom of matrix A (from Step 7.c) to create a new matrix, B.
% Concatenation requires the use of square brackets.
B = cat(1, A, X)

%c. Create a vector Y that contains the sums of the rows of B.
Y(1,:) = sum(B(1, [1:7]));
Y(2,:) = sum(B(2, [1:7]));
Y(3,:) = sum(B(3, [1:7]));
Y(4,:) = sum(B(4, [1:7]));
Y(5,:) = sum(B(5, [1:7]));
Y(6,:) = sum(B(6, [1:7]));
Y(7,:) = sum(B(7, [1:7]));
Y(8,:) = sum(B(8, [1:7]));
%d. Concatenate vector Y to the right of matrix B (from Step 8.b) to create a new matrix, C. 
% Concatenation requires the use of square brackets.
C = cat(2, B, Y) 
%% ____________________
%% DISPLAY 
%In the DISPLAY section of your script file, use three fprintf statements to display your results as shown:
fprintf('\nAfter doing step 7.c, the value in the center of A is %.2f\n', A(25)) 
fprintf('After doing step 8.d, the value in the upper left of C is %.2f and the value in the upper right of C is %.2f\n', C(1), C(43))
fprintf('After doing step 8.d, the value in the lower left of C is %.2f and the value in the lower right of C is %.2f\n', C(7), C(49))

%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I/We have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I/we provided
% access to my/our code to another. The project I/we am/are submitting
% is my/our own original work.
