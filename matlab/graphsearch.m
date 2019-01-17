% ͼ����ģ��
% �人������ѧ
% �����

clc;
clear;

Pose = rand(66,2) * 100;

scatter(Pose(:,1),Pose(:,2));

edgeMask = [1  2;0  3;1  3;2  3;1  4;2  4;1  6;2  6;4  6;1  7;4  7;5  7;1  8;2  8;4  8;6  8;7  8;4  9;5  9;6  9;8  9;1  10;3  10;9  10;1  11;2  11;4  11;6  11;7  11;8  11;0  12;1  12;2  12;4  12;6  12;8  12;10  12;11  12;3  13;9  13;10  13;1  14;4  14;6  14;8  14;10  14;11  14;12  14;0  15;1  15;2  15;3  15;10  15;12  15;13  15;14  15;0  16;1  16;2  16;3  16;4  16;6  16;8  16;10  16;11  16;12  16;14  16;15  16;1  17;4  17;7  17;8  17;11  17;12  17;14  17;16  17;7  18;17  18;7  19;14  19;17  19;18  19;7  20;14  20;15  20;17  20;18  20;19  20;1  21;3  21;4  21;10  21;13  21;14  21;15  21;16  21;18  21;20  21;4  22;5  22;7  22;10  22;14  22;17  22;18  22;20  22;21  22;1  23;2  23;4  23;5  23;6  23;7  23;8  23;11  23;12  23;14  23;15  23;17  23;20  23;21  23;22  23;1  24;2  24;4  24;6  24;8  24;9  24;10  24;11  24;16  24;23  24;2  25;5  25;9  25;10  25;13  25;24  25;4  26;5  26;7  26;8  26;9  26;10  26;11  26;13  26;21  26;22  26;23  26;24  26;25  26;7  27;14  27;15  27;17  27;18  27;19  27;20  27;21  27;22  27;5  28;13  28;18  28;19  28;20  28;22  28;27  28;1  29;2  29;3  29;4  29;6  29;7  29;8  29;9  29;10  29;11  29;12  29;14  29;15  29;16  29;17  29;21  29;22  29;23  29;24  29;25  29;26  29;0  30;1  30;3  30;4  30;6  30;8  30;10  30;11  30;12  30;14  30;15  30;16  30;17  30;19  30;20  30;21  30;23  30;27  30;29  30;1  31;2  31;4  31;6  31;7  31;8  31;10  31;11  31;12  31;14  31;15  31;16  31;17  31;19  31;20  31;21  31;22  31;23  31;27  31;29  31;30  31;5  32;9  32;10  32;13  32;15  32;21  32;22  32;23  32;25  32;26  32;28  32;1  33;2  33;3  33;4  33;6  33;7  33;8  33;10  33;11  33;12  33;13  33;14  33;15  33;16  33;17  33;21  33;22  33;23  33;24  33;26  33;29  33;30  33;31  33;32  33;5  34;7  34;9  34;10  34;13  34;17  34;21  34;22  34;23  34;25  34;26  34;28  34;32  34;33  34;3  35;9  35;10  35;13  35;15  35;21  35;24  35;25  35;26  35;32  35;1  36;2  36;4  36;7  36;8  36;10  36;11  36;12  36;14  36;15  36;16  36;17  36;20  36;21  36;22  36;23  36;24  36;26  36;29  36;30  36;31  36;32  36;33  36;34  36;0  37;14  37;17  37;18  37;19  37;20  37;27  37;28  37;30  37;31  37;1  38;4  38;7  38;8  38;11  38;12  38;14  38;15  38;16  38;17  38;18  38;19  38;20  38;21  38;22  38;23  38;27  38;29  38;30  38;31  38;32  38;33  38;34  38;36  38;37  38;0  39;14  39;17  39;18  39;19  39;20  39;27  39;30  39;31  39;37  39;38  39;1  40;2  40;4  40;6  40;8  40;11  40;12  40;14  40;16  40;17  40;23  40;24  40;26  40;29  40;30  40;31  40;33  40;36  40;38  40;7  41;10  41;14  41;15  41;17  41;18  41;19  41;20  41;21  41;22  41;23  41;27  41;28  41;30  41;31  41;32  41;33  41;34  41;36  41;37  41;38  41;39  41;18  42;19  42;20  42;22  42;27  42;28  42;32  42;34  42;37  42;41  42;1  43;2  43;4  43;6  43;8  43;9  43;10  43;11  43;13  43;15  43;16  43;21  43;22  43;23  43;24  43;25  43;26  43;29  43;33  43;34  43;35  43;36  43;1  44;4  44;7  44;8  44;9  44;10  44;11  44;12  44;13  44;14  44;15  44;16  44;17  44;21  44;22  44;23  44;24  44;25  44;26  44;29  44;30  44;31  44;32  44;33  44;34  44;35  44;36  44;38  44;41  44;43  44;10  45;13  45;18  45;21  45;22  45;26  45;28  45;32  45;34  45;35  45;39  45;41  45;42  45;1  46;2  46;3  46;4  46;6  46;7  46;8  46;9  46;10  46;11  46;12  46;13  46;14  46;15  46;16  46;17  46;21  46;22  46;23  46;24  46;25  46;26  46;29  46;30  46;31  46;32  46;33  46;34  46;36  46;38  46;40  46;41  46;43  46;44  46;3  47;10  47;13  47;15  47;21  47;25  47;28  47;32  47;35  47;42  47;43  47;44  47;45  47;1  48;2  48;3  48;4  48;6  48;7  48;8  48;10  48;11  48;12  48;14  48;15  48;16  48;17  48;20  48;21  48;22  48;23  48;26  48;27  48;29  48;30  48;31  48;32  48;33  48;34  48;36  48;38  48;40  48;41  48;43  48;44  48;46  48;1  49;2  49;3  49;4  49;6  49;7  49;8  49;9  49;10  49;11  49;12  49;15  49;16  49;21  49;22  49;23  49;24  49;25  49;26  49;29  49;31  49;33  49;35  49;36  49;38  49;40  49;43  49;44  49;46  49;48  49;5  50;7  50;9  50;10  50;13  50;15  50;17  50;21  50;22  50;23  50;25  50;26  50;28  50;31  50;32  50;33  50;34  50;35  50;36  50;38  50;41  50;42  50;44  50;45  50;46  50;47  50;48  50;4  51;5  51;7  51;8  51;9  51;11  51;22  51;23  51;24  51;25  51;26  51;29  51;32  51;33  51;34  51;36  51;38  51;40  51;43  51;44  51;46  51;48  51;49  51;50  51;7  52;10  52;15  52;17  52;18  52;19  52;20  52;21  52;22  52;23  52;27  52;28  52;32  52;33  52;34  52;36  52;37  52;38  52;39  52;41  52;42  52;44  52;45  52;48  52;50  52;1  53;4  53;6  53;7  53;10  53;11  53;12  53;14  53;15  53;16  53;17  53;19  53;20  53;21  53;22  53;23  53;27  53;30  53;31  53;32  53;33  53;36  53;37  53;38  53;39  53;40  53;41  53;46  53;48  53;50  53;52  53;0  54;1  54;2  54;3  54;6  54;10  54;11  54;12  54;13  54;14  54;15  54;16  54;19  54;20  54;21  54;27  54;29  54;30  54;31  54;33  54;37  54;39  54;46  54;47  54;48  54;49  54;53  54;10  55;13  55;15  55;18  55;21  55;22  55;26  55;28  55;32  55;34  55;35  55;36  55;41  55;42  55;44  55;45  55;47  55;50  55;52  55;3  56;7  56;14  56;15  56;17  56;18  56;19  56;20  56;21  56;22  56;23  56;27  56;28  56;30  56;31  56;36  56;37  56;38  56;39  56;41  56;42  56;45  56;48  56;52  56;53  56;54  56;55  56;3  57;4  57;7  57;10  57;13  57;14  57;15  57;17  57;18  57;19  57;20  57;21  57;22  57;23  57;27  57;28  57;29  57;30  57;31  57;32  57;33  57;34  57;36  57;37  57;38  57;39  57;41  57;42  57;44  57;45  57;46  57;48  57;49  57;50  57;51  57;52  57;53  57;54  57;55  57;56  57;1  58;2  58;4  58;6  58;7  58;8  58;11  58;12  58;14  58;16  58;17  58;21  58;23  58;26  58;29  58;30  58;31  58;33  58;36  58;38  58;40  58;43  58;44  58;46  58;48  58;49  58;53  58;54  58;3  59;9  59;10  59;13  59;15  59;21  59;24  59;25  59;26  59;29  59;32  59;33  59;34  59;35  59;36  59;43  59;44  59;45  59;46  59;47  59;48  59;49  59;50  59;54  59;55  59;57  59;1  60;2  60;5  60;9  60;10  60;13  60;23  60;24  60;25  60;26  60;29  60;32  60;33  60;34  60;35  60;36  60;43  60;44  60;46  60;47  60;49  60;50  60;51  60;59  60;1  61;2  61;3  61;4  61;6  61;7  61;8  61;10  61;11  61;12  61;13  61;14  61;15  61;16  61;17  61;19  61;20  61;21  61;22  61;23  61;27  61;29  61;30  61;31  61;32  61;33  61;36  61;38  61;40  61;41  61;44  61;46  61;48  61;49  61;50  61;52  61;53  61;54  61;56  61;57  61;58  61;59  61;1  62;2  62;4  62;5  62;6  62;8  62;9  62;10  62;11  62;13  62;15  62;21  62;23  62;24  62;25  62;26  62;29  62;33  62;34  62;35  62;36  62;40  62;43  62;44  62;46  62;49  62;51  62;58  62;59  62;60  62;1  63;4  63;7  63;8  63;11  63;12  63;14  63;16  63;17  63;19  63;20  63;22  63;23  63;27  63;29  63;30  63;31  63;33  63;34  63;36  63;37  63;38  63;39  63;40  63;41  63;44  63;46  63;48  63;52  63;53  63;56  63;57  63;58  63;61  63;0  64;3  64;10  64;13  64;15  64;16  64;18  64;21  64;29  64;33  64;35  64;36  64;42  64;43  64;44  64;45  64;46  64;47  64;48  64;49  64;52  64;54  64;55  64;56  64;57  64;59  64;61  64;62  64;1  65;2  65;4  65;6  65;8  65;11  65;12  65;14  65;16  65;17  65;23  65;24  65;26  65;29  65;30  65;31  65;33  65;36  65;38  65;40  65;43  65;44  65;46  65;48  65;49  65;51  65;53  65;54  65;58  65;61  65;62  65;63  65];

plot(Pose(:,1),Pose(:,2),'o-');


activePose = [];
activePose = [activePose; Pose(1,:)];

%for edgeMask %one lever
for i = 1:1:1024
    %for pose
    selectPoseNumA = edgeMask( i,1 )
    selectPoseNumB = edgeMask( i,2 )
    for j = 1:1:66

        %if active and if single
        if ( Pose(selectPoseNumA,1) )
        
        
        end
    end
end




