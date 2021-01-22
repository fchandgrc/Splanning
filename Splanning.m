clc;
clear;
jerk = ;
max_a = ;
max_v = ;
target_a = 
target_v =
target_s =[0];

begin_a = ;
begin_v = ;
begin_s =[0];

t = 2*(target_s-begin_s)/max_v;

para = [(6*(target_s-begin_s)-3*(target_v + begin_v)* T +(target_a - begin_a)*(T^2)/2)/(T^5),
         (15*(begin_s-target_s)+(7*target_v+8*begin_v)*T+(3*begin_a-2*target_a)*(T^2)/2)/(T^4),
         (10*(target_s-begin_s)-(4*target_v+6*begin_v)*T+(target_a-3*begin_a)*(T^2)/2)/(T^3),
         begin_a/2,
         begin_v,
         begin_s];
count = 50;
solve1 = [];
for i=0:1:count-1
   delta = t/count;
   if fun(delta*i,para)*fun(delta*(i+1),para)<0
      x = delta*i;
      while abs(fun(x,para)-0)>0.01
          x = x - fun(x,para)/fund(x,para);     
      end
      solve1 = [solve1,x];
   end
end





% %保证jerk足够大，加速过程是梯形的
% if jerk<3*max_a*max_a/(4*(max_v-begin_v))
%     jerk = 3*max_a*max_a/(4*(max_v-begin_v));
% end
% 
% 
% 
% t1 = (max_a - begin_a)/jerk;
% t3 = max_a/jerk;
% t2 = ((max_v - begin_v) - 0.5*(begin_a + max_a)*t1 - 0.5*max_a*t3)/max_a;
% t5 = max_a/jerk;
% t7 = max_a/jerk;
% t6 = (max_v - max_a*max_a/jerk)/max_a;
% t4 = (target_s - ((1/6)*jerk*t1^3 + (1/2)*begin_a*t1^2 + begin_v*t1 + (1/2) * t2*(begin_a - max_a) + (1/2)*max_a*t2^2 +(1/2)*t3*t1*(begin_a + max_a)+max_a*t2*t3+(1/2)*max_a*t3^2-(1/6)*jerk*t3^3)- (max_v*t5-(1/6)*jerk*t5^3+(max_v-0.5*jerk*t5^2)*t6-0.5*max_a*t6^2+(1/6)*jerk*t7^3))/max_v;
% 
% t11 = (max_a-begin_a)/jerk;
% t13 = max_a/jerk;
% t15 = max_a/jerk;
% t17 = max_a/jerk;
% ss1 = ((1/6)*jerk*t1^3 + (1/2)*begin_a*t1^2 + begin_v*t1 + (1/2) * t2*(begin_a - max_a) + (1/2)*max_a*t2^2 +(1/2)*t3*t1*(begin_a + max_a)+max_a*t2*t3+(1/2)*max_a*t3^2-(1/6)*jerk*t3^3)- (max_v*t5-(1/6)*jerk*t5^3+(max_v-0.5*jerk*t5^2)*t6-0.5*max_a*t6^2+(1/6)*jerk*t7^3);
% ss2 = 





%位移大的情况