% ��ŵ6���е��PRM�㷨EDGE���ұ�����
% �人����ѧ
% �����
clear;
clc;

precision = 5;
space_length = 1000;
edge_require = 1024;

Pose = [0,0,0,0,0,0];
Truetable = [false(32768,1)];
Pose_sum = 1;


edge_cnt = 0;
X = 0;
Y = 0;
Z = 0;

%��edge_cnt �� edge_require
%while (edge_cnt < edge_require)
    %�������6ά��
    shoulderAngle = randi ([-27000,9000])/100;
    armAngle = randi ([0,18000])/100;
    elbowAngle = randi ([0,18000])/100;
    wristAngle = randi ([-18000,18000])/100;
    fingerAngle =  randi ([-9000,9000])/100;
    toolAngle = randi ([-18000,18000])/100;
    
    endPose = [shoulderAngle armAngle elbowAngle wristAngle fingerAngle toolAngle];
    Pose = [Pose;endPose];
    
    Pose_sum = Pose_sum+ 1;
    
    %�������С����̬��
    Pose_cnt = 1;
    while( Pose_cnt < Pose_sum  )
        tab = [false(32768,1)];
                        %���6ά��͵�ǰ��ǰ�����е�ľ��룬�����Լ�
        startPose = Pose(Pose_cnt ,:);
        
        %6ά�����ǣ���1K����
        shorderDis = (startPose(1) - endPose(1)) / 1000;
        armDis = (startPose(2) - endPose(2)) / 1000;
        elbowDis = (startPose(3) - endPose(3)) / 1000;
        wristDis = (startPose(4) - endPose(4)) / 1000;
        fingerDis = (startPose(5) - endPose(5)) / 1000;
        toolDis = (startPose(6) - endPose(6)) / 1000;
        
        for ( i = 1:1:1000 )
            
            
        end
        
        
        
                        %����Ҫ�����Ҫ�󣨿��Բ��ܣ���Ϊ�ǲ��ұ�����ȫ���ӣ�
    %��ʼXYZ���������е�ǶȲ�����
    %��ʼ����XYZդ������룬���ϵ�դ����XYZ�����1��
    %����դ��ļ������󣩶�Ӧһ��·����EDGE����ţ�����β�ڵ���Ϣ
    %����XYZ������1*32786���־���
    
    
    Pose_cnt = Pose_cnt + 1;
    edge_cnt = edge_cnt + 1;
    end
%end
