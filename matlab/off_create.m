clear;
clc;

cnt = 0;

Point = [ 0 0 0 ]

for j = [1:1:10] 
    cnt = cnt + 1;
    
    Point = [ Point ; -0.020 -0.02 -0.0+0.001*j];
    Point = [ Point ;  0.020 -0.02  -0.0+0.001*j];
    Point = [ Point ; -0.020  0.02  -0.0+0.001*j];
    Point = [ Point ;  0.020  0.02 -0.0+0.001*j];
    
end
    


A = [3 0 0 0 ];
for q = [0:1:9]
    A = [A ; 3  8+4*q 4*q+9 4*q+10 ];
    A = [A ; 3  9+4*q 4*q+10 4*q+11 ];
end