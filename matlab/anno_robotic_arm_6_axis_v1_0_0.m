% 安诺6轴机械臂建模
% 武汉理工大学
% 李锐戈

clc;
clear;

Pb = [1,0,0,0;  0,1,0,0;    0,0,1,0;    0,0,0,1];

%theta1 = pi/2;
%theta2 = 0;
%theta3 = 0;
%theta4 = 0;
%theta5 = pi/2;
%theta6 = 0;

syms theta1 theta2 theta3 theta4 theta5 theta6;



Ts_b = [cos(theta1),-sin(theta1),0,0;	sin(theta1),cos(theta1),0,0;    0,0,1,0;  0,0,0,1];
Ta_s = [cos(theta2),0,sin(theta2),0;    0,1,0,0;    -sin(theta2),0,cos(theta2),264;  0,0,0,1];
Te_a = [cos(theta3),0,sin(theta3),0;    0,1,0,0;    -sin(theta3),0,cos(theta3),225;    0,0,0,1];
Tw_e = [cos(theta4),-sin(theta4),0,0;   sin(theta4),cos(theta4),0,0;    0,0,1,80;   0,0,0,1];
Tf_w = [cos(theta5),0,sin(theta5),0;    0,1,0,0;    -sin(theta5),0,cos(theta5),137;  0,0,0,1];
Tt_f = [cos(theta6),-sin(theta6),0,0;   sin(theta6),cos(theta6),0,0;    0,0,1,40;   0,0,0,1];
Ttail= [1,0,0,0;    0,1,0,114;    0,0,1,0;    0,0,0,1];

tail_point = Pb*Ts_b* Ta_s*Te_a*Tw_e*Tf_w*Tt_f*Ttail

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

syms x y z;


%x = 225*cos(theta1)*sin(theta2) - 40*sin(theta5)*(sin(theta1)*sin(theta4) + cos(theta4)*(cos(theta1)*sin(theta2)*sin(theta3) - cos(theta1)*cos(theta2)*cos(theta3))) + 40*cos(theta5)*(cos(theta1)*cos(theta2)*sin(theta3) + cos(theta1)*cos(theta3)*sin(theta2)) + 217*cos(theta1)*cos(theta2)*sin(theta3) + 217*cos(theta1)*cos(theta3)*sin(theta2);
%y = 225*sin(theta1)*sin(theta2) + 40*sin(theta5)*(cos(theta1)*sin(theta4) - cos(theta4)*(sin(theta1)*sin(theta2)*sin(theta3) - cos(theta2)*cos(theta3)*sin(theta1))) + 40*cos(theta5)*(cos(theta2)*sin(theta1)*sin(theta3) + cos(theta3)*sin(theta1)*sin(theta2)) + 217*cos(theta2)*sin(theta1)*sin(theta3) + 217*cos(theta3)*sin(theta1)*sin(theta2);
%z = 225*cos(theta2) + 217*cos(theta2)*cos(theta3) - 217*sin(theta2)*sin(theta3) + 40*cos(theta5)*(cos(theta2)*cos(theta3) - sin(theta2)*sin(theta3)) - 40*cos(theta4)*sin(theta5)*(cos(theta2)*sin(theta3) + cos(theta3)*sin(theta2)) + 264;

x = 225*cos(theta1)*sin(theta2) - 114*cos(theta6)*(cos(theta4)*sin(theta1) - sin(theta4)*(cos(theta1)*sin(theta2)*sin(theta3) - cos(theta1)*cos(theta2)*cos(theta3))) - 40*sin(theta5)*(sin(theta1)*sin(theta4) + cos(theta4)*(cos(theta1)*sin(theta2)*sin(theta3) - cos(theta1)*cos(theta2)*cos(theta3))) + 40*cos(theta5)*(cos(theta1)*cos(theta2)*sin(theta3) + cos(theta1)*cos(theta3)*sin(theta2)) + 114*sin(theta6)*(cos(theta5)*(sin(theta1)*sin(theta4) + cos(theta4)*(cos(theta1)*sin(theta2)*sin(theta3) - cos(theta1)*cos(theta2)*cos(theta3))) + sin(theta5)*(cos(theta1)*cos(theta2)*sin(theta3) + cos(theta1)*cos(theta3)*sin(theta2))) + 217*cos(theta1)*cos(theta2)*sin(theta3) + 217*cos(theta1)*cos(theta3)*sin(theta2)
y = 225*sin(theta1)*sin(theta2) + 114*cos(theta6)*(cos(theta1)*cos(theta4) + sin(theta4)*(sin(theta1)*sin(theta2)*sin(theta3) - cos(theta2)*cos(theta3)*sin(theta1))) + 40*sin(theta5)*(cos(theta1)*sin(theta4) - cos(theta4)*(sin(theta1)*sin(theta2)*sin(theta3) - cos(theta2)*cos(theta3)*sin(theta1))) + 40*cos(theta5)*(cos(theta2)*sin(theta1)*sin(theta3) + cos(theta3)*sin(theta1)*sin(theta2)) - 114*sin(theta6)*(cos(theta5)*(cos(theta1)*sin(theta4) - cos(theta4)*(sin(theta1)*sin(theta2)*sin(theta3) - cos(theta2)*cos(theta3)*sin(theta1))) - sin(theta5)*(cos(theta2)*sin(theta1)*sin(theta3) + cos(theta3)*sin(theta1)*sin(theta2))) + 217*cos(theta2)*sin(theta1)*sin(theta3) + 217*cos(theta3)*sin(theta1)*sin(theta2)
z = 225*cos(theta2) + 217*cos(theta2)*cos(theta3) - 217*sin(theta2)*sin(theta3) + 114*sin(theta6)*(sin(theta5)*(cos(theta2)*cos(theta3) - sin(theta2)*sin(theta3)) + cos(theta4)*cos(theta5)*(cos(theta2)*sin(theta3) + cos(theta3)*sin(theta2))) + 40*cos(theta5)*(cos(theta2)*cos(theta3) - sin(theta2)*sin(theta3)) - 40*cos(theta4)*sin(theta5)*(cos(theta2)*sin(theta3) + cos(theta3)*sin(theta2)) + 114*cos(theta6)*sin(theta4)*(cos(theta2)*sin(theta3) + cos(theta3)*sin(theta2)) + 264





