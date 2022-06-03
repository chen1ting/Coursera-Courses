% Octave Cheat Sheet

% Section 1: Basic Operations -- note: use ';' to pause output print

% Section 2: Move Data Around -- easy manipulation of matrices

A = [1 2; 3 4; 5 6] % create a 3x2 matrix
[nr, nc] = size(A) % get size of matrix
m = length(A) % get the size of max dimension

pwd % show current position
ls % list files in the current directory
cd % change directory

f = load("filename.txt/.dat") % load data from files
f = load filename.txt % similar operation

who % show variable in the current scope
whos % show detailed information in the current scope (including size/bytes/class)

clear A % get rid of a variable
clear % get rid of everything

% concatenation
A = [6 7; 8 9; 10 11]
B = [0 1; 2 3; 4 5]
C = [A B] % put B on the right of A, same as [A, B]
C = [A; B] % put B on the bottom of A
A = [A, [100; 101; 102]] % append a column on the right of A
A = [A; [99 98 97]] % append a row at the bottom

% slicing: logic similar to python
v = A(:, 1) % get the first column
A(3, 2) % get the second element of the third rows
A([1,3],:) % get everything in matrix A from the first and third row
A(:, 2) = [5; 6; 7] % replace the second column of A

save hello.txt A -ascii %save as text(ASCII)
help save % find documentation of the help function






% Section 3: Computing on data
A = [1 2; 3 4; 5 6];
B = [11 12; 13 14; 15 16];
C = [1 1; 2 2];
A * C % 3x2 matrix multiply by 2x2 matrix gives 3x2 matrix

% '.' specifies element-wise operations
A .* B % matrix dot multiplication (multiply elements on the same position), need to have same size
A .^ 2 % square every elemetn in A
1 ./ A % 1 divide every element in A
log(A) % compute natural logarithm of every element in A
exp(A) % compute natural exponential of every element in A
abs(A)% get absolute value of every element in A
-A % same as -1 * A

v = [1;2;3]
v + ones(length(v), 1) % can only be safely used in vectors to add 1 to each element
v + 1 % same function as above, much easier

A' % A transpose
transpose(A) % same function as above

% find Max & Mins
val = max(v)  % vector
[val, idx] = max(v) % returns index of the max value
max(A) % returns the max value of every column in A
[val, idx] = max(A) % returns the max value of every column in A, and its row in the column
max(A, [], 1) % same function as above
max(A, [], 2) % returns the max value of every row in A
max(max(A)) % returns the max element value of a 2D matrix
max(rand(3), rand(3)) % returns the element-wise maximum of each matrix

% boolean values
A < 3
A = magic(3)
help magic
find(A < 3) % returns the position of the valid value in A
[r, c] = find(A < 3) % find row and column of the found valid value

sum(A) % returns the sum of each column
sum(A, 1) % same function as above
sum(A, 2)% returns the sum of each row
sum(sum(A .* eye(9))) % returns the sum of the top left corner diagonal
sum(sum(A .* flipud(eye(9)))) % returns the sum of the top right corner diagonal
% fliup: flip a matrix upside down

pinv(A) % sudo find the inverse matrix of A

prod(A) % returns the product of each column
floor(A)
ceil(A) % floor/ceil are element-wise operations
rand(3) % give a random 3x3 matrix (normal distribution between 0 and 1)
rand(3, 1) % give randowm vector of size 3x1
randn(3) % give a random 3x3 matrix (normal distribution with mean = 0)





% Section 4: Plotting data
t = [0:0.01:0.98]; % generate 1x98 matrix from 0 to 0.98 with step width 0.01
y1 = sin(2*pi*4*t);
y2 = cos(2*pi*4*t);

% 2 plots with one function on each
plot(t, y1);
plot(t, y2);

% 1 plot with 2 lines -- each in accordance with one function
plot(t, y1);
hold on;
plot(t, y2, 'r');
xlable('time') % lable of the x axis
ylable('value')
legend('sin', 'cos')
title('my plot')
cd 'C:\Users\ychen21\Desktop'
print -dpng 'myPlot.png' % save the plot
close % close the plot

% labling plots
figure(1); plot(t, y1);
figure(2); plot(t, y2);

% subplots
subplot(1,2,1); % divides plot into a 1x2 grid. third parameter: access the first element
ploy(t, y1);
subplot(1,2,2); % access the second plot in a 1x2 grid
plot(t, y2);
axis([0.5 1 -1 1]) % specify the range of x and y axis in the current plot
% help axis
clf; % clear the plot

% heat map
A = magic(6) % Display a scaled version of the matrix IMG as a color image.
imagesc(A) % normal color map
imagesc(A), colorbar, colormap gray % black and white heat map
imagesc(mafic(15))






% Section 5: control statements: for, while, if statement
v = zeros(1, 10)

% for loop
for i=1:10,
  v(i) = 2^i % it doesn't matter whether v is 1x10 or 10x1
end;

% while loop, continue, break
i = 1;
while i <= 5,
  v(i) = 100;
  i = i+1; % octave doesn't support i++ statement;
end;

i = 1;
while true,
  v(i) = 999;
  if i == 6,
    break;
  endif; % can also use end;
  i = i+1;
end;

% if-else
if v(1) == 1,
  disp('The value is one'); % octave use semi-colon to denote string
elseif v(1) == 2,
  disp('The value is two');
else
  disp('The value is neither one nor two');
end;

% function - create a new .m file with function name
function y = squareThisNumber(x) %return 1 value
  y = x^2;

function [y1, y2] = squareAndCubeThisNumber(x)
  y1 = x^2;
  y2 = x^3;

% advanced operation
addpath('C:\Users\ychen21\Documents\GitHub\Coursera-Courses\Stanford-CS299-MachineLearning\ex1-ex8-octave\ex1-octave')
% the above statement make sure that the function can be found even if it is notunder the same directory





% Section 6: vectorization -- replace for-loops with vectors
% Hint: Unrolling Parameters for back propagation
% Assumption: We have a 3 layer neural network with s1=10, s2=11, s3=1 (representing number of nodes in each layer)
% So, theta1&D1 should be 10x11; theta2&D2 should be 10x11; theta3&D3 should be 1x11;
D1 = ones(10,11); % D1 is a 61
theta1 = ones(10,11);
D2 = ones(10,11).*2;
theta2 = ones(10,11).*2;
D3 = ones(1,11).*3;
theta3 = ones(1,11).*3;

% to unroll them,
thetaVec = [theta1(:);theta2(:);theta3(:)]; % theta1(:) transform theta1 into a vector (110x1)
DVec = [D1(:); D2(:); D3(:)];
% to get the original matrix back:
theta1 = reshape(thetaVec(1:110), 10, 11);
theta2 = reshape(thetaVec(111:220), 10, 11);
theta1 = reshape(thetaVec(221:231), 1, 11);
% Octave is so cool!
% Why need parameters unrolling? -- To use fminunc function
% Function header for costFunction:
function [jval, gradientVec] = costFunction(thetaVec);
fminunc(@costFunction, initialTheta, options);

