t1 = [1 0 0 1];
t2 = [1 0 0 1];
t3 = [1 0 0 1];
ma2 = 0;
ma3 = -90;

arm = RoboticArm(t1,t2,t3,ma2,ma3);

a =arm.forward(0, 0 ,0);
b = arm.inverse ([2 0 -1 1] );
a =arm.forward(0, -90 , 0);
b = arm.inverse([0 0 -1 1]);
a = arm.forward(0, 0 , 90);

