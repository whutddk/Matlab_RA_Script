% 逆运动学，求theta456
% warning: ANNO的模型和puma其实是不一致的，因为零点不同
%syms theta1 theta2 theta3 theta4 theta5 theta6;
clear
clc
syms s1 c1 s2 c2 s3 c3 s4 c4 s5 c5 s6 c6

%s1 = sin(theta1);
%c1 = cos(theta1);

%s2 = sin(theta2);
%c2 = cos(theta2);

%s3 = sin(theta3);
%c3 = cos(theta3);

%s4 = sin(theta4);
%c4 = cos(theta4);

%s5 = sin(theta5);
%c5 = cos(theta5);

%s6 = sin(theta6);
%c6 = cos(theta6);


T01 = [c1 0 s1;s1 0 -c1;0 1 0];
T12 = [-s2 -c2 0;c2 -s2 0;0 0 1];
T23 = [c3 0 s3; s3 0 -c3; 0 1 0];

T34 = [c4 0 s4;s4 0 -c4;0 1 0];
T45 = [-s5 0 c5;c5 0 s5; 0 1 0];
T56 = [c6 -s6 0;s6 c6 0;0 0 1];

T01*T12*T23*T34*T45*T56
T34*T45*T56
T04 = T01*T12*T23
inv(T01*T12*T23)
%T06 = T01*T12*T23*[0 0 1;0 -1 0;1 0 0]*[1 0 0;0 c6 -s6;0 s6 c6]*[c5 0 s5;0 1 0;-s5 0 c5]*[c4 -s4 0;s4 c4 0;0 0 1]


T06 = T01*T12*T23*[1 0 0;0 c6 -s6;0 s6 c6]*[c5 0 s5;0 1 0;-s5 0 c5]*[c4 -s4 0;s4 c4 0;0 0 1]

