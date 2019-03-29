%%% INSERT LEGEND AND AXIS

%% INSERT LEGEND
L1 = imread('./Tlegend1.png');
L2 = imread('./Tlegend2.png');


% RANGE OF LEGEND
lrow = 840:1100;
lcol = 430:1800;

% SET START POSITION
n0 = 330;       % horizontal pos
m0 = 200;       % vertical pos

% INSERT LEFT LEGEND
n = (1:length(lcol)) + (gap_h + n0) ;   %
m = (1:length(lrow)) + (ii*gap_v + ii*length(row) + m0);

% B(m,n,1:3) = L1(lrow,lcol,1:3);


% INSERT RIGHT LEGEND
n = (1:length(lcol)) + (jj*gap_h + length(col)) + n0; % 
m = (1:length(lrow)) + (ii*gap_v + ii*length(row) + m0);

% B(m,n,1:3) = L2(lrow,lcol,1:3);


%% CFU LEGEND
LC = imread('./CFUlegend.png');
n = (1:length(lcol)) + floor((length(B(1,:,1)))/2) - 650;

B(m,n,1:3) = LC(lrow,lcol,1:3);

%% INSERT AXIS
XZ = imread('./axis.png');
[arow, acol, ~] = size(XZ);

% INSERT AXIS TO THE LEFT
% horizontal pos
n0 = -50;

n = (1:acol) + (gap_h + n0);
m = (1:arow) + (ii*gap_v + ii*length(row) + m0);

B(m,n,1:3) = XZ(1:end,1:end,1:3);

% INSERT AXIS TO THE RIGHT
% horizontal pos
n0 = -1*acol + 60;

n = (1:acol) + (jj*gap_h + jj*length(col)) + n0;
m = (1:arow) + (ii*gap_v + ii*length(row) + m0);

B(m,n,1:3) = XZ(1:end,1:end,1:3);