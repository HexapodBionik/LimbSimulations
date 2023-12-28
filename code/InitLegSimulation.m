Mount_Block = [0.02 0.02 0.05];
Link1_Body_X =[0.05 0.01 0.01];
Link1_Body_Y=[0.01 0.01 0.035];
Thigh = [0.09 0.01 0.01];
Shank =[0.1 0.01 0.01];

mount = [0 0 Mount_Block(3) 1];
t1 = [Link1_Body_X(1) 0 Link1_Body_Y(3) 1];
t2 = [Thigh(1) 0 0 1];
t3 = [Shank(1) 0 0 1];
ma2 = 0;
ma3 = 0;
save("test.mat","ma3","ma2","t3","t2","t1","mount");


x = [0 0;0.5 0.3];
y = [0 0;1 1.3];
z = [0 0;1 1];