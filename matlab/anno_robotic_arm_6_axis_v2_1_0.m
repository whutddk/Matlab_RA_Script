% 安诺6轴机械臂建模
% 武汉理工大学
% 李锐戈

clc;
clear;

syms theta1;
syms theta2;
syms theta3;
syms theta4;
syms theta5;
syms theta6;

%aim point
TB_tail =[1,0,0,-300;  0,1,0,100;  0,0,1,200;  0,0,0,1]; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%DH_TAB = [ 0,0,0,theta1;    -pi/2,0,0,theta2;   0,225,0,theta3; -pi/2,0,217.3,theta4;   pi/2,0,0,theta5;    -pi/2,0,0,theta6 ];


TB_0 = [1,0,0,0;    0,1,0,0;    0,0,1,264;  0,0,0,1];
T6_t = [1,0,0,0;    0,1,0,0;    0,0,1,40+14;   0,0,0,1];


%针对annuo（puma560）化简
T01 = [cos(theta1),-sin(theta1),0,0;    sin(theta1),cos(theta1),0,0;                    0,0,1,0;                          0,0,0,1];
T12 = [cos(theta2),-sin(theta2),0,0;	0,0,1,0;    -sin(theta2),-cos(theta2),0,0;          0,0,0,1];
T23 = [cos(theta3),-sin(theta3),0,225;  sin(theta3),cos(theta3),0,0;                 	0,0,1,0;                          0,0,0,1];
T34 = [cos(theta4),-sin(theta4),0,0;    0,0,1,217.3;    -sin(theta4),-cos(theta4),0,0;      0,0,0,1];
T45 = [cos(theta5),-sin(theta5),0,0;    0,0,-1,0;    sin(theta5),cos(theta5),0,0;          0,0,0,1];
T56 = [cos(theta6),-sin(theta6),0,0;    0,0,1,0;    -sin(theta6),-cos(theta6),0,0;          0,0,0,1];



PB = [1,0,0,0;  0,1,0,0;    0,0,1,0;    0,0,0,1];

%%%求逆 P27页

%%% Ttail_B = TB_0 * T0_6 * T6_tail
%T0_6 = T0_B * Ttail_B * Ttail_6 
T0_B = [1,0,0,0;    0,1,0,0;    0,0,1,-264; 0,0,0,1];
Ttail_6 = [1,0,0,0; 0,1,0,0;    0,0,1,-54;    0,0,0,1];
T0_6 = T0_B * TB_tail * Ttail_6;

%%% 得到0_6坐标,注意，目标方位应该是可以变得才对，需要补充
%P06 = [20;100;82;1];
P06 = T0_6(:,4)

%Ptail =  PB * TB_0 * T01 * T12* T23 * T34 * T45*  T56 * T6_t;




%逆
%T06 = T01 * T12 * T23 * T34 * T45 * T56;
%T46 = T45 * T56;
%T36 = T34 * T46;
T13 = [cos(theta2 + theta3),-sin(theta2 + theta3),0,225*cos(theta2) ;   0,0,1,0;   -sin(theta2 + theta3),-cos(theta2 + theta3),0,-225*sin(theta2);    0,0,0,1];


%T16 = T13 * T36;
%T06 = T01 * T16;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%P0_4 = [x;y;z;1]
%P0_4 = T01 * T12 * T23* [0;217.3;0;1]

F_THREE = T23 * [0;217.3;0;1];
%g123 = T12 * F_THREE;
%XYZ = T01 * g123

%由 X^2 + Y^2 + Z^2 = G1^2 + G2^2 + G3^3

%%整理

f1 = 225 - (217.3*sin(theta3));
f2 = 217.3*cos(theta3);
f3 = 0;

%g123 = T12 * [f1;f2;f3;1]

g1 = - (217.3*cos(theta3)*sin(theta2)) - cos(theta2)*((217.3*sin(theta3)) - 225);
g2 = 0;
g3 = sin(theta2)*((217.3*sin(theta3)) - 225) - (217.3*cos(theta2)*cos(theta3));

%XYZ = T01 * g123;

X4 = -cos(theta1)*((2173*cos(theta3)*sin(theta2))/10 + cos(theta2)*((2173*sin(theta3))/10 - 225));
Y4 = -sin(theta1)*((2173*cos(theta3)*sin(theta2))/10 + cos(theta2)*((2173*sin(theta3))/10 - 225));
Z4 =  sin(theta2)*((2173*sin(theta3))/10 - 225) - (2173*cos(theta2)*cos(theta3))/10;

%a1==0 d2==0
%r= k3 = f1^2+ f2^2 + f3^2 =  |P04|^2 = |P06|^2 = 20^2+100^2+82^2

SIN_THETA3 =  (225^2 +  217.3^2 - (P06(1,1))^2 - (P06(2,1))^2 - (P06(3,1))^2 ) / ( 2*225*217.3 );

%这里要手工判定 * 2，因为失去costheta3的约束，此处符号需要判定，用T13补充约束
theta3_result = pi - asin(SIN_THETA3)



%theta3 load in Z4 

%%sin(theta2)*((2173*sin(theta3_result))/10 - 225) - (2173*cos(theta2)*cos(theta3_result))/10
% sin = 2u/(1+u^2)  cos = (1-u^2)/(1+u^2)  u = tan(theta/2)

%这里要手工判定2次,如何判定？*2 
u = (217.3 * sin(theta3_result) - 225) / (P06(3,1) - 217.3  * cos(theta3_result)) + sqrt( ((217.3*sin(theta3_result) -225)  / ( P06(3,1) - 217.3 * cos(theta3_result)))^2 - ((P06(3,1)+217.3*cos( theta3_result ))/(P06(3,1)-217.3*cos(theta3_result))) );
theta2_result = atan(u)  * 2 ;
%%% Z =   cos(theta2) *  ( -217.3*cos(theta3) )  +    sin(theta2)  *   ( 217.3*sin(theta3) - 225 )
%theta2_result = atan(  ( 217.3*sin(theta3_result) - 225 )  /    ( -217.3*cos(theta3_result) )  )   +      atan(  (sqrt(   ( -217.3*cos(theta3_result) ) ^2     +  ( 217.3*sin(theta3_result) - 225 )^2   -   82^2       )   )   /           (    82       )              )


%用tan来反三角比较合适
%COS_THETA1 = -20 / ( 217.3*cos( theta3_result )*sin(theta2_result) + cos( theta2_result )* ( 217.3*sin(theta3_result) - 225 ) );
%theta1_result  = acos( COS_THETA1 )

%SIN_THETA1 = -100 / ((217.3*cos(theta3_result)*sin(theta2_result)) + cos(theta2_result)*((217.3*sin(theta3_result)) - 225));
%theta1_result = asin(SIN_THETA1)

theta1_result = atan(P06(2,1)/P06(1,1));

%theta2 theta3互相约束

%theta23_result = atan( ( -225*cos(theta3_result)*P06(3,1)+( cos(theta1_result)*P06(1,1) + sin(theta1_result)*P06(2,1)) * ( 225 * sin(theta3_result) -217))             /   (      (225*sin(theta3_result)-217)*P06(3,1) - (225 *cos(theta3_result)*( cos(theta1_result)*P06(1,1)+sin(theta1_result)*P06(2,1)) )))
%theta2_result = theta23_result - theta3_result

%验算前几点
T01 = [cos(theta1_result),-sin(theta1_result),0,0;    sin(theta1_result),cos(theta1_result),0,0;                    0,0,1,0;                          0,0,0,1];
T12 = [cos(theta2_result),-sin(theta2_result),0,0;	0,0,1,0;    -sin(theta2_result),-cos(theta2_result),0,0;          0,0,0,1];
T23 = [cos(theta3_result),-sin(theta3_result),0,225;  sin(theta3_result),cos(theta3_result),0,0;                 	0,0,1,0;                          0,0,0,1];
P6_0 =T01* T12 * T23*[0;217.3;0;1]


%%%%解最后三个角
T01 = [cos(theta1_result),-sin(theta1_result),0,0;    sin(theta1_result),cos(theta1_result),0,0;                    0,0,1,0;                          0,0,0,1];
T12 = [cos(theta2_result),-sin(theta2_result),0,0;	0,0,1,0;    -sin(theta2_result),-cos(theta2_result),0,0;          0,0,0,1];
T23 = [cos(theta3_result),-sin(theta3_result),0,225;  sin(theta3_result),cos(theta3_result),0,0;                 	0,0,1,0;                          0,0,0,1];

T0_3 = T01 * T12 *T23;
R0_6 = T0_6(1:3,1:3);
R0_3 = T0_3(1:3,1:3);
R3_0 = R0_3';
R3_6 = R3_0 * R0_6;

%%% Euler angle

R34 = [cos(theta4),-sin(theta4),0;  sin(theta4),cos(theta4),0;  0,0,1];
R45 = [cos(theta5),0,sin(theta5);    0,1,0;  -sin(theta5),0,cos(theta5)];
R56 = [cos(theta6),-sin(theta6),0;	sin(theta6),cos(theta6),0;	0,0,1];

% R34*R45*R56 = R3_6;
R34*R45*R56;

theta5_result = acos(0);

% 解下一个

R34 = [cos(theta4),-sin(theta4),0;  sin(theta4),cos(theta4),0;  0,0,1];
R45 = [cos(theta5_result),0,sin(theta5_result);    0,1,0;  -sin(theta5_result),0,cos(theta5_result)];
R56 = [cos(theta6),-sin(theta6),0;	sin(theta6),cos(theta6),0;	0,0,1];

R34*R45*R56;

%theta6_result = acos(0.9806)
%sin(theta6) = -0.1961
%asin(-0.1961)

%用atan去判定正负
theta6_result = atan( 0.1961/-0.9806 );

R34 = [cos(theta4),-sin(theta4),0;  sin(theta4),cos(theta4),0;  0,0,1];
R45 = [cos(theta5_result),0,sin(theta5_result);    0,1,0;  -sin(theta5_result),0,cos(theta5_result)];
R56 = [cos(theta6_result),-sin(theta6_result),0;	sin(theta6_result),cos(theta6_result),0;	0,0,1];

R34*R45*R56;



theta4_result = atan( 0.9075 / 0.4201);

%%%验算

TB_0 = [1,0,0,0;    0,1,0,0;    0,0,1,264;  0,0,0,1];
T6_t = [1,0,0,0;    0,1,0,0;    0,0,1,40+14;   0,0,0,1];
T01 = [cos(theta1_result),-sin(theta1_result),0,0;    sin(theta1_result),cos(theta1_result),0,0;                    0,0,1,0;                          0,0,0,1];
T12 = [cos(theta2_result),-sin(theta2_result),0,0;	0,0,1,0;    -sin(theta2_result),-cos(theta2_result),0,0;          0,0,0,1];
T23 = [cos(theta3_result),-sin(theta3_result),0,225;  sin(theta3_result),cos(theta3_result),0,0;                 	0,0,1,0;                          0,0,0,1];
T34 = [cos(theta4_result),-sin(theta4_result),0,0;    0,0,1,217.3;    -sin(theta4_result),-cos(theta4_result),0,0;      0,0,0,1];
T45 = [cos(theta5_result),-sin(theta5_result),0,0;    0,0,-1,0;    sin(theta5_result),cos(theta5_result),0,0;          0,0,0,1];
T56 = [cos(theta6_result),-sin(theta6_result),0,0;    0,0,1,0;    -sin(theta6_result),-cos(theta6_result),0,0;          0,0,0,1];

P0_6 =  T01 * T12 * T23 * T34 * T45 * T56;
