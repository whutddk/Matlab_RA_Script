% 安诺6轴机械臂建模
% 武汉理工大学
% 李锐戈

clc;
clear;

theta1 = 0;
theta2 = -pi/2;
theta3 = -pi/2;
theta4 = 0;
theta5 = 0;
theta6 = 0;

%DH_TAB = [ 0,0,0,theta1;    -pi/2,0,0,theta2;   0,225,0,theta3; -pi/2,0,217.3,theta4;   pi/2,0,0,theta5;    -pi/2,0,0,theta6 ];


TB_0 = [1,0,0,0;    0,1,0,0;    0,0,1,264;  0,0,0,1];
T6_t = [1,0,0,0;    0,1,0,0;    0,0,1,40+114;   0,0,0,1];

T01 = [cos(theta1),-sin(theta1),0,0;    sin(theta1)*cos(0),cos(theta1)*cos(0),-sin(0),-sin(0)*0;                    sin(theta1)*sin(0),cos(theta1)*sin(0),cos(0),cos(0)*0;                          0,0,0,1];
T12 = [cos(theta2),-sin(theta2),0,0;	sin(theta2)*cos(-pi/2),cos(theta2)*cos(-pi/2),-sin(-pi/2),-sin(-pi/2)*0;    sin(theta2)*sin(-pi/2),cos(theta2)*sin(-pi/2),cos(-pi/2),cos(-pi/2)*0;          0,0,0,1];
T23 = [cos(theta3),-sin(theta3),0,225;  sin(theta3)*cos(0),cos(theta3)*cos(0),-sin(0),-sin(0)*0;                 	sin(theta3)*sin(0),cos(theta3)*sin(0),cos(0),cos(0)*0;                          0,0,0,1];
T34 = [cos(theta4),-sin(theta4),0,0;    sin(theta4)*cos(-pi/2),cos(theta4)*cos(-pi/2),-sin(-pi/2),-sin(-pi/2)*217.3;sin(theta4)*sin(-pi/2),cos(theta4)*sin(-pi/2),cos(-pi/2),cos(-pi/2)*217.3;      0,0,0,1];
T45 = [cos(theta5),-sin(theta5),0,0;    sin(theta5)*cos( pi/2),cos(theta5)*cos( pi/2),-sin( pi/2),-sin( pi/2)*0;    sin(theta5)*sin( pi/2),cos(theta5)*sin( pi/2),cos( pi/2),cos( pi/2)*0;          0,0,0,1];
T56 = [cos(theta6),-sin(theta6),0,0;    sin(theta6)*cos(-pi/2),cos(theta6)*cos(-pi/2),-sin(-pi/2),-sin(-pi/2)*0;    sin(theta6)*sin(-pi/2),cos(theta6)*sin(-pi/2),cos(-pi/2),cos(-pi/2)*0;          0,0,0,1];

PB = [1,0,0,0;  0,1,0,0;    0,0,1,0;    0,0,0,1];

Ptail =  PB * TB_0 * T01 * T12* T23 * T34 * T45*  T56 * T6_t 




%逆
T06 = T01 * T12 * T23 * T34 * T45 * T56








