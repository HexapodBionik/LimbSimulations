% Beware there are no variable validations in this code whatsoever 

classdef RoboticArm
    properties
        t1
        t2
        t3
        ma2
        ma3
    end

    methods
        function obj = RoboticArm(t1,t2,t3,ma2,ma3)
            obj.t1 = t1;
            obj.t2 = t2;
            obj.t3 = t3;
            obj.ma2 = ma2;
            obj.ma3 = ma3;
        end

        function H = forward(obj,q1,q2,q3)
            % Calculate intermediate transformation matrices
            H = rot_z(q1);
            H = H * trans(obj.t1);
            H = H * rot_x(90);
            H = H * rot_z(q2 + obj.ma2);
            H = H * trans(obj.t2);
            H = H * rot_z(q3 + obj.ma3);
            H = H * trans(obj.t3);
            H = H * rot_z(180);
            
            % Combine the transformations step by step
            % H = Rz_q1 * T_t1 * Rx_90 * Rz_q2_ma2 * T_t2 * Rz_q3_ma3 * T_t3 * Rz_90;

            % H = rot_z(q1)*trans(obj.t1)*rot_x(90)*rot_z(q2+obj.ma2)*trans(obj.t2)*rot_z(q3+obj.ma3)*trans(obj.t3)*rot_z(90);
        end
        function q = inverse(obj,v)
            % l1 = norm(obj.t1(1:3));
            l2 = norm(obj.t2(1:3));
            l3 = norm(obj.t3(1:3));
            x = v(1);
            y = v(2);
            % z = v(3);

            if x == 0
                q1 = (pi/2) * sign(y);
            else
                q1 = atan2d(y, x);
            end
            v = rot_z(-q1)*v';
            x = v(1)-obj.t1(1);
            % y = v(2);
            z = v(3)-obj.t1(3);
            
            q2 = obj.ma2;
            
            if x == 0
                q2 = q2 + (90) * sign(z);
            else
                q2 = q2 + atan2d(z, x);
            end
            
            q2 = q2 + acosd((l2^2 + x^2 + z^2 - l3^2) / (2 * l2 * sqrt(x^2 + z^2)));

            q3 = -obj.ma3;
            
            q3 = q3 + acosd((l2^2 + l3^2 - x^2 - z^2) / (2 * l2 * l3)) - 180;

            q = [q1 q2 q3];
        end
    end
end


function T = trans(v)
    T = [1 0 0 v(1); 0 1 0 v(2); 0 0 1 v(3); 0 0 0 1];
end

function T = rot_x(alpha)
T = [1 0 0 0; 0 cosd(alpha) -sind(alpha) 0; 0 sind(alpha) cosd(alpha) 0; 0 0 0 1];
end

function T = rot_z(alpha)
    T = [cosd(alpha), -sind(alpha) 0 0; sind(alpha) cosd(alpha) 0 0; 0 0 1 0; 0 0 0 1];
end

