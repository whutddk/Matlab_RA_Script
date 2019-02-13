% ��ŵ6���е�۽�ģ
% �人����ѧ
% �����

clc;
clear;

%aim point
TB_tail =[1,0,0,300;  0,1,0,100;  0,0,1,200;  0,0,0,1]; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%DH_TAB = [ 0,0,0,theta1;    -pi/2,0,0,theta2;   0,225,0,theta3; -pi/2,0,217.3,theta4;   pi/2,0,0,theta5;    -pi/2,0,0,theta6 ];


TB_0 = [1,0,0,0;    0,1,0,0;    0,0,1,264;  0,0,0,1];
T6_t = [1,0,0,0;    0,1,0,0;    0,0,1,40+14;   0,0,0,1];

PB = [1,0,0,0;  0,1,0,0;    0,0,1,0;    0,0,0,1];

T0_B = [1,0,0,0;    0,1,0,0;    0,0,1,-264; 0,0,0,1];
Ttail_6 = [1,0,0,0; 0,1,0,0;    0,0,1,-54;    0,0,0,1];
T0_6 = T0_B * TB_tail * Ttail_6;

P06 = T0_6(:,4)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
theta1_result = atan(P06(2,1)/P06(1,1));


SIN_THETA3 =  (225^2 +  217.3^2 - (P06(1,1))^2 - (P06(2,1))^2 - (P06(3,1))^2 ) / ( 2*225*217.3 );

%����Ҫ�ֹ��ж� * 2����Ϊʧȥcostheta3��Լ�����˴�������Ҫ�ж�����T13����Լ��
theta3_result = asin(SIN_THETA3)

%����Ҫ�ֹ��ж�2��,����ж���*2 
u = (217.3 * sin(theta3_result) - 225) / (P06(3,1) - 217.3  * cos(theta3_result)) - sqrt( ((217.3*sin(theta3_result) -225)  / ( P06(3,1) - 217.3 * cos(theta3_result)))^2 - ((P06(3,1)+217.3*cos( theta3_result ))/(P06(3,1)-217.3*cos(theta3_result))) );

theta2_result = atan(u)  * 2 ;



%����ǰ����
T01 = [cos(theta1_result),-sin(theta1_result),0,0;    sin(theta1_result),cos(theta1_result),0,0;                    0,0,1,0;                          0,0,0,1];
T12 = [cos(theta2_result),-sin(theta2_result),0,0;	0,0,1,0;    -sin(theta2_result),-cos(theta2_result),0,0;          0,0,0,1];
T23 = [cos(theta3_result),-sin(theta3_result),0,225;  sin(theta3_result),cos(theta3_result),0,0;                 	0,0,1,0;                          0,0,0,1];
P6_0 =T01* T12 * T23*[0;217.3;0;1]


