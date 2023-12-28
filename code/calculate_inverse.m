function q = calculate_inverse(v)

testing = importdata("test.mat");

t1 = testing.t1;
t2 = testing.t2;
t3 = testing.t3;
ma2 = testing.ma2;
ma3 = testing.ma3;
mount = testing.mount;

Limb = RoboticLimb(mount,t1,t2,t3,ma2,ma3);
v(4) = 1;
q = Limb.inverse(v');
end